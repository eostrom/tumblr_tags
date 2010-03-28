Then /^I should see these tags:$/ do |table|
  table.diff!(tableish('#tumblr_tags li', '.tag, .count'))
end
