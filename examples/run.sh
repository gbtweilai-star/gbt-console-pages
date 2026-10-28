#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
PYTHONPATH=src python -m gbt_console_pages info
PYTHONPATH=src python -m gbt_console_pages check --payload '{}'
PYTHONPATH=src python -m gbt_console_pages run   --payload '{}'
