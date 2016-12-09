#!/usr/bin/env bash -e

# Imports step folders from final branch commits
# step-01 commit -> step-01 folder
# step-01-solution commit -> step-01-solution folder
# ...

FINAL_BRANCH=step-21-solution
git log --pretty=format:"rm -r %s && mkdir %s && git --work-tree ./%s checkout %H -- ." $FINAL_BRANCH -- | xargs -I {} bash -c '{}'
