# Itinerary-Website_Codex-OpenAI

Project goal: help travellers create and visualize practical itineraries, with real map and transport data once provider integrations are configured.

A working local web pilot for the [travel planner specification](docs/product-specification-v0.1.md). Public English/Arabic homepage, real password accounts, private persisted trip drafts, manual activities, optimistic concurrency and revision history. See the [requirements and gates](docs/requirements.md) for what remains.

## Run

Requires Node.js 24 (built-in SQLite). No external runtime packages or provider secrets.

```sh
cd /workspace/Open-AI---Codex
npm ci --ignore-scripts
npm start
```

The local server listens on port 3000. `HOST`, `PORT`, `DATABASE_PATH`, and `COOKIE_SECURE` may be set in your process or an ignored `.env` file based on `.env.example`. Use the existing checkout; no worktree is needed. Future tasks must start the process again. SQLite data lives in ignored `.data/travel.sqlite`; retain the database and WAL consistently, and test restore before any deployment. Run migrations by starting the app; migration 001 is idempotent. Do not delete the database to upgrade a schema. No production migration/recovery claim is made.

```sh
npm test
npm run check
```

Five tests cover actual HTTP signup/session flow, restart persistence, cross-account denial, viewer denial, atomic stale-version rejection, entitlement boundaries, date validation and the specification's illustrative check-in arithmetic. Browser smoke was also executed with temporary Playwright 1.56.1 and installed Chromium: homepage → signup → trip → activity → reload → Arabic RTL → mobile width; no browser errors. It is not a substitute for accessibility or native-device validation.

## Honest limitations

This is an initial increment, **not a completed Stage 1 or a public-ready product**. Pilot passwords require 12 characters. Email addresses are unverified; no email/phone OTP, social sign-in, linking or recovery is implemented. Do not use sensitive personal data. Real AI, maps/places/routes and payments are not configured. No generated itineraries, live estimates, reservations, notifications, uploads, collaboration invitations, offline mode or native application are claimed. No simulated providers or seeded itineraries are shown. The account/trip data shown is data entered by the user.

Provider selection remains open. Next integration setup needs chosen identity provider configuration and redirect URLs, selected AI server credential/model, maps/places and routing credentials with validated regions/modes and permitted origins/licensing. Keep secrets outside Git, enter them through secure environment settings only after adapters and required names are defined. No vendor or cost is assumed approved; no secret values should be sent in chat. Provider research and real-device Stage 0 evidence remain pending, not fabricated.

All package capabilities are planned and clearly labelled. Checkout and pass activation are disabled; no prices, subscriptions, split payments or external booking transactions exist. No environment draft was changed and nothing was deployed, published or pushed by this increment.

Architecture and production blockers: [architecture.md](docs/architecture.md).

## Shareable test deployment

See [Render deployment](docs/deployment.md). The Blueprint provisions a single paid Node service with persistent SQLite storage, secure HTTPS cookies and a database health check. Hosting/account approval is still required; a deployment file alone is not a live site.
