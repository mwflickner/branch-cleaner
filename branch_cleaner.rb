def get_branches()
  branches = `git branch`
  puts branches
end

def clean_branches()
  branches_to_keep = ['master']
end

get_branches()
