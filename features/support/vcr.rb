require 'vcr'

VCR.config do |c|
  c.stub_with :fakeweb
  c.cassette_library_dir     = 'features/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
end

VCR.cucumber_tags do |t|
  t.tag  '@tumblr_movingtompls'
end

FakeWeb.allow_net_connect = false
