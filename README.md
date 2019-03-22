# branch-cleaner
Simple RubyGem that will delete all fully merged branches.

*Disclaimer: Use at your own risk. If you use this and it deletes a branch you don't want deleted, that's on you.*

## Installation
### Gem From Source
Clone the repo. Then `cd` in to the root directory of the repository and run

`gem build branch_cleaner.gemspec`

`gem install ./branch_cleaner-0.1.0.gem`

And that's it! If you want to run the tests, just run `rake`.


You can also install from source with a Gemfile:

`gem "branch-cleaner", :git => "git://github.com/mwflickner/branch-cleaner.git"`

## Usage
### Via Gem
Usages once the gem is installed is simple, just type the command `clean_branches` in the Git repository of your choice and the gem will clean your branches.

### Via Source Code
To use from source code, move `lib/branch_cleaner.rb` into the Git repository of your choice and run
`ruby branch_cleaner.rb`
