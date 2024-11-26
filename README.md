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


MIT course CS50 
```https://pll.harvard.edu/course/cs50-introduction-computer-science``

Aliases for the course


```
#AWS aliases
alias awswhoami='aws sts get-caller-identity'
alias awsprofilelist='aws configure list-profiles'
#Terraform aliases
alias tf='terraform'
alias k='kubectl'
alias kl='kubectl logs'
alias kd='kubectl delete'
alias kg='kubectl get'
alias kgd='kubectl get nodes'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kge='kubectl get events --sort-by=.metadata.creationTimestamp'
```