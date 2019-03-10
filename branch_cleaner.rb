require 'set'

def clean_branches()
  branches = `git branch`.split("\n")
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

clean_branches()
