#!/bin/sh
# husky
# v1.1.2 darwin

scriptPath="node_modules/husky/run.js"
hookName=`basename "$0"`
gitParams="$*"

if [ "${HUSKY_DEBUG}" = "true" ]; then
  echo "husky:debug $hookName hook started..."
fi

if ! command -v node >/dev/null 2>&1; then
  echo "Can't find node in PATH, trying to find a node binary on your system"
fi

if [ -f $scriptPath ]; then
  node_modules/run-node/run-node $scriptPath $hookName "$gitParams"
else
  echo "Can't find Husky, skipping $hookName hook"
  echo "You can reinstall it using 'npm install husky --save-dev' or delete this hook"
fi
