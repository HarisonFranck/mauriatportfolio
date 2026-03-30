class PortfolioData {
  static String getIdentity(String lang) {
    if (lang == 'fr') {
      return """
**Nom :** Harison Franck Mauriat
**Rôle :** Développeur Flutter Expert | Étudiant en M1 IA & Big Data (IT University)
**Lieu :** Madagascar
**Résumé :** Étudiant en Master 1 à l'IT University Andoharanofotsy (IA & Big Data) et développeur Flutter expert spécialisé dans la création d'applications mobiles performantes et fluides.
""";
    } else {
      return """
**Name:** Harison Franck Mauriat
**Role:** Expert Flutter Developer | M1 AI & Big Data Student (IT University)
**Location:** Madagascar
**Summary:** Master 1 student at IT University Andoharanofotsy (AI & Big Data) and expert Flutter developer specializing in creating fluid and performant mobile applications.
""";
    }
  }

  static String getContact(String lang) {
    // Contact info is mostly improved by not translating labels if they are standard,
    // but for "Phone" vs "Téléphone" it matters.
    if (lang == 'fr') {
      return """
**Email :** hmauriatfranck@gmail.com
**Téléphone :** +261 34 56 241 03
**GitHub :** [HarisonFranck](https://github.com/HarisonFranck/)
**LinkedIn :** [Mauriat Franck](https://www.linkedin.com/in/mauriat-franck-462640272/)
""";
    } else {
      return """
**Email:** hmauriatfranck@gmail.com
**Phone:** +261 34 56 241 03
**GitHub:** [HarisonFranck](https://github.com/HarisonFranck/)
**LinkedIn:** [Mauriat Franck](https://www.linkedin.com/in/mauriat-franck-462640272/)
""";
    }
  }

  static String getSkills(String lang) {
    if (lang == 'fr') {
      return """
⚙️ Compétences Techniques

Mobile & Frontend :
- Flutter (avancé)
- Dart
- FlutterFlow (développement rapide & intégrations)
- UI réactive & multiplateforme
- Implémentation UI depuis maquettes
- Optimisation UX pour l'utilisabilité mobile

Architecture & Ingénierie :
- Principes Clean Architecture
- Gestion d'état (BLoC)
- Structuration d'applications évolutives
- Optimisation des performances
- Stratégies Offline-first & synchronisation

Backend & Intégration :
- Intégration API REST
- Écosystème Firebase : Authentification, Firestore, Cloud Messaging (notifications push)
- Stockage local SQLite
- Stratégies de synchronisation des données

Outils & Workflow :
- Contrôle de version Git
- Tests & débogage API
- Pensée Agile & livraison itérative
""";
    } else {
      return """
⚙️ Technical Skills

Mobile & Frontend:
- Flutter (advanced)
- Dart
- FlutterFlow (rapid development & integrations)
- Responsive & cross-platform UI
- UI implementation from design mockups
- UX optimization for mobile usability

Architecture & Engineering:
- Clean Architecture principles
- State management (BLoC)
- Scalable app structuring
- Performance optimization
- Offline-first & sync strategies

Backend & Integration:
- REST API integration
- Firebase ecosystem: Authentication, Firestore, Cloud Messaging (push notifications)
- SQLite local storage
- Data synchronization strategies

Tools & Workflow:
- Git version control
- API testing & debugging
- Agile thinking & iterative delivery
""";
    }
  }

  static String getProjects(String lang) {
    if (lang == 'fr') {
      return """
🚀 Projets Clés

1. MedScheduler (Projet de fin d'études)
   - Description : Application mobile de prise de rendez-vous pour cliniques privées.
   - Responsabilités : 
     - Développement mobile (Flutter)
     - Intégration API avec backend Symfony
     - Notifications push via Firebase Cloud Messaging
     - Ajout de fonctionnalités d'analyse & statistiques au-delà des exigences
   - Impact : Initiative démontrée, pensée produit et utilisabilité réelle.
   - Lien : https://github.com/HarisonFranck/Med-Scheduler-Front.git

2. To-Develop-Our-List (App de Gestion Tâches & Projets) (Eisen Task / TeamTech)
   - Type : Outil de productivité & collaboration multiplateforme
   - Objectifs : Gestion de tâches, projets & personnel, usage personnel & professionnel, suivi d'avancement, collaboration d'équipe.
   - Évolution technique : Refonte Clean Architecture, synchro Firestore remplaçant le stockage local, CRUD hors ligne, UI/UX améliorée, extension support Web & Linux.
   - Focus : Performance, flexibilité, conception de données évolutive.
   - Lien : https://github.com/HarisonFranck/EisenTask.git

3. Portfolio Platform
   - Focus : Maquettes personnalisées & présentation UI, démonstration de pensée produit, expertise multiplateforme.

4. Shalom App (App de Paroles)
   - Description : Application de recherche de paroles de chants Gospel pour une chorale, avec synchronisation serveur.
   - Stack : Flutter, Supabase, SQLite
   - Lien : https://github.com/HarisonFranck/Shalom-App.git
""";
    } else {
      return """
🚀 Key Projects

1. MedScheduler (Graduation Project)
   - Description: Appointment scheduling mobile app for private clinics.
   - Responsibilities: 
     - Mobile app development (Flutter)
     - API integration with Symfony backend
     - Push notifications using Firebase Cloud messaging
     - Added analytics & statistics feature beyond requirements
   - Impact: Demonstrated initiative, product thinking, and real-world usability.
   - Link: https://github.com/HarisonFranck/Med-Scheduler-Front.git

2. To-Develop-Our-List (Task & Project Management App) (Eisen Task / TeamTech)
   - Type: Multiplatform productivity & collaboration tool
   - Goals: Task, project & personnel management, personal & professional usage, assignment & progress tracking, team collaboration.
   - Technical evolution: Clean architecture redesign, Firestore sync replacing local-only storage, Offline CRUD capability, Improved UI/UX, Web & Linux support expansion.
   - Focus: Performance, flexibility, scalable data design.
   - Link: https://github.com/HarisonFranck/EisenTask.git

3. Portfolio Platform
   - Focus: Custom mockups & UI presentation, demonstrating product thinking, showcasing cross-platform expertise.

4. Shalom App (Lyrics App)
   - Description: Gospel song lyrics search application for a choir, enabling synchronization with an online server.
   - Stack: Flutter, Supabase, SQLite
   - Link: https://github.com/HarisonFranck/Shalom-App.git
""";
    }
  }

  static String getExperience(String lang) {
    if (lang == 'fr') {
      return """
💼 Expérience Professionnelle & Forces

Développement Mobile :
- Construction d'apps mobiles prêtes pour la production
- Intégration de services backend & API
- Traduction des besoins métier en fonctionnalités fonctionnelles

Pensée Produit :
- Focus sur la valeur utilisateur plutôt que le choix technologique
- Capacité à ajouter des fonctionnalités pertinentes au-delà des specs
- Conception pour l'utilisabilité et les flux de travail réels

Résolution de Problèmes :
- Identification précoce des limitations architecturales
- Amélioration des systèmes pour la scalabilité & synchronisation
- Optimisation de la performance & maintenabilité
""";
    } else {
      return """
💼 Professional Experience & Strengths

Mobile Development:
- Building production-ready mobile apps
- Integrating backend services & APIs
- Translating business needs into functional features

Product Thinking:
- Focus on user value over technology choice
- Ability to add meaningful features beyond specs
- Designing for usability and real-world workflows

Problem Solving:
- Identifies architectural limitations early
- Improves systems for scalability & synchronization
- Optimizes performance & maintainability
""";
    }
  }

  static String getDifferentiators(String lang) {
    if (lang == 'fr') {
      return """
🧩 Différenciateurs (Ce qui me distingue)
- Esprit hybride mobile + backend
- Développeur orienté produit, pas juste un constructeur de fonctionnalités
- Fort focus sur l'architecture & la scalabilité
- Expérience avec le code Flutter manuel & FlutterFlow
- Amélioration continue & pensée de refonte système

🚀 Vision Stratégique :
- Pourquoi le Mobile ? Pour moi, le mobile est le point de contact le plus intime et immédiat avec l'utilisateur. Flutter permet de créer cette proximité avec une performance native.
- Pourquoi l'IA & Big Data ? C'est la suite logique du développement. Créer des apps c'est bien, mais les rendre intelligentes et capables de traiter des données massives pour aider à la décision, c'est ce qui transforme un outil en une solution indispensable.
""";
    } else {
      return """
🧩 Differentiators (What makes you stand out)
- Hybrid mobile + backend mindset
- Product-oriented developer, not just feature builder
- Strong focus on architecture & scalability
- Experience with both manual Flutter coding & FlutterFlow
- Continuous improvement & system redesign thinking

🚀 Strategic Vision:
- Why Mobile? For me, mobile is the most intimate and immediate touchpoint with the user. Flutter allows creating that proximity with native performance.
- Why AI & Big Data? It's the logical next step in development. Building apps is great, but making them intelligent and capable of processing massive data to aid decisions is what transforms a tool into an indispensable solution.
""";
    }
  }

  static String getLearningGrowth(String lang) {
    if (lang == 'fr') {
      return """
📈 Apprentissage Actuel & Zones de Croissance
- Gestion d'état avancée & patterns d'architecture
- Stratégies de synchronisation évolutives
- Psychologie UX & engagement utilisateur
- Construction de schémas de base de données flexibles
- Pensée d'architecture de solution
""";
    } else {
      return """
📈 Current Learning & Growth Areas
- Advanced state management & architecture patterns
- Scalable synchronization strategies
- UX psychology & user engagement
- Building flexible database schemas
- Solution architecture thinking
""";
    }
  }

  static String getSystemPrompt(String lang) {
    if (lang == 'fr') {
      return """
Vous êtes l'assistant IA du portfolio de Mauriat Franck.
Votre objectif est de répondre aux questions sur Mauriat, ses compétences, ses projets et son expérience, UNIQUEMENT basé sur le contexte suivant.
Soyez professionnel, amical et concis.
Utilisez le format Markdown pour vos réponses (gras, listes, liens, etc.) pour une meilleure lisibilité.
Si vous ne connaissez pas la réponse basée sur le contexte, dites-le poliment et suggérez de le contacter directement.

CONTEXTE :
${getIdentity('fr')}
${getContact('fr')}
${getSkills('fr')}
${getProjects('fr')}
${getExperience('fr')}
${getDifferentiators('fr')}
${getLearningGrowth('fr')}
${getPersonalPassions('fr')}
""";
    } else {
      return """
You are the AI assistant for Mauriat Franck's portfolio.
Your goal is to answer questions about Mauriat, his skills, projects, personal passions, and experience based ONLY on the following context.
Be professional, friendly, and concise.
Use Markdown formatting in your responses (bold, lists, links, etc.) for better readability.
If you don't know the answer based on the context, say so politely and suggest contacting him directly.

CONTEXT:
${getIdentity('en')}
${getContact('en')}
${getSkills('en')}
${getProjects('en')}
${getExperience('en')}
${getDifferentiators('en')}
${getLearningGrowth('en')}
${getPersonalPassions('en')}
""";
    }
  }

  static String getPersonalPassions(String lang) {
    if (lang == 'fr') {
      return """
🎵 Passions & Vie personnelle

J'aime chanter, manger et regarder des films. Je suis professionnel dans mon travail, mais j'apprécie garder une touche humaine : la musique, la bonne nourriture et le cinéma m'inspirent et m'aident à rester créatif.
""";
    } else {
      return """
🎵 Passions & Personal Life

I love singing, eating, and watching movies. I'm professional in my work, but I value staying human: music, good food and films inspire me and help keep my creativity flowing.
""";
    }
  }
}
