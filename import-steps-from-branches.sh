#!/usr/bin/env bash -e

# Imports step folders from step branches
# step-01 branch -> step-01 folder
# step-01-solution branch -> step-01-solution folder
# ...

for STEP in {1..21}
do
    STEP=`printf %02d $STEP`
    rm -r step-$STEP step-$STEP-solution
    mkdir step-$STEP step-$STEP-solution
    git --work-tree ./step-$STEP checkout origin/step-$STEP -- .
    git --work-tree ./step-$STEP-solution checkout origin/step-$STEP-solution -- .
done
