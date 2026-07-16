#!/usr/bin/env bash
# 说明：将 assets/images 中的图片生成 WebP 和三种缩略图
# 依赖：imagemagick 或 cwebp

SRC_DIR="$(pwd)/assets/images"
OUT_DIR="$SRC_DIR/converted"
mkdir -p "$OUT_DIR"

for img in "$SRC_DIR"/*.{png,jpg,jpeg,JPG,PNG,JPEG} ; do
  [ -e "$img" ] || continue
  filename=$(basename "$img")
  name="${filename%.*}"
  # 大图 1200px
  magick convert "$img" -resize 1200x1200\> -strip -quality 85 "$OUT_DIR/${name}-lg.webp" 2>/dev/null || cwebp -q 85 "$img" -resize 1200 0 -o "$OUT_DIR/${name}-lg.webp"
  # 中图 800px
  magick convert "$img" -resize 800x800\> -strip -quality 80 "$OUT_DIR/${name}-md.webp" 2>/dev/null || cwebp -q 80 "$img" -resize 800 0 -o "$OUT_DIR/${name}-md.webp"
  # 小图 400px
  magick convert "$img" -resize 400x400\> -strip -quality 75 "$OUT_DIR/${name}-sm.webp" 2>/dev/null || cwebp -q 75 "$img" -resize 400 0 -o "$OUT_DIR/${name}-sm.webp"
  echo "Processed: $filename -> $OUT_DIR/${name}-lg.webp | md | sm"
done

echo "完成。生成的文件位于 $OUT_DIR/（可将其部署到网站或替换原占位图）"