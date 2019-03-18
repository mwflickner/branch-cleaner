# branch-cleaner
Simple RubyGem that will delete all fully merged branches.

## Installation
### Gem From Source
`gem "branch-cleaner", :git => "git://github.com/mwflickner/branch-cleaner.git"`

## Usage
### Via Gem
Usages once the gem is installed is simple, just type the command `clean_branches` in the Git repository of your choice the gem will clean your branches.

### Via Source Code
To use from source code, move `lib/branch_cleaner.rb` into the Git repository of your choice and run
`ruby branch_cleaner.rb`
