# ANANYA — photo cube

A scroll-driven WebGL hero: a 3×3 "Rubik-style" photo cube of 54 tiles that, as you
scroll, separates outward → 54-tile constellation → flat editorial mosaic → an
**infinite free-drag canvas**. A bottom-right **↺ back to cube** control reverses the
whole journey. Tiles are self-generated galaxy-nebula gradients on a black stardust
backdrop. Fully self-contained (three.js vendored in `lib/`), no build step, no
external assets.

## View
- Live: served as a static site (GitHub Pages) — the page is at `/cube.html`
  (the root `index.html` redirects there).
- Local: WebGL needs http (not `file://`), so run a static server:
  ```bash
  python3 -m http.server 8000
  # then open http://localhost:8000/cube.html
  ```

## Files
- `cube.html` — the whole experience (scene, timeline, free canvas, tile art).
- `lib/` — vendored three.js + RoundedBoxGeometry + RoomEnvironment.
- `photos/` + `photos.json` — optional real photos; drop images in and run
  `gen-photos.sh` to replace the abstract art (filename order = tile order:
  1–9 Top, 10–18 Front, 19–27 Right, 28–36 Back, 37–45 Left, 46–54 Bottom).
- `ananya.html` — earlier falling-letters name animation.
