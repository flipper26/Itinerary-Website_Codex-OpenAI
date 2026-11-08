# Homepage visual directions

Ten alternatives to the current homepage, prepared for visual selection. Open `/designs?v=1` through `/designs?v=10` on the running application. The direction selector navigates between options; omit `capture` to show it. Each option starts in dark mode and offers a persistent light-mode switch. Theme preference for this gallery is independent of the current application theme.

| # | Direction | Palette | Typography / composition |
|---|---|---|---|
| 01 | Signal | Emerald | Geometric sans, split hero and abstract route |
| 02 | Atlas | Sage | Editorial serif, journal header and arched map illustration |
| 03 | Afterhours | Electric lime | Heavy oversized sans, full-width statement and colour strip |
| 04 | Form | Seafoam | Light sans, centered introduction and floating modular cards |
| 05 | Fieldnotes | Olive | Serif with monospace details, notebook margins and ruled list |
| 06 | Waypoint | Jade | Condensed sans, vertical navigation and step-based composition |
| 07 | Halo | Glacier green | Spacious sans, centered copy and luminous horizon |
| 08 | Elsewhere | Moss and copper | Warm serif, landscape arch and asymmetrical annotation |
| 09 | Departure | Acid green | Monospace, command-centre panels and compact grid |
| 10 | Open road | Pistachio and jade | Modern serif, panoramic gallery and abstract colour panels |

Font stacks use installed system fonts with explicit fallbacks, with no external font requests. Inline SVG and CSS illustrations are conceptual art, not provider maps or live journey data. All options preserve the early-pilot limitations and planned-package pricing state.

The current homepage and account/trip screens are unchanged. CTA and sign-in links return to the existing pilot; these are homepage design alternatives, not a completed new navigation/authentication workflow. After selection, apply the chosen identity to the actual homepage and review the other screens with the product owner.

Validation: Chromium/Playwright captured desktop dark, desktop light and mobile dark for all 10 directions; checked default dark, persisted theme after reload, no horizontal overflow at 390px, no browser errors, and functional direction selection. Existing five backend/domain tests pass. Screenshots and dark/light contact sheets are saved outside the repository under `/workspace/screenshots/homepage-directions/` for this review. Arabic visual directions are not part of this selection pass; existing Arabic application screens remain unchanged.
