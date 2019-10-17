#!/usr/bin/env bats

load test_semver
load libs/bats-support/load
load libs/bats-assert/load
load test_helper

@test "each is listed in jlenv commands" {
  run jlenv-commands
  assert_success
  assert_line 'each'
}

@test "commands --sh should not list each" {
  run jlenv-commands --sh
  assert_success
  refute_line 'each'
}

@test "commands --no-sh should list each" {
  run jlenv-commands --no-sh
  assert_success
  assert_line 'each'
}
