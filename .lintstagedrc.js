'use strict';

module.exports = {
  '*.md': ['prettier --write'],
  '*.{json,js,ts,yml,yaml}': ['eslint --fix', 'prettier --write'],
};
