def tag_table
  tableish('#tumblr_tags li', '.tag, .count')
end

Then /^I should see these tags:$/ do |table|
  table.diff!(tag_table)
end

When /^I get ([0-9]+) tags? for "(.*)"$/ do |limit, blog|
  When %{I go to the home page}
  And %{I fill in "Tumblelog name" with "#{blog}"}
  And %{I fill in "Limit" with "#{limit}"}
  And %{I press "Tag Me"}
end

Then /^I should see ([0-9]+) tags?$/ do |count|
  assert_equal count.to_i, tag_table.size
end
