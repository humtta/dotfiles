#!/usr/bin/env bash

set -eo pipefail

# Project root directory
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration files directory
config_dir="${root_dir}/config"
