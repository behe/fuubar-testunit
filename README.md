fuubar-testunit
===============
Fuubar is an instafailing Test::Unit formatter that uses a progress bar instead of a string of letters and dots as feedback. It is a Test::Unit version of Fuubar for RSpec.

Installation
Installing Fuubar is easy. Just put it in your Gemfile:

    gem "fuubar-testunit", :git => "git://github.com/behe/fuubar-testunit.git"

Then run your tests like this:

    $ ruby my_test.rb --runner=fuubar

If you want to use Fuubar as your default formatter, simply put the options in your Rakefile:

    ENV["TESTOPTS"] = "--runner=fuubar"
