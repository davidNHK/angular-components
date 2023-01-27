#!/usr/bin/env bash

set -ex

npx ng lint
npx ng build
npm run test
