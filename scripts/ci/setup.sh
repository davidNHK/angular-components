#!/usr/bin/env bash

set -ex

npm install
npx playwright install
npx playwright install-deps
