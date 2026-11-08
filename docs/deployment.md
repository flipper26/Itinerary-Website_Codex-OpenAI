# Shareable pilot on Render

## Prepared configuration

`render.yaml` defines one Node 24 web service, one persistent 1 GB disk, a database-backed health check, HTTPS-only session cookies and manual deploys. It does not create resources by itself. Render serves HTTPS and provides its own public service URL. The app uses Render's injected `RENDER_EXTERNAL_URL` for same-origin checks behind its HTTPS proxy (`PUBLIC_ORIGIN` can explicitly override it); no custom domain is required. A single instance is required for this SQLite pilot. Do not change it to a free or stateless service: local account/trip data would not persist correctly. Current plan/disk cost, provider availability and data residency must be reviewed in Render before provisioning. No price is asserted here.

The repository's local folder name can remain `Open-AI---Codex`; the GitHub repository is `flipper26/Itinerary-Website_Codex-OpenAI`. All code must be pushed to the selected deployment branch before creating the service. No local `.env`, SQLite files, browser-test accounts or screenshots are uploaded to GitHub/Render.

## One-time account action

1. Open https://dashboard.render.com/ and create/sign into your own Render account. GitHub sign-in is convenient.
2. Connect GitHub and grant Render access to **only** `flipper26/Itinerary-Website_Codex-OpenAI` as needed.
3. Choose **New → Blueprint**, select that repository and branch `pilot/shareable-preview`. Render should detect `render.yaml`.
4. Review the web service, persistent disk, current total cost and deployment region. Confirm in Render only if acceptable. Do not enable paid AI, maps, payments or email providers; none are needed for the current pilot.
5. Start the Blueprint and wait for the service to become healthy. Render shows the assigned public HTTPS address in the service dashboard. Never guess it from the service name.
6. Send that public address back to this chat so the actual deployment can be validated. No API token or password is needed in chat.

If the provider rejects the YAML or an install/start step, use its build/deploy error for diagnosis rather than deleting the persistent disk or changing database paths. Network access from this Codex instance to Render documentation returned HTTP 403 during preparation, so live provider schema acceptance is not yet verified. The configuration uses the conventional Blueprint fields; provider acceptance is a remaining deployment check.

## Acceptance after deployment

- Open `/api/health`: expect HTTP 200 and `{"status":"ok"}`.
- Open the root site and `/designs` in ordinary browsers without a cloud-workspace login.
- Create account A with a unique test email and a password used nowhere else. Create a draft and activity; sign out and back in, confirming persistence.
- In a private/incognito browser, create account B. Confirm B sees an empty trip collection and cannot access A's trip URL/API. Each visitor gets their own account and private trips, not shared access to all tester data.
- Restart the Render service (not the disk); sign in to A and verify the same draft and activity remain. Secure cookies require the HTTPS address, not HTTP.
- Check desktop/mobile, dark/light, Arabic and the ten homepage alternatives. Share the HTTPS root URL or `/designs?v=1` etc. Visitors need no GitHub or Render account to use the site, only an app account to save trips.

This does not implement shared-trip invitations: multiple people can independently try the app; they cannot edit the same trip together yet. Anyone receiving the link can open the homepage and sign up. Do not describe this as an invite-only/private deployment. Existing pilot limitations still apply: unverified email, no password recovery, no AI/maps/routing/providers/real reservations/payments. Only use fictional travel data. Passwords are salted/hashed and sessions are server-side; this is not a production-security certification.

## Operations

The disk contains SQLite's database plus its WAL/shm files. Keep the path fixed across redeploys. Health checks prove database query access, not backups or all application behavior. Graceful termination stops requests before closing the database. Before collecting important data, implement automated backups and test a consistent SQLite backup/restore; do not copy just a live database file and assume it is complete. Do not delete the service/disk to restart. Stop the service or delete resources in Render when testing is finished to control cost; deleting the disk loses accounts and trips.

Roll back application code using Render's supported manual deployment controls. This initial schema migration is additive/idempotent. Future schema changes need a migration/forward-recovery plan; arbitrary old code against new schemas is not a guaranteed rollback.
