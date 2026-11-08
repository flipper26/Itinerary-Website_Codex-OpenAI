# Requirements and delivery evidence

Source: [product specification v0.1](product-specification-v0.1.md). This is the first increment, not completed Stage 0 or Stage 1.

## Confirmed scope

| ID | Requirement | Current evidence |
|---|---|---|
| C-01 | Public homepage explains the service and packages without requiring login. | Implemented public comparison; browser smoke. Package capabilities are explicitly planned, checkout disabled. |
| C-02 | Simple accounts using email, phone, both, Google, or Apple identity. | Partial: real local password accounts and expiring sessions; HTTP/browser tests. Email ownership unverified. No phone/OAuth/recovery. |
| C-03 | Minimal first-login screen with large text and AI conversation. Ask essentials, produce an initial draft, refine together. | Not implemented: conversational generation needs provider. Manual draft capture only. |
| C-04 | Worldwide planning from launch, subject to clearly communicated provider coverage. | Pending; no completion claim. |
| C-05 | Home departure through return home, including flights and airport transfers. | Pending; no completion claim. |
| C-06 | User chooses destinations; AI recommends activities and transport within them. | Pending; no completion claim. |
| C-07 | Compare cost, time, arrival reliability, transfers/walking, comfort, accessibility/family/luggage needs, mode preferences, environmental impact, and scenery. | Pending; no completion claim. |
| C-08 | Interactive map and timeline with direct editing and AI chat using one shared itinerary. | Partial: persisted manual list editing and history; no map, dragging or conflict preview. |
| C-09 | Accommodation, meals, rest, children's routines, weather, and trip-budget functionality, subject to tier. | Pending; no completion claim. |
| C-10 | Manual reservations, uploads, forwarded emails, and connected-email imports; setup accessible from settings and assistant. | Pending; no completion claim. |
| C-11 | Shared trips: owner assigns editors and viewers; optional activities can target selected travellers. | Pending; no completion claim. |
| C-12 | Automatic changes limited to planned transport modes and suggested departure/wake-up reminder times within user-defined limits. | Pending; no completion claim. |
| C-13 | Responsive website, installable web app, and native mobile component at launch, with alarm feasibility testing. | Pending; no completion claim. |
| C-14 | Read-only offline itinerary and reservation access in eligible tiers. | Pending; no completion claim. |
| C-15 | Separate opt-ins for background location and sharing location with companions. | Pending; no completion claim. |
| C-16 | English and Arabic interfaces; multilingual assistant. | Partial: bilingual main UI and RTL browser test; server errors/history reasons remain English, human Arabic review pending. |
| C-17 | Tiered trip passes, one owner payment, shared trip benefits; no subscriptions or split payments. | Pending; no completion claim. |
| C-18 | Planning starts at purchase; eligible live monitoring runs during trip dates; saved plans remain readable afterward. | Pending; no completion claim. |
| C-19 | Essential chat answers questions about the saved plan; revisions and alternative comparisons require upgrade. | Server entitlement policy tested; chat not implemented. |
| C-20 | Real-integration pilot followed by production hardening; prioritize lowest practical operating cost. | Incremental implementation, no production integrations validated yet. |

## Proposed defaults

- Node 24 modular HTTP backend and same-origin, dependency-free browser client.
- SQLite relational pilot storage with versioned migrations; migrate to managed relational storage before multi-instance deployment.
- Password authentication is a temporary pilot default, not completion of the requested passwordless/phone/OAuth workflows.
- Neutral Wayfarer working title; no branding commitment.
- No free allowance, prices, entitlements, provider selection, or commercial commitments inferred.

## Gates

| Gate | Decision | Working proposal |
|---|---|---|
| G-01 | Product name, visual identity, domain | Neutral working title; minimal travel-focused UI |
| G-02 | Merchant/company country and currencies | Needed before choosing payment service and publishing checkout |
| G-03 | Prices, AI allowances, pass participant and duration caps | Configurable; set after measured provider cost scenarios |
| G-04 | Date changes, pass extensions, upgrades and refunds | Avoid subscriptions; preserve one-owner payment model |
| G-05 | Free preview scope | Small bounded preview, no automatic monitoring |
| G-06 | Native operating systems and component scope | Validate iOS/Android alarms and background location before final architecture |
| G-07 | Actual alarm automation consent | Personal opt-in separate from trip reminder adjustment |
| G-08 | Provider selection/credentials and production permissions | Adapter evaluation; no vendor is yet approved |
| G-09 | Numeric automatic-change limits | Owner chooses modes/cost bounds; no automatic changes until configured |
| G-10 | Precision/data retention and deployment jurisdiction | Minimize collection; obtain reviewed retention schedule |
| G-11 | Account age policy and dependant authority | Separate traveller profiles from authenticated accounts |
| G-12 | Trip owner transfer and deletion | Preserve shared access without transferring private inbox/device permissions |
| G-13 | Operational scale, support model, timeline | Measure pilot before adopting production service targets |
| G-14 | Past-trip download/edit/AI rights | Readable confirmed; additional rights not inferred |
| G-15 | Participant location recipient selection and retention | Explicit recipients, stop/pause controls; no owner override |

## Requirement-to-test traceability

| Test evidence | Coverage and limits |
|---|---|
| Browser smoke | AT-01 public homepage; partial AT-29 RTL, no assistive-tech/human review. |
| core.test.js: membership test | AT-10 concurrent version conflict; AT-18 viewer denial; AT-37 cross-trip access. Does not validate invitation/revocation/offline workflows. |
| HTTP integration | Real accounts/sessions, saved drafts/activities/history, restart persistence, logout, isolation, honest unavailable AI response. |
| Entitlement unit test | AT-12/14 policy only; no chat, budget or route UI claim. |
| Feasibility unit test | AT-40 illustrative metro/taxi check-in arithmetic only, not live routing. |
| Remaining AT-02–AT-39 scenarios | Unimplemented or unvalidated except partial coverage above. |

## Next increments and launch blockers

1. Validate identity provider, account recovery, email/phone verification, Google/Apple linking and country coverage.
2. Evaluate maps/routes/places and AI against primary vendor documentation, licensing, Arabic and route coverage, and measured costs. Add real adapters, secrets through secure settings, resumable generation jobs and provider contract tests.
3. Add UTC/time-zone scheduling validation including DST ambiguity, feasibility/conflict previews, participant constraints, shared membership lifecycle and audit.
4. Continue Stages 2–5 from the source specification. No public launch until native-device tests, commercial decisions, privacy/security/accessibility and operations gates pass.

No provider pricing, commercial eligibility, device reliability, or worldwide live coverage has been validated. No paid features can be activated by a client request.
