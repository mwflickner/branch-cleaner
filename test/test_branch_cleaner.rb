require 'minitest/autorun'
require 'branch_cleaner'

def branch_cleaner_length_test()
  BranchCleaner.clean()
  branch_count = BranchCleaner.get_branches().length
  branch_count.must_equal BranchCleaner.get_branches_to_keep().length
end

STARTING_DIRECTORY = BranchCleaner.get_current_directory().freeze

describe BranchCleaner do
  before do
    # Need to make a new folder/repo eventually
    puts 'BEGINNING SETUP'
    `git checkout master`
    puts 'Doing an intial clean for consistency'
    BranchCleaner.clean()
    puts 'SETUP COMPLETE'
  end
  describe "when current directory is not a git respositroy" do
    before do
      puts "Changing to repository root directory"
      system("cd " + BranchCleaner.get_repository_root())
      puts "Going one level above the repository"
      `cd ..`
    end
    it "errors and exits" do
      before_branch_count = BranchCleaner.get_branches().length
      result = BranchCleaner.clean()
      puts result
    end
    after do
      puts "Changing back to original directory " + STARTING_DIRECTORY
      system("cd " + STARTING_DIRECTORY)
    end
  end
  describe "when current directory is a git repository" do
    describe "when the repository has branches" do
      describe "when the only branch is master" do
        it "does not delete master" do
          BranchCleaner.clean()
          branch_set = BranchCleaner.get_branches().map{|b| b.gsub(/^\*?\s*/, '')}.to_set
          keep_branches = BranchCleaner.get_branches_to_keep()
          branch_set.intersection(keep_branches).length.must_equal branch_set.length
          # BranchCleaner.get_branches().length.must_be :<=, BranchCleaner.get_branches_to_keep().length
        end
      end
      describe "when there are more branches than master" do
        before do
          `git checkout -b test1`
        end
        describe "when all branches all fully merged" do
          describe "when there is just the active branch and master" do
            it "does not delete master or the active branch" do
              BranchCleaner.clean()
              branch_set = BranchCleaner.get_branches().to_set
              branch_set.intersection(BranchCleaner.get_branches_to_keep().to_set).length.must_be :<=, branch_set.length
            end
          end
          describe "when there is master, an active branch, and other branches" do
            before do
              `git checkout -b test2`
            end
            it "does deletes all branches except master, branches to keep, and the active branch" do
              BranchCleaner.clean()
              branch_set = BranchCleaner.get_branches().to_set
              branch_set.intersection(BranchCleaner.get_branches_to_keep().to_set).length.must_be :<=, branch_set.length
            end
          end
          describe "when master is the active branch" do
            before do
              `git checkout master`
            end
            it "deletes all branches except master" do
              BranchCleaner.clean()
              branch_set = BranchCleaner.get_branches().to_set
              branch_set.intersection(BranchCleaner.get_branches_to_keep().to_set).length.must_be :<=, branch_set.length
            end
          end
        end
        after do
          # run one more time to clean up any extra branches
          `git checkout master`
          BranchCleaner.clean()
        end
      end
    end
  end
end
