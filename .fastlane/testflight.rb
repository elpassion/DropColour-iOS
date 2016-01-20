
last_commit_line = `git log -1 --pretty=oneline`.split(' ')
first_word = last_commit_line[1]
message = last_commit_line[2..-1].join(' ')

if first_word == '[testflight]'
  File.open('CHANGELOG', 'w') { |file| file.write(message) }
  `./.fastlane/testflight.sh`
end
