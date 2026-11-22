# MATH AID — Pixel Edition

A single-file, pixel-art math trainer that runs entirely in the browser. Danish UI,
randomly generated problems across four modules, instant feedback, and per-type
stats. No build step, no dependencies beyond Google Fonts.

![style](https://img.shields.io/badge/style-Mistral%20pixel%20UI-FF8205) ![stack](https://img.shields.io/badge/stack-vanilla%20HTML%2FJS-FFD800) ![lang](https://img.shields.io/badge/lang-da-FFAF00)

## Run it

It is plain HTML — no build step.

### Option A: GitHub Pages (recommended)

1. Go to this repo on GitHub → **Settings → Pages**.
2. Under **Source**, choose **Deploy from a branch**.
3. Select branch **`main`** and folder **`/ (root)`** → **Save**.
4. After a minute, open the URL GitHub shows, e.g.:
   `https://elpollodiablo2nd.github.io/math-aid/`

### Option B: anywhere static

Upload `index.html` to any static host, or just open the file locally in a browser.

## Modules

| Module | Problem types |
|---|---|
| 🔢 **Tal & ligninger** | addition, subtraction, multiplication, division, equations (find x), percent |
| 📐 **Geometri** | circles, triangles, quadrilaterals, solids — with labeled SVG figures (area/circumference/volume/angles) |
| ➗ **Brøker** | add, subtract, multiply, divide, simplify, expand fractions |
| 📏 **Enheder** | weight, length and volume unit conversions |

## How to play

- Pick a module with the buttons on top, then a random weighted problem appears.
- Type the answer in the input (a number, or a fraction like `3/4`) and press
  **Enter** or **✅ Tjek svar** to check; **R** gives a new problem.
- Wrong answers get specific feedback ("it must be a number (or a fraction like 3/4)").
- The stats bar tracks solved/total per module and problem type.

## Daily progress (localStorage)

- Every checked answer is stored per day in `localStorage` under `mathaid_daily_v1`
  as `{ "YYYY-MM-DD": { correct, total }, ... }` — on-device only, works offline
  and inside the Android APK.
- The **I DAG** row under the stats bar shows today's correct/total and **% rigtige i dag**.
- **📈 GRAF** toggles a bar chart of **% rigtige pr. dag** over the last 14 days
  (inline SVG, color-coded: ≥80% yellow, ≥50% amber, ≥25% orange, else red).

## Android APK

Capacitor wrapper around the root `index.html` (single source of truth):
`tools/sync-www.sh` copies it into `www/`, `npx cap sync android` ships it into the APK.

A prebuilt debug APK is committed at [`app-debug.apk`](app-debug.apk) (~4 MB) —
download it from this repo (or from Pages once enabled:
`https://elpollodiablo2nd.github.io/math-aid/app-debug.apk`). Debug-signed, for
testing/internal distribution only.

Rebuild (needs JDK 21 + Android SDK 35, `ANDROID_HOME` set):

```
npm install
./tools/sync-www.sh        # refresh www/ from index.html
npx cap add android        # once
npx cap sync android
cd android && ./gradlew assembleDebug   # → app/build/outputs/apk/debug/app-debug.apk
```

The WebView runs with DOM storage enabled, so the daily stats persist on the phone.

## How it works

- Everything lives in `index.html` (markup + CSS + JS): problem generators per type,
  a weighted random picker per module, fraction parsing/normalization, and SVG
  figure drawing for the geometry module (`shape-rendering: crispEdges` for the
  pixel look).
- Styled with the **Mistral pixel UI** (Press Start 2P / VT323, brand-color palette,
  chunky borders, scanline background).

## Files

- `index.html` — the whole app (markup + CSS + JS, no dependencies besides Google Fonts)
- `README.md` — this file
- `app-debug.apk` — prebuilt Android APK (Capacitor wrapper)
- `capacitor.config.json`, `package.json`, `tools/sync-www.sh` — Capacitor build scaffolding (`android/` and `node_modules/` are gitignored)
- `.nojekyll` — disables Jekyll processing on GitHub Pages
