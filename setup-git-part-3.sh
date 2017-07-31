# make sure we run this from inside example repo
cd $(dirname "$0")

mkdir ../git-1.3-exercise-1
cd ../git-1.3-exercise-1

git clone https://github.com/jan-warchol/git-example.git --bare server

for dev in Alice Bob; do
  git clone server $dev
  cd $dev
  git config user.name "$dev"
  git config user.email "$dev@example.com"
  cd ..
done
