require 'set'

class BranchCleaner

  KEEP_BRANCHES_PATH = "./.keep_branches"

  def self.get_branches()
    branches = `git branch`.split("\n")
  end

  def self.clean()
    branches = get_branches()
    branches_to_keep = Set.new ["master"]
    for branch in branches do
      branch = branch.gsub(/^\s+/, '')
      if branch.start_with?('*') || branches_to_keep.include?(branch)
        puts "Skipping branch " + branch.gsub(/^\*?\s*/, '')
      else
        system("git branch -d " + branch)
      end
    end
  end
end
