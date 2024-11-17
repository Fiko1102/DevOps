# DevOps_Oct_2024
Repository for the DevOps related infrastructure setup.

###
 Git workflow to reconcile your branch with main

1. `git checkout main`
    1.1 `git rebase`
    1.2 `git pull`
2. `git pull`
3. `git checkout your/branch`
4. `git rebase main (conflicts possible)`
5. after you finish 
 `git push --force`
