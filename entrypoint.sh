#!/bin/bash

ROOT_DIR="/go/src/module"
EXAMPLES_DIR="${ROOT_DIR}/examples"
MODULE_DIR="${ROOT_DIR}/module"
TEST_DIR="${ROOT_DIR}/test"

_install_terraform() {
  cd $MODULE_DIR
  tfenv install
  tfenv use
  cd -
}

_lint() {
    for dir in "$MODULE_DIR" "$EXAMPLES_DIR"; do
      cd $MODULE_DIR
      terraform fmt -check -recursive .
      terraform init
      terraform validate
      cd -
    done
}

_test() {
  cd "$TEST_DIR"
  go test -v .
  cd -
}

action="$INPUT_ACTION"

if [ -z "$action" ]; then
  action="all"
fi

_install_terraform

case "$action" in
  "all")
    _lint
    _test
  ;;
  "lint")
    _lint
  ;;
  "test")
    _test
  ;;
  *)
    echo "Unknown action: '$action'"
    exit 1
  ;;
esac
