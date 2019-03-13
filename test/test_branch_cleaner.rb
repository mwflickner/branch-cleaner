require 'minitest/autorun'
require 'branch_cleaner'

def branch_cleaner_length_test(start_length, end_length)
  BranchCleaner.get_branches().length.must_equal start_length
  BranchCleaner.clean()
  BranchCleaner.get_branches().length.must_equal end_length
end

describe BranchCleaner do
  before do
    # Need to make a new folder/repo eventually
    `git checkout master`
    BranchCleaner.clean()
  end
  describe "when current directory is not a git respositroy" do

  end
  describe "when current directory is a git repository" do
    describe "when the repository has no branches" do

    end
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
        describe "when not all branches are fully merged" do
          # TODO
          # describe "when the force option is not passed" do
          #   before do
          #     `git checkout -b test1`
          #     `git checkout -b test2`
          #     puts "creating and commiting testfile"
          #     `touch testfile.txt`
          #     `git add testfile.txt`
          #     `git commit -m "testfile commit"`
          #     `git checkout master`
          #   end
          #   it "deletes only the fully merged branches" do
          #     branch_cleaner_length_test(3,2)
          #   end
          # end
          # describe "when the force option is passed" do
          #   #TODO
          # end
        end
      end
    end
  end
end
