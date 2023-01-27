#!/usr/bin/env bash

set -ex

export HUSKY=0
# https://github.com/orgs/community/discussions/26560
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git config user.name "github-actions[bot]"
echo "//registry.npmjs.org/:_authToken=\${NPM_TOKEN}" > ~/.npmrc

if [ -n "$PREFERRED_VERSION" ]; then
  echo "Use version: $PREFERRED_VERSION"
  VERSION=$PREFERRED_VERSION
else
  echo "Use date version"
  if [ "$GITHUB_REF_NAME" == "development" ]; then
    echo "Use date version on development"
    VERSION=$(date +"%Y.%-m.%-d-alpha.$(($(date +"%-H") + 1))%M")
  else
    echo "Use date version on main"
    VERSION=$(date +'%Y.%-m.%-d')
  fi
fi
export RELEASE_BRANCH="release-$VERSION"
COMMIT_MESSAGE="publish v$VERSION [skip ci]"
git switch -c "$RELEASE_BRANCH"
git push --set-upstream origin "$RELEASE_BRANCH"

npx ng build ngx-components
cd ./dist/ngx-components
npm version -m "$COMMIT_MESSAGE" $VERSION
npm publish
export RELEASE_VERSION=$VERSION
