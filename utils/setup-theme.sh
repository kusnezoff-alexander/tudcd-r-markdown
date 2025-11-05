#!/usr/bin/env bash
set -e

# -----------------------------
# TU Dresden Beamer theme setup
# -----------------------------
ZIP_URL="https://github.com/tud-cd/tud-cd/archive/master.zip"
ZIP_FILE="theme/tudcd_master.zip"
TARGET_DIR="theme/tudcd_til_2025"
TUDCD_DIR="${TARGET_DIR}/tud-cd-master"

# Create theme directories if missing
mkdir -p theme/tudcd_since_2025_lego "${TARGET_DIR}"

if [ ! -d "${TUDCD_DIR}" ]; then
  echo "Downloading TU Dresden corporate design zip..."
  mkdir -p "$(dirname "${ZIP_FILE}")"
  curl -L "${ZIP_URL}" -o "${ZIP_FILE}"

  echo "Unzipping TU Dresden theme..."
  unzip -o "${ZIP_FILE}" -d "${TARGET_DIR}"
else
  echo "Directory '${TUDCD_DIR}' exists, skipping download."
fi
