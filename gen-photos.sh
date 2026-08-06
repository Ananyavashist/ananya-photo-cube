#!/bin/zsh
# Regenerate photos.json from whatever images are in ./photos.
# - Converts iPhone HEIC/HEIF to browser-friendly JPG (WebGL can't use HEIC).
# - Writes photos.json = filenames sorted in filename order (= tile order:
#   1-9 Top, 10-18 Front, 19-27 Right, 28-36 Back, 37-45 Left, 46-54 Bottom;
#   fewer than 54 photos repeat sequentially to fill the cube).
set -e
cd "${0:A:h}/photos" 2>/dev/null || { echo "No photos/ folder"; exit 1; }

setopt NULL_GLOB
for f in *.heic *.HEIC *.heif *.HEIF; do
  base="${f:r}"
  sips -s format jpeg "$f" --out "${base}.jpg" >/dev/null 2>&1 && rm -f "$f" \
    && echo "converted $f -> ${base}.jpg"
done

ls -1 | grep -iE '\.(jpg|jpeg|png|webp)$' | sort \
  | python3 -c "import sys,json;print(json.dumps([l.rstrip() for l in sys.stdin]))" \
  > ../photos.json

echo "photos.json ->"; cat ../photos.json
