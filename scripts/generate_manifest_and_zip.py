from pathlib import Path
from zipfile import ZipFile
import json

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SRC_DIR = PROJECT_ROOT / 'assets' / 'images'
CONVERTED_DIR = SRC_DIR / 'converted'
MANIFEST_PATH = SRC_DIR / 'manifest.json'
ZIP_PATH = SRC_DIR / 'converted.zip'

if not CONVERTED_DIR.exists():
    raise FileNotFoundError(f'Converted directory not found: {CONVERTED_DIR}')

manifest = {}
for p in sorted(CONVERTED_DIR.iterdir()):
    if not p.is_file() or p.suffix.lower() != '.webp':
        continue
    stem = p.stem
    if stem.endswith('-lg'):
        base = stem[:-3]
        size = 'lg'
    elif stem.endswith('-md'):
        base = stem[:-3]
        size = 'md'
    elif stem.endswith('-sm'):
        base = stem[:-3]
        size = 'sm'
    else:
        continue
    manifest.setdefault(base, {})[size] = f'converted/{p.name}'

MANIFEST_PATH.write_text(json.dumps(manifest, ensure_ascii=False, indent=2), encoding='utf-8')
print(f'Wrote image manifest: {MANIFEST_PATH}')

with ZipFile(ZIP_PATH, 'w') as zf:
    for p in sorted(CONVERTED_DIR.iterdir()):
        if p.is_file():
            zf.write(p, arcname=p.name)
print(f'Created ZIP archive: {ZIP_PATH}')
