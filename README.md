# branch-cleaner
Simple RubyGem that will delete all fully merged branches.

*Disclaimer: Use at your own risk. If you use this and it deletes a branch you don't want deleted, that's on you.*

## Installation
### From RubyGems
You can install via [RubyGems.org](https://rubygems.org/gems/branch_cleaner)

`gem install branch_cleaner`

Or install with a Gemfile:

`gem 'branch_cleaner', '~> 0.1.0'`

### Gem From Source
Clone the repo. Then `cd` in to the root directory of the repository and run

`gem build branch_cleaner.gemspec`

`gem install ./branch_cleaner-0.1.0.gem`

And that's it! If you want to run the tests, just run `rake`.

You can also install from source with a Gemfile:

`gem "branch-cleaner", :git => "git://github.com/mwflickner/branch-cleaner.git"`

## Usage
### Via Gem
Once the gem is installed, usages is simple, just type the command `cleanbranches` in the Git repository of your choice and the gem will clean your branches.
