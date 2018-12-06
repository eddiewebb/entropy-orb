#!/usr/bin/env bats

# load custom assertions and functions
load bats_helper


# setup is run beofre each test
function setup {
  INPUT_PROJECT_CONFIG=${BATS_TMPDIR}/input_config-${BATS_TEST_NUMBER}
  PROCESSED_PROJECT_CONFIG=${BATS_TMPDIR}/packed_config-${BATS_TEST_NUMBER} 
  JSON_PROJECT_CONFIG=${BATS_TMPDIR}/json_config-${BATS_TEST_NUMBER} 
	echo "#using temp file ${BATS_TMPDIR}/"

  # the name used in example config files.
  INLINE_ORB_NAME="secret_scan"
}


@test "Job: full job expands properly" {
  # given
  process_config_with test/inputs/fulljob.yml

  # when
  assert_jq_match '.jobs | length' 1 #only 1 job
  assert_jq_match '.jobs["secret_scan/scan"].steps | length' 3

}

@test "Job: STep Ordering is Correct" {
  # given
  process_config_with test/inputs/fulljob.yml

  # whe
  assert_jq_match '.jobs["secret_scan/scan"].steps[0]' checkout
  assert_jq_match '.jobs["secret_scan/scan"].steps[1].run.name' 'Install truffleHog'
  assert_jq_match '.jobs["secret_scan/scan"].steps[2].run.name' 'Scan using truffleHog'

}






