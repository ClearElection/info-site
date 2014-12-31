# info.clearelection.org

This repo contains the static site generator for info.clearelection.org

It's a [Middleman 3.x](http://middlemanapp.com/) project using [Compass](http://compass-style.org)/[SASS](http://sass-lang.com/), [HAML](http://haml-lang.com/), [Coffeescript](http://coffeescript.org), [bower](http://Bower.io), and [Foundation](http://foundation.zurb.com), among other things.

Important commands:

* `bundle update`
* `bower update`
* `middleman server` - test on `http://localhost:4567`
* `rake release` - push to live site.  Requires a local file `keys/aws.yml` (.gitignore'd) with the appropriate AWS authorization data.
