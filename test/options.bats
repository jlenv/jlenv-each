#!/usr/bin/env bats

load test_semver
load libs/bats-support/load
load libs/bats-assert/load
# load libs/bats-mock/stub
load test_helper

# Mock git to return the appropriate remote
# We would do this because we are running with test jlenv and not the 
# installed jlenv whcich would have all shims etc setup.
# https://stackoverflow.com/a/52546483/152860

@test "jlenv-each --quiet" {
  run jlenv-each --quiet echo true
  assert_success
  assert_output ''
}

# This will not actually run the given command against the Julia version...
# Simply because we don't have jlenv installed, shims etup etc.
# However, if the JLENV is set correctly then the correct Julia should be 
# invoked when the `julia` command is used.  
# That is `julia` will call the shim and so set the correct version. 
@test "jlenv-each --verbose displays installed Julias looped over" {
  create_versions v1.0.5 v1.0.5-rc99 v1.0.5-rc100 v1.0.5-rc371  

  run jlenv-each --verbose echo true
  assert_success
  assert_output --stdin <<'VRBS_MSG'
===[v1.0.5]=============================================================
 |  true

===[v1.0.5-rc100]=======================================================
 |  true

===[v1.0.5-rc371]=======================================================
 |  true

===[v1.0.5-rc99]========================================================
 |  true
VRBS_MSG
}

# Currently these options are broken - fix when refactoring scripts.

# @test "jlenv-each --noop" {
#   run jlenv-each --noop echo true
#   assert_success
#   assert_output --stdin <<'STD_MSG'

#   origin     https://github.com/jlenv/jlenv.git (fetch)
#   origin     https://github.com/jlenv/jlenv.git (push)
#   Updating jlenv
#   Skipping jlenv-plgnb; not an jlenv git repo
#   Skipping jlenv-plgnc; not an jlenv git repo
#   Skipping julia-plgna; not an jlenv git repo
# STD_MSG
# }

# @test "jlenv-each --quiet --noop should disregard the quiet switch" {
#   run jlenv-each --quiet --noop echo true
#   assert_success
#   assert_output --stdin <<'STD_MSG'

#   origin     https://github.com/jlenv/jlenv.git (fetch)
#   origin     https://github.com/jlenv/jlenv.git (push)
#   Updating jlenv
#   Skipping jlenv-plgnb; not an jlenv git repo
#   Skipping jlenv-plgnc; not an jlenv git repo
#   Skipping julia-plgna; not an jlenv git repo
# STD_MSG
# }
