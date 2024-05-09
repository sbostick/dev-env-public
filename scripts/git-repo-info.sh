#!/bin/bash
set -eu

readonly METHOD=${1:-verbose}
case $METHOD in
  "simple")
    git config --get remote.origin.url
    ;;
  "urls")
    git remote -v
    ;;
  "smart")
    git ls-remote --get-url origin
    ;;
  "verbose")
    git remote show origin
    ;;
  *)
    cat <<EOF
ERROR unrecognized method [$METHOD]

USAGE:
  git-repo-info.sh [simple|urls|smart|verbose]
EOF
  ;;
esac
