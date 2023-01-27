#!/usr/bin/env bash

set -ex

npx ng lint
npx ng build ngx-components
npm run test
