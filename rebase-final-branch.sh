#!/usr/bin/env bash -e

# Runs interactive rebase on final

FINAL_BRANCH=step-21-solution

git checkout $FINAL_BRANCH
git rebase -i --root
