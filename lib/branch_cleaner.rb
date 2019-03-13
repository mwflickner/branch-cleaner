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

# def get_branches_to_keep()
#   branches_to_keep = Set.new ["master"]
  # File.open(KEEP_BRANCHES_PATH, "r") do |f|
  #   f.each_line do |line|
  #     branches_to_keep.add(line.gsub(/\n/, ''))
  #   end
  # end
#   return branches_to_keep
# end

# def clean_branches()
#   branches_to_keep = Set.new ["master"]
#   branches = `git branch`.split("\n")
#   for branch in branches do
#     branch = branch.gsub(/^\s+/, '')
#     if branch.start_with?('*') || branches_to_keep.include?(branch)
#       puts "Skipping branch " + branch.gsub(/^\*?\s*/, '')
#     else
#       system("git branch -d " + branch)
#     end
#   end
# end
#
# clean_branches()
