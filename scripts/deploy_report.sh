#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DOCS_DIR="${ROOT_DIR}/docs"
REPORTS_DIR="${ROOT_DIR}/reports"

mkdir -p "${DOCS_DIR}/assets"

cp "${REPORTS_DIR}/customer_segmentation_report.html" "${DOCS_DIR}/report.html"
cp "${REPORTS_DIR}/assets/"*.png "${DOCS_DIR}/assets/"

cat > "${DOCS_DIR}/index.html" <<'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Customer Segmentation Report</title>
  <style>
    body { font-family: "Segoe UI", Tahoma, sans-serif; margin: 40px; color: #1f2937; }
    a { color: #2563eb; text-decoration: none; }
    a:hover { text-decoration: underline; }
    .card { max-width: 720px; border: 1px solid #e5e7eb; border-radius: 12px; padding: 20px; }
    .muted { color: #6b7280; }
  </style>
</head>
<body>
  <div class="card">
    <h1>Online Retail Customer Segmentation</h1>
    <p class="muted">Static deployment landing page</p>
    <p><a href="./report.html">Open Full Report</a></p>
  </div>
</body>
</html>
HTML

echo "Deployed static site to: ${DOCS_DIR}"
echo "Open: ${DOCS_DIR}/index.html"
