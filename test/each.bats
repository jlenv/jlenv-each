#!/usr/bin/env bats

load libs/bats-support/load
load libs/bats-assert/load
load test_helper

@test "jlenv-each with no command shows useage help" {
  
  run jlenv-each
  assert_failure
  assert_output --stdin <<'HLP_MSG'
Usage: jlenv each [--noop|--verbose|--quiet|--version|--help] <command> [arg1 arg2...]
HLP_MSG
}

# This will not actually run the given command against the Julia version...
# Simply because we don't have jlenv installed, shims etup etc.
# However, if the JLENV is set correctly then the correct Julia should be 
# invoked when the `julia` command is used.  
# That is `julia` will call the shim and so set the correct version. 
@test "jlenv-each displays command result for each Julia version." {
  create_versions v1.0.5 v1.0.5-rc99 v1.0.5-rc100 v1.0.5-rc371  

  run jlenv-each echo true
  assert_success
  assert_output --stdin <<'STD_MSG'
 |  true
 |  true
 |  true
 |  true
STD_MSG

}
