# No-BS-Sales-Enablement_V2

A minimal repository for the "No-BS Sales Enablement" — Essential Sales Playbook Builder.

## Files added
- `LICENSE` (MIT)
- `.gitignore`
- `.github/CODEOWNERS`
- `CONTRIBUTING.md`

## Importing to Lovable
Lovable typically imports repositories that include a build definition at the repo root (for example a `Dockerfile`) or standard language files such as `package.json` or `requirements.txt` so it can detect the correct buildpack.

This repo now includes the following files to make importing seamless:

- `Dockerfile` — multi-stage Docker build (builds Node `dist/` if present and serves with nginx)
- `.dockerignore` — files excluded from Docker context
- `.gitattributes` — consistent repository attributes
- `lovable.yml` — a manifest hint to help automated import tools
- `SECURITY.md` — security reporting instructions
- `.github/workflows/build-and-publish.yml` — GitHub Actions workflow to build and optionally publish a Docker image to **GHCR** or **Docker Hub**

To publish images via the workflow, set the appropriate secrets in the repository settings (for example `GITHUB_TOKEN`/`GHCR_PAT` or `DOCKERHUB_USERNAME`/`DOCKERHUB_PASSWORD`). The workflow runs linting and tests on every push to `main` and will build the image for every push, but **will only publish (push) images to registries when a Git tag is pushed** (e.g., `v1.0.0`). You can change this behavior if you prefer publishing on every `main` push.

If you want, I can modify the workflow to publish only on tags, or add extra tests/linters before the image build.

## Usage
See `CONTRIBUTING.md` for contribution guidelines and local setup notes.

**Maintainer:** @heath-gtm
