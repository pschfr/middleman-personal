# middleman-personal
Personal site built with Middleman. More to come.

# Running Locally
1. Clone the repo. `git clone https://github.com/pschfr/middleman-personal`
2. [Install Middleman](https://middlemanapp.com/basics/install/).
3. Run `bundle install` to install dependencies.
4. Finally, run with `bundle exec middleman server`.

# Deploying
Thanks to the [`middleman-gh-pages`](https://github.com/edgecase/middleman-gh-pages) gem, it's simple!
1. `rake build` to compile to the build directory, and
2. `rake publish` to build and publish to the `gh-pages` branch!
