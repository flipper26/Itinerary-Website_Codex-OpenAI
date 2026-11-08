# Contrast requirements and verification

The current website and all ten homepage directions target WCAG 2.2 AA contrast requirements:

- 1.4.3: at least **4.5:1** for normal text; **3:1** for large text (24 CSS px, or 18.67 CSS px when bold).
- 1.4.11: at least **3:1** for essential interface boundaries, state indicators and focus outlines against adjacent backgrounds.
- Keep a visible keyboard focus indicator and give links hover underlines. State is not conveyed by colour alone: checkboxes use a check mark, theme controls have labels and `aria-pressed`, and errors/availability have text.

Decorative card dividers, glow effects, illustration contours, and inactive decoration do not identify controls and can remain subtle. This exception is not used for form fields, clickable trip cards, outlined buttons, checkboxes or focus indicators.

## Changes

- Fixed the gallery's inline dark accent overriding the light-theme accent. Bright green on dark surfaces becomes a darker, contrast-safe green on light surfaces.
- Increased contrast for secondary copy, form borders, clickable trip cards and theme switches.
- Added explicit placeholder colour, contrasting checkbox boundary/check mark, and 3px focus outlines with an offset and background separation.
- Preserved readable disabled labels, accompanied by a dashed boundary.
- Put the illustration caption on an opaque background so its contrast is independent of the artwork.
- Removed background-colour interpolation from button transitions. Theme switching must not momentarily pair white text with a pale intermediate green.

## Repeatable audit

```sh
npm ci --ignore-scripts
npm run test:contrast
```

Requires an installed Chromium executable, default `/usr/bin/chromium`; override with `CHROMIUM_PATH`. The audit starts its own server and temporary SQLite database on port 3458 (`CONTRAST_PORT` can override), creates test-only accounts/data, and removes that database on exit. No existing application database is used. Pinned development packages are Playwright, axe-core's Playwright integration and pngjs; application runtime still has no external package dependencies.

The audit runs axe's `color-contrast` rule and separately samples the actual rendered backgrounds underneath text. This additional check covers gradients and illustrations axe marks as needing review. A test-only browser context bypasses CSP to hide glyph paint while retaining layout and backgrounds for sampling; application CSP is unchanged. Sampling compares authored text colours with the background at a 2px grid across each visible text-run rectangle, conservatively requiring the worst sampled ratio to pass. Control-boundary and focus tokens are checked against each theme's surface colours, including alpha compositing.

Coverage: 36 desktop screen/theme combinations — current homepage, ten alternative homepages, sign-in, empty trips, trip form, empty itinerary, activity form, filled itinerary and Arabic itinerary, each in dark and light. JSON results are written to ignored `test-results/contrast.json`. Also checked all ten alternatives and the current interface at 390px for horizontal overflow and theme persistence; screenshots refreshed for both themes.

A passing contrast audit is evidence for these tested screens and states, not certification of complete WCAG conformance. Screen-reader flows, text resizing/reflow across all zoom levels, all dynamic states and human accessibility review remain broader work.

References: [WCAG text contrast](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html), [WCAG non-text contrast](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html), [MDN colour contrast](https://developer.mozilla.org/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast).
