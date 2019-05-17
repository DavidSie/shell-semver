#!/usr/bin/env bats

@test "version bump: major" {
  run ./increment_version.sh -M 1.2.3
  [ "$status" -eq 0 ]
  [ "$output" = "2.0.0" ]
}

@test "version bump: minor" {
  run ./increment_version.sh -m 1.2.3
  [ "$status" -eq 0 ]
  [ "$output" = "1.3.0" ]
}

@test "version bump: patch" {
  run ./increment_version.sh -p 1.2.3
  [ "$status" -eq 0 ]
  [ "$output" = "1.2.4" ]
}

@test "version bump: patch when there rc exist" {
  run ./increment_version.sh -p 1.2.3-rc1
  [ "$status" -eq 0 ]
  [ "$output" = "1.2.4" ]
}

@test "version bump: release candidate" {
  run ./increment_version.sh -r 1.2.3-rc1
  [ "$status" -eq 0 ]
  [ "$output" = "1.2.3-rc2" ]
}

@test "version bump: minor + release candidate when no rc" {
  run ./increment_version.sh -mr 1.2.3
  [ "$status" -eq 0 ]
  [ "$output" = "1.3.0-rc1" ]
}
