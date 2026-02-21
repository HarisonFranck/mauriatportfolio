#!/usr/bin/env bash
set -euo pipefail

# Deploy script: builds Flutter web and pushes build/web to gh-pages
# Usage:
#   REMOTE_REPO="https://github.com/user/repo.git" ./deploy.sh
# If REMOTE_REPO is not set, the script will try to use git remote origin.

if [ -z "${REMOTE_REPO:-}" ]; then
	if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
		REMOTE_REPO=$(git config --get remote.origin.url || true)
	fi
fi

if [ -z "${REMOTE_REPO:-}" ]; then
	echo "No remote repo detected. Set REMOTE_REPO env var to the repo URL or configure origin remote." >&2
	exit 1
fi

# Extract repository name (handles both SSH and HTTPS URLs)
REPO_NAME=$(basename -s .git "$REMOTE_REPO")
echo "Detected repository: $REPO_NAME"

# Branch to publish to
PUBLISH_BRANCH=${PUBLISH_BRANCH:-gh-pages}

echo "Cleaning..."
flutter clean
flutter pub get

echo "Building web (base-href=/$REPO_NAME/)..."
flutter build web --release --base-href "/${REPO_NAME}/"

echo "Publishing to ${PUBLISH_BRANCH} on ${REMOTE_REPO}..."
pushd build/web >/dev/null

# Initialize a temporary git repo and push to the target branch
git init
git checkout -b "$PUBLISH_BRANCH"
git add -A
git -c user.name='deploy-script' -c user.email='deploy@local' commit -m "Deploy web build"

# Force push the built site to the remote publish branch
git push --force "$REMOTE_REPO" "$PUBLISH_BRANCH"

popd >/dev/null

echo "Deployment complete."