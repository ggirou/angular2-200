#!/usr/bin/env bash -ex

# Recreates step branch from step folder
# step-01 folder -> step-01 branch
# step-01-solution folder -> step-01-solution branch
# ...

git branch -D step-01 || true
git checkout -f --orphan step-01
git reset --hard

# $1 step name
function create_branch() {
  git branch -D $1 || true
  git checkout -b $1
  git checkout master -- $1
  rsync -a --exclude '.git' --exclude '.idea' --exclude '*.iml' $1/ . --delete-after
  git add -A
  git commit --allow-empty -m $1
}

for STEP in {1..21}
do
    STEP=`printf %02d $STEP`
    create_branch step-$STEP
    create_branch step-$STEP-solution
done

git checkout master
git reset
