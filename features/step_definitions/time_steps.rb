require 'timecop'

Before do
  Timecop.return
end

When /^([0-9]+) days? go by$/ do |days|
  Timecop.travel(Time.now + days.to_i.days)
end
