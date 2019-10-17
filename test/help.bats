#!/usr/bin/env bats

load libs/bats-support/load
load libs/bats-assert/load
load test_helper

@test 'jlenv-help 'each' help is available' {
  run jlenv-help 'each'
  assert_success
  assert_output --stdin <<HLP_MSG
Usage: jlenv each [--noop|--verbose|--quiet|--version|--help] <command> [arg1 arg2...]

Executes a command for each Julia version by setting JLENV_VERSION.
Failures are collected and reported at the end.

--verbose Verbose mode. Prints a header for each Julia.
--quite   Quite mode. Prints no output.
--noop    Print would-be command only. Command is not executed.

For more information on jlenv-each, see:
https://github.com/jlenv/jlenv-each#readme

HLP_MSG
}
