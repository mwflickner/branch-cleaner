require 'set'

class BranchCleaner
  def self.get_current_directory()
    `pwd`
  end

  def self.get_repository_root()
    `git rev-parse --show-toplevel`.strip
  end

  def self.get_branches()
    `git branch`.split("\n").map {|b| b.strip }
  end

  def self.get_branches_to_keep()
    file = get_repository_root() + "/.branches_to_keep"
    keepers = Set.new ["master"]
    if File.exist?(file)
      File.readlines(file).each do |line|
        keepers.add(line.strip)
      end
    end
    return keepers
  end

  def self.clean()
    repo_root = get_repository_root() ; result = $?.success?
    if !result
      abort("Exiting, not in a git repository")
    end
    branches = get_branches()
    branches_to_keep = get_branches_to_keep()
    for branch in branches do
      branch_name = branch.gsub(/^\*?\s*/, '')
      if branches_to_keep.include?(branch_name)
        puts "Skipping branch " + branch_name
      elsif branch.start_with?('*')
        puts "Skipping active branch " + branch_name
      else
        system("git branch -d " + branch_name)
      end
    end
  end
end
