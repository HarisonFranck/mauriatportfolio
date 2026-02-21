import "jsr:@supabase/functions-js/edge-runtime.d.ts"
const GEMINI_API_KEY = Deno.env.get("GEN_AI_API_KEY");
const MODEL_NAME = "gemini-2.5-flash"; // Fixed for stability

Deno.serve(async (req) => {
    // Handle CORS
    if (req.method === 'OPTIONS') {
        return new Response('ok', {
            headers: {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Methods': 'POST',
                'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
            },
        });
    }

    try {
        const { message, systemPrompt } = await req.json();

        if (!message) {
            return new Response(JSON.stringify({ error: 'Message is required' }), {
                status: 400,
                headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
            });
        }

        const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL_NAME}:generateContent?key=${GEMINI_API_KEY}`;

        const response = await fetch(apiUrl, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                contents: [
                    {
                        role: "user",
                        parts: [{ text: message }],
                    },
                ],
                systemInstruction: systemPrompt ? {
                    parts: [{ text: systemPrompt }]
                } : undefined,
            }),
        });

        const data = await response.json();

        if (data.error) {
            throw new Error(data.error.message || 'Error from Gemini API');
        }

        const aiResponse = data.candidates?.[0]?.content?.parts?.[0]?.text || "I'm sorry, I couldn't understand that.";

        return new Response(JSON.stringify({ response: aiResponse }), {
            headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
        });
    } catch (error) {
        return new Response(JSON.stringify({ error: error.message }), {
            status: 500,
            headers: { 'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*' },
        });
    }
});
