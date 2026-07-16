"""
生成 WebP 和三种缩略图（1200/800/400px）
依赖：Pillow（pip install Pillow）
用法（PowerShell）：
  py -3 scripts/process_images.py
或
  python scripts/process_images.py
"""
from PIL import Image
from pathlib import Path

SRC_DIR = Path(__file__).resolve().parents[1] / 'assets' / 'images'
OUT_DIR = SRC_DIR / 'converted'
OUT_DIR.mkdir(parents=True, exist_ok=True)

sizes = {
    'lg': 1200,
    'md': 800,
    'sm': 400,
}

exts = ['.png', '.jpg', '.jpeg', '.JPG', '.PNG', '.JPEG']

for p in SRC_DIR.iterdir():
    if p.is_file() and p.suffix in exts:
        try:
            img = Image.open(p).convert('RGB')
            name = p.stem
            for suffix, w in sizes.items():
                out = OUT_DIR / f"{name}-{suffix}.webp"
                img.thumbnail((w, w), Image.LANCZOS)
                img.save(out, 'WEBP', quality=85)
            print(f"Processed: {p.name}")
        except Exception as e:
            print(f"Failed: {p.name} -> {e}")

print(f"Done. Output in: {OUT_DIR}")