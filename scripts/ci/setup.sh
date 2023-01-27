#!/usr/bin/env bash

set -ex

npm ci
npx playwright install
npx playwright install-deps
