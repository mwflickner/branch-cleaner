Gem::Specification.new do |s|
  s.name        = 'branch_cleaner'
  s.version     = '0.2.0'
  s.executables << 'cleanbranches'
  s.licenses    = ['MIT']
  s.summary     = "A simple gem that will delete all fully merged branches"
  s.description = "Are you tired of cleaning your git repository's branches manually? This simple gem will delete all fully merged branches that are not the active branch or the master branch."
  s.authors     = ["Matt Flickner"]
  s.email       = 'mwflickner@gmail.com'
  s.files       = ["lib/branch_cleaner.rb"]
  s.homepage    = 'https://rubygems.org/gems/example'
  s.metadata    = { "source_code_uri" => "https://github.com/mwflickner/git-branch-cleaner" }
end
