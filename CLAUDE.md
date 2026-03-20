# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Status

JobTopBob is in **planning/documentation phase** — no source code exists yet. The engineering specification is fully written. When implementation begins, update this file with actual commands and patterns.

### Source of Truth Documents
- `documentation/Implementation Plan.md` — full engineering spec (repo structure, tech stack, database schema, auth, AI layer, scrapers, deployment, testing, security)
- `documentation/internal/Project Details.md` — product vision, business model, competitive analysis (gitignored from public)
- `.env.example` — complete environment variable reference for all services

## Architecture

**Monorepo** with two workspace systems:
- **Turborepo v2.8** — manages all TypeScript: `apps/web`, `apps/docs`, `scrapers/*`, `packages/*`
- **Go workspace** (`go.work`) — links `apps/api`, `apps/worker`, `internal/`

**Services:**
| Service | Tech | Purpose |
|---------|------|---------|
| `apps/web` | Next.js 16 (App Router) | Frontend + Better Auth v1.3 (issues JWTs) |
| `apps/api` | Go + Gin v1.10 | API server (validates JWTs via JWKS) |
| `apps/worker` | Go + Asynq v0.28 | Background jobs (Redis-backed queue) |
| `scrapers/*` | TypeScript + Playwright v1.58 | Stateless HTTP scraper services |
| `internal/` | Shared Go module | AI provider abstraction + crypto utilities |

**Data flow:** Browser → Next.js (auth) → Go API → PostgreSQL/Redis. Worker publishes events via Redis Pub/Sub → API forwards as SSE to browser.

**Auth pattern:** Better Auth in Next.js issues JWTs. Go API validates stateless via JWKS endpoint (`GET /api/auth/jwks`). No shared session state.

**AI layer:** Two provider implementations in `internal/ai/` cover all models:
1. OpenAI-compatible (OpenAI, Anthropic, Gemini via OpenRouter)
2. Ollama (local, offline)

Prompts are `.txt` files loaded via Go `embed.FS` in `internal/ai/prompts/`.

**Database:** PostgreSQL 16 + sqlc v1.30 (no ORM). Plain SQL queries → sqlc generates type-safe Go functions. Generated code in `apps/api/db/generated/` is committed. Migrations via golang-migrate v4.18.

**Scrapers:** Stateless HTTP services (`POST /scrape` → `RawJob[]`). Go worker calls scrapers synchronously. Bot-hostile boards use Hyperbrowser when `HYPERBROWSER_API_KEY` is set, otherwise fall back to playwright-extra stealth.

## Planned Development Commands

```bash
# Setup
pnpm install
docker compose -f docker/docker-compose.dev.yml up -d
cd apps/api && go run ./cmd/migrate/main.go up

# Code generation
./scripts/sqlc-generate.sh          # SQL queries → Go functions
./scripts/generate-api-client.sh    # OpenAPI spec → TypeScript types

# Development (starts all services)
pnpm dev

# Go quality
go vet ./...
golangci-lint run
govulncheck ./...
go test ./...

# TypeScript quality
pnpm tsc --noEmit
pnpm eslint .
pnpm prettier --check .
pnpm vitest

# E2E tests
pnpm playwright test
```

**Dev URLs:** Frontend `:3000` | Go API `:8080` | Resume Builder `:3010` | Asynq Inspector `:8081`

## Version-Specific Gotchas

- **Next.js 16:** `params` and route segment props are async — must be `await`-ed in page/layout functions
- **Tailwind CSS v4:** CSS-native config (`@import "tailwindcss"`), no `tailwind.config.js` by default
- **TanStack Query v5:** Single-object arguments for all hooks (no positional overloads)
- **@dnd-kit/react v0.x:** Unified package replacing `@dnd-kit/core` + `@dnd-kit/sortable` (old packages are maintenance-only)
- **shadcn/ui v3.5:** Components are copy-pasted into repo via CLI, not a runtime library
- **sqlc generated code:** Committed to repo — contributors don't need sqlc installed unless modifying queries

## Key Conventions

- OpenAPI spec (`openapi/jobtopbob.yaml`) is the API contract between TypeScript and Go
- Go handlers are thin (validate → call service → respond); business logic lives in `internal/services/`
- User API keys encrypted at rest with AES-256-GCM (per-user key derivation via HKDF)
- User content in AI prompts wrapped in `<user_content>` XML tags for prompt injection defense
- Feature flags: `BILLING_ENABLED`, `MULTI_TENANT`, `SCRAPERS_ENABLED`
- Self-hosting constraint: everything must work with Docker Compose on a $10/month VPS

## Licence

AGPL-3.0. Modified hosted versions must publish source code.
