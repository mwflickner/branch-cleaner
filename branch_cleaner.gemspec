Gem::Specification.new do |s|
  s.name        = 'branch_cleaner'
  s.version     = '0.2.1'
  s.executables << 'cleanbranches'
  s.licenses    = ['MIT']
  s.summary     = "A simple gem that will delete all fully merged branches"
  s.description = "Tired of cleaning your git repository's branches manually?
  This gem will delete all fully merged branches in your repo that are not
  1. the active branch
  2. the master branch
  3. Any branch specified in your repo's .branches_to_keep file"
  s.authors     = ["Matt Flickner"]
  s.email       = 'mwflickner@gmail.com'
  s.files       = ["lib/branch_cleaner.rb"]
  s.homepage    = 'https://rubygems.org/gems/branch_cleaner'
  s.metadata    = { "source_code_uri" => "https://github.com/mwflickner/git-branch-cleaner" }
end
