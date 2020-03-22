require 'minitest/autorun'
require 'branch_cleaner'

def branch_cleaner_length_test(start_length, end_length)
  BranchCleaner.get_branches().length.must_equal start_length
  BranchCleaner.clean()
  BranchCleaner.get_branches().length.must_equal end_length
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
      branch_count = BranchCleaner.get_branches().length
      result = BranchCleaner.clean()
      puts result
      branch_cleaner_length_test(branch_count, branch_count)
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
          branch_cleaner_length_test(1, 1)
        end
      end
      describe "when there are more branches than master" do
        before do
          `git checkout -b test1`
        end
        describe "when all branches all fully merged" do
          describe "when there is just the active branch and master" do
            it "does not delete master or the active branch" do
              branch_cleaner_length_test(2, 2)
            end
          end
          describe "when there is master, an active branch, and other branches" do
            before do
              `git checkout -b test2`
            end
            it "does deletes all branches except master and the active branch" do
              branch_cleaner_length_test(3, 2)
            end
          end
          describe "when master is the active branch" do
            before do
              `git checkout master`
            end
            it "deletes all branches except master" do
              branch_cleaner_length_test(2, 1)
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
