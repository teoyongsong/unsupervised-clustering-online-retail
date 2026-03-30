"""Utility helpers for the Online Retail clustering project."""

from __future__ import annotations

import pandas as pd


def add_total_amount(df: pd.DataFrame) -> pd.DataFrame:
    """Return a copy with TotalAmount = Quantity * Price."""
    out = df.copy()
    out["TotalAmount"] = out["Quantity"] * out["Price"]
    return out


def clean_transactions(df: pd.DataFrame) -> pd.DataFrame:
    """Basic transaction cleaning for Online Retail style data."""
    out = df.copy()

    out = out.dropna(subset=["Customer ID"])
    out["Invoice"] = out["Invoice"].astype(str)
    out = out[~out["Invoice"].str.startswith("C")]
    out = out[(out["Quantity"] > 0) & (out["Price"] > 0)]
    out["InvoiceDate"] = pd.to_datetime(out["InvoiceDate"])

    return add_total_amount(out)
