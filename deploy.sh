# 1. Nettoyer les anciens builds
flutter clean

# 2. Reconstruire le projet pour le Web
# REMPLACEZ 'votre-nom-repo' par le nom de votre projet GitHub
flutter build web --release --base-href "/mauriatportfolio/"

# 3. On initialise un git temporaire à l'intérieur de ce dossier
git init
git add .
git commit -m "Déploiement portfolio"

# 4. On envoie de force vers la branche gh-pages de ton GitHub
# REMPLACE 'TON_PSEUDO' par ton vrai nom d'utilisateur GitHub ci-dessous :
git push -f https://github.com/HarisonFranck/mauriatportfolio.git master:gh-pages