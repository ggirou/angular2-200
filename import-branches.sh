#!/usr/bin/env bash -e

for STEP in {1..21}
do
    STEP=`printf %02d $STEP`
    rm -r step-$STEP step-$STEP-solution
    mkdir step-$STEP step-$STEP-solution
    git --work-tree ./step-$STEP checkout origin/step-$STEP -- .
    git --work-tree ./step-$STEP-solution checkout origin/step-$STEP-solution -- .
done
