#! /bin/sh 

demoName=demoGitBranchMerge

[ -d $demoName ] || mkdir $demoName

cd $demoName

[ -d .git ] && rm -rf .git
for i in .gitignore text1 text2 ; do
	[ -f $i ] && rm -f $i
done

clear
set -v
# create a demo Git repository
git init
read x

# "Create some data files"
echo 1 > text1
echo 1 > text2

# Background housekeeping chore -- set up .gitignore file
echo *~ > .gitignore
echo *.swp >> .gitignore

head .gitignore

# Now add new files to index
git add text1 text2 .gitignore
read x

# and make the first Git commit
git commit -m "Initial commit on master branch"
read x

git tag "C1"
read x

# "Pretend to do more work"
echo 2 >> text1
echo 2 >> text2

# NB -a adds updates to *existing* files into index without seperate add
git commit -am "Second commit on master branch"
read x

git log --pretty=oneline --abbrev-commit --all --graph
read x

# Move back to first commit
git checkout C1

# Create a new branch for some work
git branch branch1

# Move the working copy to the new branch
git checkout branch1

# Pretend to do more work
echo b1 >> text1
echo b1 >> text2

# New work committed on branch
git commit -am "First commit on branch1"
read x

git log --pretty=oneline --abbrev-commit --all --graph
read x

# "Pretend to do more work"
echo b2 >> text1
echo b2 >> text2

git commit -am "Second commit on branch1"

git log --pretty=oneline --abbrev-commit --all --graph
read x

# Now move back to master branch
git checkout master
read x

# "Pretend to do more work"
echo 3 >> text1
echo 3 >> text2

git commit -am "Third commit on master branch"
read x

git log --pretty=oneline --abbrev-commit --all --graph
read x

# Bring changes from branch1 onto master
git merge branch1
read x

git status
read x

vim text1 text2

# After resolve -- we are still in middle of merge -- we add and commit
git add text1 text2
git commit -m "Merged Master and branch1 on `date +%A`"
read x

git log --pretty=oneline --abbrev-commit --all --graph
read x
