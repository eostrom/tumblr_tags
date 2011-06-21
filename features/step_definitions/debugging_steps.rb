Then /^print the page$/ do
  puts response_body
end

Then /^where am I\?$/ do
  puts current_url
end

Then /^\{(.*)\}$/ do |ruby|
  eval ruby
end

Then /^debug$/ do
  debugger
end
