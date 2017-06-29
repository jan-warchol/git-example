# make sure we run this from inside example repo
cd $(dirname "$0")

# setup local branches
git checkout add-templates &>/dev/null
git checkout output-naming &>/dev/null
git checkout master &>/dev/null

# remove remote repo to focus on what's happening locally
git remote rm origin

