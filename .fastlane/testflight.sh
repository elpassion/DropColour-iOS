#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
echo "This is a pull request. No deployment will be done."
exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
echo "Testing on a branch other than master. No deployment will be done."
exit 0
fi

last_commit=$(git log -1 --pretty=oneline)
array=($last_commit)
declare -p array
for keyword in ${array[@]}; do
if [[ "$keyword" == "[testflight]" ]]; then
echo "Deploy to Test Flight will be done."
# Add username to keychain
fastlane-credentials add --username mateusz.szklarek@elpassion.com --password $FASTLANE_PASSWORD
# Fix for issues with SSL in Ruby (only Xcode 7.3)
rvm reinstall 2.0.0-p643 --disable-binary
# TESTFLIGHT
fastlane testflight
exit 0
fi
done

