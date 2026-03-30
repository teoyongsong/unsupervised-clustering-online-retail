# Online Retail II Customer Segmentation

Customer segmentation project using unsupervised learning on the Online Retail II dataset.  
The workflow builds RFM features, trains clustering models, labels business-ready segments, and publishes results as an HTML report.

## Project Goal

Identify actionable customer groups (for example: high-value loyal, at-risk, and potential loyalists) to support retention, upsell, and reactivation campaigns.

## Project Structure

```text
unsupervised-clustering-online-retail/
├── data/
│   ├── raw/                         # source dataset (xlsx/csv)
│   └── processed/
│       └── customer_segments.csv    # final customer-level output
├── models/
├── notebooks/
│   └── 01_customer_segmentation_starter.ipynb
├── reports/
│   ├── customer_segmentation_report.html
│   └── assets/
│       ├── segment_size.png
│       ├── avg_revenue_by_segment.png
│       └── customer_segments_pca.png
├── scripts/
│   └── deploy_report.sh
├── docs/                            # generated deployable site
│   └── customer_segmentation_slides.html
├── environment.yml
├── requirements.txt
└── README.md
```

## Dataset

- Source: [UCI Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii)
- Expected filename/location: `data/raw/online_retail_II.xlsx`

The notebook also checks common variants (`Online Retail II.xlsx`, `online_retail.csv`, etc.) inside `data/raw/`.

## Environment Setup

Use Conda (recommended):

```bash
conda env create -f environment.yml
conda activate unsupervised-clustering-online-retail
python -m ipykernel install --user --name unsupervised-clustering-online-retail --display-name "Python (UCRetail Clustering)"
```

## Run the Analysis

1. Open `notebooks/01_customer_segmentation_starter.ipynb`
2. Select kernel: `Python (UCRetail Clustering)`
3. Run all cells

Notebook outputs include:
- data loading and cleaning
- RFM feature creation
- KMeans baseline + silhouette tuning
- KMeans vs GMM comparison
- PCA visualization
- segment naming and business recommendations
- export to `data/processed/customer_segments.csv`

## View Report

- Main report: `reports/customer_segmentation_report.html`
- Included plots:
  - segment size
  - average revenue by segment
  - customer segments (PCA projection)

## Slide Deck

- Deck file: `docs/customer_segmentation_slides.html`
- Open in browser and use arrow keys to navigate.

## Deploy Report (Static Site)

Generate a deployable site in `docs/`:

```bash
bash scripts/deploy_report.sh
```

Then:
- open `docs/index.html` locally, or
- publish `docs/` with GitHub Pages (branch: `main`, folder: `/docs`).

## Segment Definitions (Current Baseline)

- `Champions`: recent, frequent, high-spending customers
- `Potential Loyalists`: moderate recency/frequency/monetary
- `At-Risk`: long inactive, low-frequency, lower-spending

## Notes

- Frequency and Monetary are log-transformed for clustering stability.
- Segment names are business labels and can be refined after each retraining run.
