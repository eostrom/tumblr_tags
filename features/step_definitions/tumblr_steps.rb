Before do
  @tumblr_post_retrievals = 0
  any_instance_of(Tumblr::Reader) do |reader|
    stub.proxy(reader).each_post do |post_count|
      @tumblr_post_retrievals += 1
    end
  end
end

Then /^posts should have been retrieved (once|twice|[0-9]+ times?)$/ do |count|
  count = case count
          when 'once' then 1
          when 'twice' then 2
          else count.to_i
          end

  assert_equal count, @tumblr_post_retrievals
end
