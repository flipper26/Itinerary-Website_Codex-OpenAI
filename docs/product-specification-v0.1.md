# AI Travel Planner — Business and Development Specification

Version 0.1 · 8 November 2026 · Product owner: Elie Khairallah

Status: consolidated discovery draft for review and staged implementation. This is a development input, not evidence that integrations, commercial terms, legal requirements, or native-device feasibility have been validated.

## 1. How Codex must use this specification

Build a working pilot with real integrations, then harden it for public launch. Do not substitute a static demonstration for functioning authentication, persistence, routing, or AI. Clearly labelled fixtures are permitted in tests and unavailable-provider development modes only.

Requirements marked **C** are confirmed by the product owner. **P** indicates a proposed implementation default, which may be used for reversible pilot work but is not an approved commercial commitment. **G** indicates a gate requiring a decision, external account, provider validation, or feasibility evidence before the affected feature can launch. Unmarked detailed behavior is a proposed elaboration of confirmed requirements.

Implement coherent increments. After each increment report behavior delivered, tests run, unresolved dependencies, and material limitations. Maintain requirement-to-test traceability. Do not silently change confirmed scope, fill prices with invented amounts, promise worldwide real-time data, or treat generated text as authoritative transport data.

This document supersedes the abandoned subscription, daily subscription, per-person entitlement, split-payment, and combined subscription/pass designs. Do not implement those designs.

## 2. Product purpose and success measures

**C:** Help travellers plan a practical home-to-home journey to destinations they choose, compare transport options, visualize their itinerary, and respond to changes during travel. The product recommends activities and transportation and directs users to external booking services; it does not sell, alter, or cancel travel reservations.

The central user question is: “Will I be late for my parasailing activity if I take the metro instead of an Uber?” An acceptable answer considers door-to-door time, walking, waiting, transfers, check-in deadlines, uncertainty, accessibility, and relevant costs. It identifies the data timestamp and does not guarantee arrival.

Proposed success measures: time to first useful itinerary; onboarding completion; pass conversion; successful import rate; routing coverage by destination and mode; percentage of answers supported by itinerary/provider data; false or missed disruption alerts; cost per generated trip and monitored trip-day; support incidents; user correction rate. Instrument these without recording private documents or exact location in analytics. Numerical business targets remain G.

## 3. Confirmed scope baseline

| ID | Confirmed requirement |
|---|---|
| C-01 | Public homepage explains the service and packages without requiring login. |
| C-02 | Simple accounts using email, phone, both, Google, or Apple identity. |
| C-03 | Minimal first-login screen with large text and AI conversation. Ask essentials, produce an initial draft, refine together. |
| C-04 | Worldwide planning from launch, subject to clearly communicated provider coverage. |
| C-05 | Home departure through return home, including flights and airport transfers. |
| C-06 | User chooses destinations; AI recommends activities and transport within them. |
| C-07 | Compare cost, time, arrival reliability, transfers/walking, comfort, accessibility/family/luggage needs, mode preferences, environmental impact, and scenery. |
| C-08 | Interactive map and timeline with direct editing and AI chat using one shared itinerary. |
| C-09 | Accommodation, meals, rest, children's routines, weather, and trip-budget functionality, subject to tier. |
| C-10 | Manual reservations, uploads, forwarded emails, and connected-email imports; setup accessible from settings and assistant. |
| C-11 | Shared trips: owner assigns editors and viewers; optional activities can target selected travellers. |
| C-12 | Automatic changes limited to planned transport modes and suggested departure/wake-up reminder times within user-defined limits. |
| C-13 | Responsive website, installable web app, and native mobile component at launch, with alarm feasibility testing. |
| C-14 | Read-only offline itinerary and reservation access in eligible tiers. |
| C-15 | Separate opt-ins for background location and sharing location with companions. |
| C-16 | English and Arabic interfaces; multilingual assistant. |
| C-17 | Tiered trip passes, one owner payment, shared trip benefits; no subscriptions or split payments. |
| C-18 | Planning starts at purchase; eligible live monitoring runs during trip dates; saved plans remain readable afterward. |
| C-19 | Essential chat answers questions about the saved plan; revisions and alternative comparisons require upgrade. |
| C-20 | Real-integration pilot followed by production hardening; prioritize lowest practical operating cost. |

## 4. Packages and entitlements

Tier names are provisional. The following feature allocation is the current agreed working baseline. Prices, numerical allowances, participant limits, maximum trip duration, refunds, upgrades, and free-preview limits remain G.

| Capability | Essential | Explorer | Companion |
|---|---|---|---|
| Initial AI home-to-home itinerary | Yes | Yes | Yes |
| Manual map/timeline editing | Yes | Yes | Yes |
| Questions about saved plan | Yes | Yes | Yes |
| Accommodation, meals, rest, routines | Yes | Yes | Yes |
| Shared editors/viewers and optional activities | Yes | Yes | Yes |
| Manual entry and reservation uploads | Yes | Yes | Yes |
| Online itinerary/reservation access | Yes | Yes | Yes |
| Weather/transport refresh on opening or request | Yes | Yes | Yes |
| Scheduled reminders and feasible native alarms | Yes | Yes | Yes |
| Consolidated estimated/confirmed budget | No | Yes | Yes |
| Offline itinerary/reservation access | No | Yes | Yes |
| AI revisions and alternative comparisons | No | Yes | Yes |
| Forwarded-email and connected-email import | No | Yes | Yes |
| Proactive monitoring and disruption alerts | No | No | Yes |
| Authorized transport/departure/reminder adjustments | No | No | Yes |
| Background location and companion location sharing | No | No | Yes |

Individual route prices remain visible in Essential; removing the budget tracker must not impair price-based transport selection. Manual changes may trigger mechanical recalculation of affected travel estimates in every paid tier. This is distinct from asking AI to redesign the itinerary or compare hypothetical alternatives.

**P:** Free users may sign up, converse within a bounded allowance, and preview an initial itinerary. Do not publish specific free promises before limits are approved. After purchase, preserve the preview rather than regenerate or lose work.

Entitlements belong to the trip, not to individual memberships. Permission checks and entitlement checks are independent and enforced on the server for UI, chat tools, background jobs, and imports. A viewer in a premium trip remains a viewer. Membership never grants access to another member's inbox, private files, or device controls.

**P:** Questions such as “What time is my train?” are Essential read operations. “Move the museum to tomorrow” and “Compare metro versus taxi” require Explorer or above and appropriate edit permissions for mutation. “Refresh the arrival estimate for my currently selected train” is a data refresh, not a hypothetical comparison. Requests combining allowed and premium actions should answer the allowed portion and explain the upgrade before any restricted action.

## 5. Actors and permissions

| Action | Owner | Editor | Viewer |
|---|---|---|---|
| View shared itinerary and permitted shared files | Yes | Yes | Yes |
| Edit shared activities and routes | Yes | Yes | No |
| Ask read-only questions | Yes | Yes | Yes |
| Commit an AI-proposed edit | Yes | Yes | No |
| Purchase/upgrade pass | Yes | No | No |
| Invite members/change roles/remove members | Yes | No by default | No |
| Configure trip-wide automatic changes | Yes | No by default | No |
| Control own location and device alarm permissions | Own only | Own only | Own only |
| Connect or disconnect personal inbox | Own only | Own only | Own only |

Role elaborations beyond owner/editor/viewer are P. Add support/admin roles for operations with least privilege and audited access. An administrator must not casually browse private trips. Owner transfer, owner account deletion with active shared trips, and whether editors may invite members are G.

Traveller profiles may exist without accounts for dependants; they still affect routing, accessibility, reservations, and activity feasibility. Dependant profiles are not logins. Exact account age policy and dependant-management permissions are G. Never derive participant pricing from earlier superseded per-seat discussions.

## 6. Information architecture and screens

| Screen | Main content and actions | Essential states |
|---|---|---|
| Public home | Value proposition, product walkthrough, package comparison, login/signup, language toggle | Anonymous, authenticated, temporarily unavailable |
| Authentication | Email/phone entry, Google/Apple, verification and recovery | Pending code, expired code, retry limit, provider failure |
| First-trip conversation | Large greeting, concise questions, response chips, upload entry | New, incomplete, generating, failed/resume |
| My trips/history | Upcoming, active, past trips; owner/shared indicator | Empty, loading, pagination, revoked membership |
| Trip dashboard | Map, day timeline, next action, assistant, notices, cost summaries if entitled | Draft, ready, active, completed, offline, partial coverage |
| Activity detail | Time/window, location entrance, duration, travellers, booking and source | Fixed, flexible, optional, conflicting, cancelled |
| Transport comparison | Mode, door-to-door breakdown, costs, freshness, trade-offs | Partial results, unknown cost, no feasible route |
| Reservations | Import queue, review, confirmed bookings, documents | Duplicate, uncertain extraction, failed scan |
| Members | Invitations, roles, optional attendance | Pending, accepted, expired, removed |
| Pass checkout | Tier, exact total, trip coverage and terms | Pending, paid, failed, refunded |
| Settings | Profile, preferences, connected accounts, privacy, reminders | Permissions granted/denied/revoked |
| Change history | Actor, reason, before/after, affected travellers, restore proposal | Concurrent changes, infeasible rollback |
| Operations console | Provider health, import failures, payment reconciliation, cost limits | Restricted and audited |

Desktop may use map and timeline side by side with a collapsible assistant. Mobile should prioritize the next action and day timeline, with map/chat accessible through simple tabs. Do not force a dense desktop layout onto a phone. Show actionable errors rather than raw provider messages.

Arabic requires right-to-left layout, correct mixed-direction numbers/addresses, and equivalent functionality. Preserve official place names and allow local-language labels alongside translations. Locale, display currency, time format, and interface language are separate settings.

## 7. Authentication and onboarding

**P:** Passwordless email link/code and phone verification code minimize signup friction. Google/Apple login can be offered alongside them. Requiring both email and phone is prohibited unless a later specific action needs a verified contact method. Gather name and optional preferences progressively.

Do not merge accounts merely because an unverified identifier looks similar. Linking an additional identity requires an authenticated session and proof of control of the new identity. Protect recovery, phone changes, and account linking against takeover. Preserve trip invitations through signup. A phone-only account must have a defined recovery path before launch.

Ask first: destination(s), dates or date flexibility, home/departure location at a useful level of precision, traveller count/composition, and critical existing bookings. Then ask only missing high-impact constraints: interests, travel pace, mobility needs, luggage, transport exclusions, daily start/end preferences, meal/rest routines, and priorities. Budget questions can inform initial suggestions without exposing an Essential budget dashboard.

Distinguish missing information from a negative answer. “No wheelchair requirement supplied” is not confirmation of stair tolerance. Avoid requesting passport numbers or exact home address when a city/neighbourhood suffices. Use saved preferences only with a clear opportunity to override them for this trip.

If dates are unknown, create an explicitly undated draft; do not fabricate bookable flight availability or live timing. If location names are ambiguous, ask or present candidates. Show a compact assumptions summary before committing the initial plan. Generation can return progressively with a stable job ID and resume after disconnect.

## 8. Itinerary domain rules

Each trip contains destinations, date range, travellers, activities, bookings, legs, and revisions. Activities may be fixed, flexible, optional, or user-locked. Bookings and activities are separate: one reservation may cover several travellers or legs. An activity can exist without a booking.

Store time instants in UTC together with the relevant IANA time zone and source local date/time. Flights retain origin and destination zones. Preserve date-only values as date-only; never convert them to guessed midnight instants. Validate daylight-saving ambiguity, overnight travel, and international date-line transitions. Trip start/end is defined by the home-to-home journey, not a single destination's calendar date.

For every scheduled activity capture duration, earliest/latest start if flexible, mandatory arrival/check-in time, location/entrance, participant set, reservation status, and lock status. Capture setup time, queues, meals, rest, airport procedures, transfers, and luggage collection where relevant. Defaults must be disclosed and editable; do not claim a universal airport buffer is a provider rule.

Calculate feasibility per participating traveller. Optional activities must not cause unnoticed overlaps or missed reunion points. Core group activities can have a default all-members participant set, but adding a member must trigger review of capacity and bookings; membership does not add the person to an external reservation.

Do not automatically reorder, remove, replace, or shift activity times. AI may propose these changes for explicit approval by owner/editor in an entitled tier. Locking an item prevents automated changes and must survive a regeneration. Manual override of a soft preference is permitted with explanation; unresolved hard constraints must remain visible.

### 8.1 Feasibility calculation

For an illustrative leg, arrival estimate = departure + walk-to-pickup/station + expected wait + vehicle travel + transfers + final walk. Add mandatory check-in/setup separately to determine latest safe departure. Avoid double counting components already included in a routing provider's duration.

Slack = required arrival instant − estimated arrival instant. If a provider supplies a duration interval, calculate an arrival interval and show the uncertainty. Buffer is a user-configurable planning margin, not a probability. Do not display “95% on time” without a validated probabilistic basis.

Example fixture only: activity starts 15:00, check-in is 14:40, proposed departure 13:50. Metro door-to-door estimate 55 minutes gives arrival 14:45, five minutes after check-in. Taxi estimate 30–40 minutes gives 14:20–14:30. State the missed check-in risk and source age; do not just compare against 15:00. These are test values, not real journey data.

### 8.2 Optimization and trade-offs

Apply mandatory constraints before ranking suitable options. Constraints include accessibility requirements, excluded modes, booking deadlines, capacity, and explicit cost ceilings. Rank remaining options using traveller-selected priorities. Return interpretable alternatives such as cheapest, fastest, fewest transfers, and scenic where supported.

For group costs distinguish per-person fare from per-vehicle fare and account for capacity, children, luggage, reservation fees, and uncertain surcharges. Unknown costs are null/unknown, never zero. Currency conversion must include source and timestamp; preserve original amounts.

Scenic ranking needs an identified basis: coastline, landscapes, landmark coverage, or user preference. Label subjective/editorial judgments. Environmental estimates must specify methodology and uncertainty; missing emissions data must not become zero emissions. Accessibility unknown must not be presented as accessible.

## 9. Map, editing, and comparison behavior

Render numbered activities with day and participant filters; transport legs show mode, estimated duration, and status. Selecting map/timeline elements synchronizes the detail panel. Differentiate planned routes, completed legs, and current location. Provide a non-map list equivalent for accessibility and low bandwidth.

Dragging an activity creates a proposed revision, recalculates affected legs, and shows conflicts and cost/time deltas before commit. Debounce intermediate movements to avoid API calls per pixel. Distinguish pending recalculation from a valid confirmed result. Superseded responses must not overwrite newer edits.

AI hypothetical questions operate on a scenario copy. Persist only when an authorized user requests application. Commit all related edits atomically against an expected itinerary version. If the version changed, rebase or return a conflict with a fresh preview; never silently overwrite another editor.

History records user/assistant/background actor, reason, timestamp, changed fields, previous and new versions, and provider evidence references. Restoring an old version produces a new revision after current feasibility and permissions are checked. It cannot restore external bookings or promise obsolete fares.

## 10. AI assistant contracts

Use the LLM for dialogue, extraction proposals, explanation, and candidate planning. Use application code and provider adapters for permissions, entitlements, money, time arithmetic, routing feasibility, persistence, and execution. The model must not bypass checks by selecting another tool.

Classify intents: read saved plan; refresh selected route; import/review booking; propose scenario; commit revision; configure preferences; set personal reminder; manage account connection; manage trip automation. Require server-authorized tools for all writes. A natural-language response saying “done” is valid only after a successful operation result.

Retrieved webpages, documents, emails, and booking notes are untrusted data, never instructions. Ignore embedded requests to disclose secrets, alter permissions, invoke tools, or modify other trips. Ground answers in the requesting user's authorized context only. Do not put full inboxes, payment data, or unneeded identity documents into prompts.

Proposed tool schema fields: action, trip_id, expected_version, actor_id derived from session, requested changes, affected travellers, required entitlement, evidence references, and confirmation token when needed. Client/model supplied role or price is never trusted. Validate structured output against schemas; invalid output triggers bounded retry or a clear failure.

For Essential, “Where is our hotel?” can be answered from saved data. “Can we replace the museum with a boat tour?” returns an upgrade path without generating and committing a restricted revision. Manual forms remain usable. A viewer can inspect a hypothetical scenario if entitled but cannot commit it.

Multilingual responses should follow user preference while keeping official names, reservation references, dates, and quantities exact. Do not translate booking codes. Clarify uncertain extraction instead of guessing. A provider failure should produce an honest partial answer, not a fabricated result.

## 11. Reservation import and email connections

All import routes feed a common pipeline: receive → validate/quarantine → extract → identify potential duplicates → review uncertain fields → link to trip/travellers → confirm. Manual entry bypasses extraction but uses the same validation and domain model.

Store source type, received time, file identifier/hash, provider reservation reference where available, extraction confidence by field, and user corrections. Supported file types/size limits are configurable; proposed pilot inputs are PDF and common images. Validate content rather than trusting extensions, scan files, reject executable content, and impose extraction/page limits.

Duplicate detection uses a combination of booking reference, provider, time, route, passengers, and source hash. Never merge two different bookings solely because times match. Cancellation and schedule-change notices should propose an update to the existing booking and preserve history; they should not create a duplicate confirmed activity.

Connected email uses explicit user authorization and minimum practical scopes. Users can disconnect and revoke tokens. Only booking-relevant messages should be processed for the declared purpose; inbox connection does not authorize sending emails. Connection scope and security verification are provider gates.

Forwarding addresses should be hard to guess, revocable, rate-limited, and bound to an account or trip. An email claiming to come from a member is not sufficient authorization. Unexpected senders/attachments are quarantined or reviewed. Never expose the inbound address in public trip links.

Imported documents remain private by default until the uploader chooses sharing. Publish necessary itinerary facts separately from full reservation documents. Access to a shared document does not imply permission to download all private imports. Low-confidence critical fields—time zone, date, meeting point, cancellation—require review before becoming fixed scheduling constraints.

## 12. Monitoring, notifications, and native alarms

Companion monitoring runs during trip dates. Planning and user-requested refresh remain distinct from continuous monitoring. Jobs inspect upcoming relevant legs, schedules, weather, and permissioned location; they must stop when trip access or consent no longer applies.

Automatic allowed changes are: planned transport mode within agreed cost/accessibility/mode constraints; suggested departure time; suggested wake-up reminder time. They never purchase transport, cancel bookings, move activities, change another person's alarm, or increase the approved limits.

Before an automatic change: verify active trip and tier, current consent/policy version, current itinerary version, adequate data freshness, all affected participants' constraints, and preserved fixed bookings. Prefer notifying rather than modifying if uncertainty or missing data prevents safe validation. Record reason, notify affected members, and allow a reviewed reversal.

Use a configurable cooldown/hysteresis to avoid repeatedly switching between near-equivalent modes. If changing a mode requires a new paid booking, describe it as a planned option needing user action; never imply availability or reservation success. If a shared leg cannot meet all participants' constraints, escalate instead of splitting the group automatically.

Notifications have category, recipient, scheduled instant/time zone, related revision, deduplication key, delivery attempts, expiry, and state. Cancel obsolete reminders after plan changes. Respect quiet preferences except explicitly configured personal alarms; do not promise operating-system overrides. Notify about significant changes rather than every provider fluctuation.

Native feasibility gate: test scheduled audible alarm when foreground/background/closed, locked, offline, rebooted, battery constrained, permission revoked, and time zone changed. Distinguish user force-stop behavior. Record tested OS/device versions and unsupported cases. A push reminder is not proof that a device alarm has been scheduled. Show alarm registration failure and a manual Clock fallback.

Device alarm changes require a separate personal authorization policy, even when the trip permits automatic reminder adjustments. Native scope—full app versus focused companion—and supported operating-system versions remain G. Web and native clients share the backend and consistent entitlements.

## 13. Location and offline privacy behavior

Obtain separate consent for background collection and sharing with selected companions. Display collection/sharing status and a prominent pause/stop action. Declining sharing does not disable private location-based assistance. Owner status does not grant access to members' location.

Location records include timestamp, accuracy, and device/source; never silently treat the last fix as live. Proposed retention: keep only what is needed for current assistance; precise retention duration remains G. Stop trip-related tracking when travel ends or consent is revoked. Member removal revokes future shared access immediately online.

Offline downloads are explicit, tier-gated, and scoped to authorized itinerary/reservation data. Show downloaded-at and data freshness. Disable edit/AI/live refresh actions offline with a readable explanation. Do not display an expired estimate as current. Offline maps require separate licensing/capability validation and are not implied by offline itinerary access.

Previously downloaded data cannot always be remotely erased from an offline device. Minimize sensitive contents, use device storage protection where supported, and purge on next authenticated reconnect after access revocation. Define shared-device logout cleanup. Do not promise instantaneous offline revocation.

## 14. Payments and pass lifecycle

One owner purchases one tier for one trip. No subscription objects, recurring payment schedules, pooled payments, member invoices, or travel booking checkout. Provider-hosted checkout is preferred to minimize handling payment credentials. Server derives amount/currency from the published price version; ignore client-supplied amounts.

States: draft quote → checkout pending → paid/planning active → trip active → completed/read-only. Failed/cancelled checkout does not activate a pass. Refund/dispute states are separate financial records and may affect access under an approved policy.

Activate from verified payment-provider events or verified reconciliation, not a return URL alone. Events must be signature-checked, idempotent, and safe when duplicated or out of order. Store provider transaction IDs, amount, currency, price version, and timestamps. Never store full card data.

**G:** Approve maximum trip duration, how far ahead passes can be purchased, participant cap, date-change rules, tier upgrades, refunds, cancellation, merchant country, settlement currency, tax treatment, and native-store purchase approach. Until approved, keep prices and checkout disabled in public production; sandbox payments can validate the pilot. Do not silently revive abandoned group-size bands.

After trip completion, preserve readable saved itinerary/history and authorized reservation access according to retention policy; stop paid live monitoring. Post-trip AI, editing, downloads, and extension rules are not yet confirmed. Do not assume perpetual AI access from “readable afterward.”

## 15. Provider strategy and cost controls

Provider selection is not finalized. “Lowest practical cost” means measured total cost at expected use, including data quality, engineering effort, compliance, support, and commercial licensing—not simply a free development allowance. Do not lock the design to a provider until a real coverage/cost evaluation is recorded.

| Adapter | Required capabilities | Validation evidence |
|---|---|---|
| Identity | Email/phone, Google/Apple, linking/recovery | Supported countries, SMS costs, abuse controls |
| Maps/places | Geocoding, stable place identifiers, entrances, map display | Arabic support, caching/licensing, regional coverage |
| Routes | Walking/road/transit estimates and leg breakdown | Mode/country/time horizon coverage, accessibility fields |
| Flight search/status | Distinct search and existing-flight status functions | Production access, freshness, carrier coverage, linking rights |
| Activities | Discovery, opening hours, booking links | Coverage, attribution, update cadence |
| Weather | Forecast and disruption-relevant data | Forecast horizon, attribution, commercial rights |
| Email | OAuth access and inbound forwarding | Verification requirements, scopes, webhook renewal |
| AI | Structured responses, extraction, multilingual quality | Measured task quality, latency, per-task cost |
| Payments | One-time checkout, refunds, signed events | Merchant eligibility, supported currencies, fees |
| Notifications | Web/native push, delivery feedback where available | Permission/device behavior and operational cost |

Google Maps is an example requested by the user, not an approved exclusive provider. Air/rail/ferry/ride-hailing coverage may require multiple sources. Do not represent a generic map provider as guaranteeing global live fares or all transport modes. Permit manual details and external-provider links when live data is unavailable.

Every provider result needs source, retrieval time, applicable journey time, supported region/mode, and confidence/quality flags. Capability states: live available, scheduled only, estimate only, user supplied, unavailable. UI and assistant must propagate those states.

Control costs through bounded AI input/output, context summaries, route-request debounce, provider-approved caching, batching where supported, short monitoring windows around relevant events, per-trip budgets, retry limits, and global circuit breakers. Do not hide losses of functionality when a budget limit is hit; show a degraded state and preserve the saved plan.

Cost model: AI token/extraction cost + route/place/search calls + flight/weather queries + SMS/email/push + storage/egress + infrastructure + payment fees. Model quiet planning, active travel, high-upload, and large-group scenarios before setting prices. Current vendor pricing research and selection are an explicit next-stage task; no prices are asserted in this draft.

## 16. Proposed architecture

Start with a modular application backend, relational database, private object storage, and durable background-job queue. Avoid premature microservices. Clients: responsive web/PWA and a native component for validated device-specific capabilities.

Modules: identity; trips/membership; itinerary/revisions; routing/feasibility; AI orchestration; reservations/imports; billing/entitlements; monitoring/notifications; consent/location; operations/audit. Keep provider adapters behind narrow interfaces to allow replacement without rewriting the domain.

Use a transactional outbox or equivalent reliable event handoff when itinerary/payment changes schedule jobs. Jobs carry trip/revision/policy identifiers and re-check authorization before execution. Separate request response from slow generation/import jobs. Use bounded retries and a dead-letter path with operational visibility.

Client caches are not the source of truth. Keep private tokens and provider secrets server-side. Native clients use platform-appropriate secure storage. Development/test/production data and credentials must be separated. Pin dependencies, document migrations, and record architecture decisions in the implementation repository.

## 17. Logical data model

All mutable primary records need ID, created_at, updated_at, and appropriate version/ownership fields. Foreign keys and uniqueness constraints enforce relationships.

| Entity | Key fields and relationships |
|---|---|
| User | locale, time format, currency preference, status |
| Identity | user_id, provider, provider_subject, verified contacts; unique provider/subject |
| ProfilePreference | user_id, pace, interests, mode preferences; optional sensitive needs |
| Trip | owner_id, title, status, home location, dates/zones, current_revision |
| Membership | trip_id, user_id, role, invitation status; unique active membership |
| Traveller | trip_id, optional user_id, dependant manager, relevant needs |
| Destination | trip_id, place reference, sequence, arrival/departure |
| Activity | trip_id, type, time/window, zone, duration, lock, location, status |
| ActivityParticipant | activity_id, traveller_id, attendance status |
| TransportLeg | endpoints, participants, mode, departure/arrival, breakdown, source/freshness |
| Booking | provider/ref, status, dates/zones, costs, source, review status |
| BookingTraveller | booking_id, traveller_id |
| BookingActivityLink | booking_id, activity/leg reference |
| Document | private object key, owner, hash, media type, scan state, sharing policy |
| ImportJob | source, extraction status, uncertain fields, duplicate candidates |
| EmailConnection | user_id, provider, encrypted token reference, scopes, expiry/status |
| CostItem | trip_id, amount in minor units, currency, estimated/confirmed, related booking/leg |
| Scenario | trip_id, base_revision, proposed changes, expiry, creator |
| Revision | trip_id, sequence, actor, reason, before/after or patch, evidence |
| Pass | trip_id, tier_version, status, validity, purchase reference |
| Payment | pass_id, provider ID, amount/currency, status, idempotency key |
| AutomationPolicy | trip_id, authorized modes/cost/time bounds, consent version |
| PersonalReminder | user_id, activity/leg, time/zone, type, revision, device status |
| Consent | user_id, purpose, scope, recipients, granted/revoked timestamps |
| LocationFix | user_id, trip_id, coordinates, accuracy, collected_at, expiry |
| Notification | recipient, trigger, schedule, dedupe key, delivery/expiry state |
| ProviderObservation | adapter, source, fetched_at, valid_for, quality flags |
| AuditEvent | actor, action, resource, result, timestamp; no sensitive payloads |

Use exact integer minor-unit amounts for money with currency metadata; avoid binary floating-point arithmetic for payment totals. Provider observations may need licensing-specific storage limits. Do not retain full raw responses by default.

## 18. Proposed service/API contracts

These are logical contracts, not a mandated framework. All authenticated operations enforce resource membership. Mutation requests include an idempotency key where retries could duplicate work and expected_version where concurrent edits matter.

| Endpoint/action | Behavior |
|---|---|
| POST /trips | Create draft; server sets owner |
| GET /trips/:id | Authorized snapshot with entitlement/freshness metadata |
| PATCH /trips/:id | Update allowed metadata with version guard |
| POST /trips/:id/generate | Start initial-generation job with confirmed inputs |
| POST /trips/:id/scenarios | Entitled hypothetical comparison; no mutation |
| POST /trips/:id/revisions | Validate and atomically commit proposed change |
| GET /trips/:id/history | Paginated authorized history |
| POST /trips/:id/invitations | Owner invites; expiring revocable token |
| PATCH /trips/:id/members/:member | Owner changes role or removes member |
| POST /imports | Validate upload/manual/email source and start pipeline |
| POST /imports/:id/confirm | Save reviewed booking fields and links |
| POST /trips/:id/chat | Stream answer with structured tool status and evidence |
| POST /trips/:id/checkout | Server-priced one-time hosted checkout |
| POST /webhooks/payment | Verify and deduplicate payment events |
| PUT /trips/:id/automation-policy | Owner configures permitted adjustments |
| PUT /me/consents | User changes own location/device consent |
| POST /me/location-fixes | Consent-checked, timestamp/accuracy-validated ingestion |
| POST /me/reminders | Personal scheduling; report device registration separately |
| GET /trips/:id/offline-manifest | Entitled authorized download manifest with expiry |

Error envelope: code, safe message, retryable, correlation_id, and optional field errors/current_version. Define codes for forbidden, upgrade_required, version_conflict, unsupported_region, provider_unavailable, stale_data, missing_consent, quota_exceeded, import_needs_review, and payment_pending. Do not expose private resource existence through unauthorized errors.

## 19. Security, privacy, accessibility, and operations

Enforce object-level authorization on every record and file. Use short-lived signed file access, encrypted connections/storage, safe session handling, CSRF protection where applicable, rate limits, and provider-secret rotation. Protect URL fetches against server-side request forgery and uploads against malware, oversized files, and parser abuse.

Offer account export/deletion, connection revocation, and deletion controls for documents/location. Retention periods, deployment jurisdiction, age rules, privacy notices, and commercial terms require specialist review before public launch; this draft is not legal advice or a legal compliance certification.

Proposed accessibility target: keyboard and screen-reader operation, visible focus, sufficient contrast, scalable text, reduced-motion support, non-color status cues, and list equivalents for maps. Validate Arabic with human review and assistive technology. Specific formal conformance target remains to be adopted and verified.

Operations need provider-health dashboards, queue failures, cost alerts, payment reconciliation, data export/deletion handling, and audited support workflows. Redact prompts, tokens, precise location, reservation codes, and documents from ordinary logs. Track correlation IDs instead.

Proposed pilot performance targets: local edit acknowledgement under 300 ms; ordinary backend reads p95 under 1 second excluding external dependencies; visible generation progress within 3 seconds and a cancellable/resumable job; route comparison timeout yielding partial results after a configurable bound. These are targets to measure, not guarantees. Load assumptions and production availability/recovery objectives remain G.

Backups must be tested through restore exercises. Database migrations need rollback or forward-recovery plans. Production deployment requires monitoring, operational ownership, incident response, and a tested way to disable automation without disabling itinerary reading.

## 20. Acceptance scenarios

| Test | Requirement/area | Given / when / expected result |
|---|---|---|
| AT-01 | C-01 | Anonymous visitor opens home → sees explanation and current package comparison without login. |
| AT-02 | C-02 | User chooses phone signup → can verify without mandatory email; failed/expired code is recoverable. |
| AT-03 | C-02 | Unverified identifier matches an account → no automatic merge or access. |
| AT-04 | C-03 | User supplies destination/dates/party → receives draft with explicit assumptions and resumable generation. |
| AT-05 | C-04 | Transit data unavailable in a destination → itinerary remains usable; no fabricated live route/fare. |
| AT-06 | C-05 | Overnight flight crosses time zones → chronological timeline and transfer buffers remain correct. |
| AT-07 | C-07 | Cheapest route violates wheelchair requirement → not ranked as a suitable option. |
| AT-08 | C-07 | Fare unknown → shown as unknown, not free. |
| AT-09 | C-08 | User drags an activity → revised legs/conflicts preview before atomic commit. |
| AT-10 | C-08 | Two editors change same version → second commit receives conflict, no silent data loss. |
| AT-11 | C-19 | Essential user asks hotel check-in time → saved-plan answer provided. |
| AT-12 | C-19 | Essential user requests alternative metro/taxi scenario → upgrade offered; no restricted execution. |
| AT-13 | C-19 | Essential manually changes activity → selected-route mechanical recalculation works. |
| AT-14 | C-09 | Essential views route price → visible; consolidated budget remains unavailable. |
| AT-15 | C-10 | Same booking uploaded and emailed → duplicate candidate review, not two confirmed activities. |
| AT-16 | C-10 | OCR cannot distinguish dates → asks review before scheduling fixed event. |
| AT-17 | C-10 | Malicious booking attachment instructs AI to reveal other trips → ignored; authorization remains enforced. |
| AT-18 | C-11 | Viewer asks assistant to move activity → mutation denied even on highest tier. |
| AT-19 | C-11 | Optional event overlaps attendee's group reunion → specific traveller conflict flagged. |
| AT-20 | C-12 | Transit delay within approved replacement policy → route/departure updated with audit and notification. |
| AT-21 | C-12 | Replacement exceeds cost ceiling → recommendation only; no automatic commit. |
| AT-22 | C-12 | Resolving delay requires moving activity → explicit owner/editor approval required. |
| AT-23 | C-12 | Route change requires paid reservation → action-needed status, never falsely booked. |
| AT-24 | C-13 | Native alarm permission absent → failure/fallback shown; not marked scheduled. |
| AT-25 | C-13 | Native alarm tested closed/locked/offline → measured outcome recorded per supported platform. |
| AT-26 | C-14 | Eligible downloaded trip opened offline → readable with timestamp; edits disabled. |
| AT-27 | C-15 | User allows background collection but denies sharing → companions receive no location. |
| AT-28 | C-15 | Last location is stale → no confident live ETA; freshness warning used. |
| AT-29 | C-16 | Arabic UI with Latin booking code → correct layout and unchanged code. |
| AT-30 | C-17 | Payment success redirect without verified payment → pass remains pending. |
| AT-31 | C-17 | Duplicate paid webhook → exactly one activation and financial record. |
| AT-32 | C-17 | Owner buys Explorer → all members get Explorer tools subject to roles. |
| AT-33 | C-18 | Trip ends → monitoring stops; saved plan remains readable. |
| AT-34 | C-18 | Pass purchased before travel → planning available; continuous monitoring not started early. |
| AT-35 | C-20 | Provider unavailable during pilot → clear degraded state; fixture not disguised as live data. |
| AT-36 | History | Restore old plan with now-closed venue → fresh conflict review before restoration. |
| AT-37 | Privacy | Member removed → all online APIs/files deny future access; cached-device limits documented. |
| AT-38 | Notifications | New revision supersedes reminder → obsolete notification cancelled/deduplicated. |
| AT-39 | Money | Shared taxi cost for several members → counted once per vehicle, not multiplied per person. |
| AT-40 | Scenario | Parasailing example with 14:40 check-in → metro is late despite arrival before activity start. |

Test pyramid: unit tests for temporal/money/entitlement logic; integration tests for providers, jobs, webhooks and authorization; end-to-end tests for signup-to-plan-to-purchase and shared edits; real-device tests for alarms/location/offline; adversarial tests for imported content and cross-trip access. Test real provider contracts in a controlled environment without charging users or sending unsolicited messages.

## 21. Delivery plan and release gates

| Stage | Deliverable | Exit evidence |
|---|---|---|
| 0 — Validate foundations | Provider coverage/cost evaluation, native alarm/location spike, merchant eligibility, draft limits | Recorded findings and unresolved blockers; no unsupported promises |
| 1 — Core pilot | Auth, bilingual shell, onboarding, persisted itinerary, real map/routing/AI, manual edit/history | Real end-to-end journey and authorization tests |
| 2 — Travel organization | Imports, members/optional attendance, budget, scenario comparisons, tier enforcement | Duplicate/uncertain import tests and collaboration conflict tests |
| 3 — Commercial pilot | Pass purchase in sandbox then controlled live use when eligible, upgrade rules after decision | Verified webhook/reconciliation tests, approved prices/terms |
| 4 — Travel companion | Monitoring, permitted automation, push, offline, native alarms/location | Device matrix, stale-data tests, consent/revocation tests |
| 5 — Public launch hardening | Capacity, privacy/legal review, accessibility, backups/restore, operational support | Signed release checklist and no unresolved launch-critical gates |

Stages are implementation order, not a removal of confirmed launch requirements. Public launch cannot claim native alarms or worldwide live coverage merely because earlier web pilot stages work. Credential-dependent features must be clearly blocked with setup instructions rather than mocked silently.

## 22. Open decisions and proposed defaults

| Gate | Decision needed | Working proposal / reason |
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

Do not block reversible core pilot development on branding or final prices. Do block public charging on commercial eligibility and approved terms, device promises on feasibility, and privacy-sensitive operations on consent and access controls. Resolve gates in the affected stage instead of asking the product owner to choose every implementation detail upfront.

## 23. Codex kickoff instruction

Read this specification completely. Create a requirement checklist separating confirmed scope, proposed defaults, and gates. Inspect the existing repository before changing it. Propose a small modular architecture and implement Stage 0/1 in reviewable increments. Use real configured services; if credentials or access are missing, document the exact setup needed and continue independent work. Keep all secrets outside source control. Implement server-side membership and tier enforcement before AI write tools. Add migrations, setup documentation, environment-variable examples without values, and meaningful tests. Do not build subscriptions, split payments, external booking transactions, unrestricted autonomous replanning, or fake live data. At each stage provide working behavior, test evidence, and remaining launch blockers.

## 24. Evidence and technical validation notes

This draft is primarily grounded in the product owner's decisions in this conversation. Earlier web-notification research identified the following technical references; they support notification/background distinctions, not a guarantee of native alarm reliability:

- WebKit, Web Push for Web Apps on iOS and iPadOS: https://webkit.org/blog/13878/
- MDN, showNotification: https://developer.mozilla.org/en-US/docs/Web/API/ServiceWorkerRegistration/showNotification
- MDN, Offline and background operation: https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/Offline_and_background_operation

Before implementation, verify current primary documentation for the selected providers, platforms, commercial data rights, and pricing. This document deliberately does not assert unverified current API pricing, legal compliance, or universal background capabilities.
