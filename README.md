# JobTracker

> Open-source job application management. Every feature, free — forever.

---

JobTracker combines a job application tracker, resume builder, and AI job assistant in a single open-source platform. Self-host it for free with your own AI key, or use the managed cloud version and let us handle the infrastructure.

No feature gates. No crippled free tier. No data selling.

---

## Why JobTracker

The average successful job search requires 100–200 applications over 5–8 months. Spreadsheets break under that load. Proprietary tools like Teal ($29/mo) and Huntr ($40/mo) charge significant recurring fees to users who are often unemployed — and have drawn criticism for selling resume data, blocking data export, and producing generic AI output.

Open-source alternatives exist for resume building (Reactive Resume, 1M+ users) but nothing meaningful combines a resume builder with a full application tracker. That's the gap JobTracker fills.

---

## Features

### Application tracker
- Kanban, list, table, and calendar views
- Five default stages: Saved → Applied → Interviewing → Offer → Closed
- Custom stages — rename, reorder, or add columns to match your process
- Full application state machine powering automation and analytics
- Auto-archiving of job descriptions (persists after postings expire)
- Follow-up reminders calculated automatically — no manual date-setting
- Resume version recorded per application for later A/B analysis
- Bulk actions and keyboard shortcuts for high-volume searches
- Global fuzzy search with `@status` filtering

### Resume builder
- Community-contributed template library
- Multiple named resume versions (e.g. "v3 — growth roles")
- Real-time preview, drag-and-drop section reordering
- Export to PDF, DOCX, and ATS-safe plain text
- Version history with restore

### AI features (BYOK or managed)
- **Suitability scoring** — AI ranks discovered jobs 0–100 against your profile before you apply
- **ATS keyword scoring** — match your resume to a specific job description
- **Resume tailoring** — rewrites bullet points to better reflect relevant experience; never invents content
- **Cover letter generation** — tone, length, and emphasis controls; stored per application
- **Interview prep** — role-specific questions, company research brief, answer rubric
- **Ghostwriter** — persistent open-ended AI chat per application for anything the above buttons don't cover
- **Manual JD import** — paste any job description; AI extracts fields and scores fit instantly
- **Smart Router** — connects Gmail and auto-updates application status from recruiter replies

### Job discovery (optional)
- Automated pipeline scraping LinkedIn, Indeed, Glassdoor, Adzuna, and more
- Configurable minimum suitability score threshold
- Discovered jobs flow into the tracker pre-scored and pre-tailored

### Networking & research
- Standalone contacts CRM linked to applications (not duplicated per card)
- Company profiles database — save companies before roles open
- Salary benchmarking per application: expected, market rate, final offer

### Offer management
- Side-by-side offer comparison matrix
- Priority weighting (e.g. salary 40%, remote 30%, growth 30%)
- Negotiation history log per offer

### Analytics
- Response rate, interview conversion, time-in-stage
- Resume version A/B performance
- Applications-per-day trend with time-window controls
- Weekly goal tracking and consistency dashboard

---

## Pricing model

| | Self-hosted | Cloud free | Cloud paid |
|---|---|---|---|
| All core features | ✓ | ✓ | ✓ |
| AI features | ✓ BYOK | ✓ BYOK | ✓ managed |
| Local LLM (Ollama) | ✓ | — | — |
| Email / Smart Router | manual | — | ✓ |
| Automatic backups | self-managed | ✓ | ✓ |
| **Price** | **Free** | **Free** | **~$12–15/mo** |

**BYOK** = Bring Your Own API Key (OpenAI, Anthropic, OpenRouter, Gemini, or local via Ollama/LM Studio). No AI costs are charged to you — you pay your provider directly.

The cloud paid tier sells convenience, not access. Every feature exists in the free and self-hosted versions.

---

## Privacy

- Self-hostable via Docker Compose — your data never leaves your machine
- Full data export in JSON and CSV at any time, with no waiting period
- Resume content is never used to train models or sold to third parties
- All AI prompts are open source and auditable
- Browser extension requests only the permissions needed — no "read all pages"

---

## Licence

AGPL-3.0. Self-host, fork, and modify freely. Anyone hosting a modified version must publish their source code under the same licence. Commercial licence available for institutions with procurement constraints.

---

## Roadmap

**Now (months 1–6):** Core tracker, resume builder, manual JD import, networking CRM, company profiles, basic analytics, BYOK AI, Docker self-hosting.

**Next (months 6–12):** Automated job discovery pipeline, Ghostwriter, Smart Router Gmail integration, browser extension, offer comparison, advanced analytics, cloud hosted version.

**Later (months 12–18):** B2B institutional tier — cohort dashboards, SSO, white-label branding, placement outcome reports for bootcamps and university career centres.

---

## Contributing

All contributions welcome — features, templates, extractors, translations, and documentation. See `CONTRIBUTING.md` to get started.

---

*Built on the shoulders of Reactive Resume, job-ops, and the open-source job-search community.*