mkdir ../exercise-1
cd ../exercise-1

git clone https://github.com/jan-warchol/git-example.git --bare central
git clone central alice
git clone central bob

cd alice
git config user.name "Alice"
cd ../bob
git config user.name "Bob"

