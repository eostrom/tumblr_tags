# Tumblr Tags

Tumblr Tags is a simple web service to figure out a Tumblr blog's
most-used tags. I wanted to put the list on [my blog][slapdash] and
Tumblr's [customization tools][tumblr-customization] didn't provide
it, so here we are. I still don't have the list on my blog, but I have
learned some things.

[slapdash]: http://slapdash.erikostrom.com/
[tumblr-customization]: http://www.tumblr.com/docs/en/custom_themes

## Setup

I have no real idea how to set this up. It works for me! You'll need
Ruby, MongoDB and a bunch of gems.

## Usage

If you get it running, just go to the home page, type in a Tumblr
username and an optional limit on the results, and go get a snack.
The only way I found to figure out a user's top tags is to fetch all
of their posts and count. A cache prevents the service from doing this
more than once per user per day.

## Dependencies

Most of them are in the Gemfile. Big ones:

  * [Tumblr-RB][tumblr-rb] ([my fork of it][tumblr-rb-eostrom])
  * [Sinatra][sinatra]
  * [MongoDB][mongodb]
  * [MongoMapper][mongomapper]

Tests use [Cucumber][cucumber], [RR][rr], [VCR][vcr], and
[Timecop][timecop], which 90% of the time I mistype as "Timescape".

[tumblr-rb]: http://rubygems.org/gems/tumblr-rb
[tumblr-rb-eostrom]: https://github.com/eostrom/tumblr
[sinatra]: http://www.sinatrarb.com/
[mongodb]: http://www.mongodb.org/
[mongomapper]: http://mongomapper.com/
[cucumber]: http://cukes.info/
[rr]: https://github.com/btakita/rr
[vcr]: https://github.com/myronmarston/vcr
[timecop]: https://github.com/jtrupiano/timecop

## To Do

  * Make a data API (JSON, probably), or otherwise
  * figure out how to actually put it on a blog.
  * Maybe make the human interface nicer.
