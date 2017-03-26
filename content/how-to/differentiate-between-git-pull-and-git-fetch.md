---
Title: What is the difference between 'git pull' and 'git fetch'?
Section: how to
---

## Summary

`git pull` == `git fetch` + `git merge`

## Details

### How `git pull` And `git fetch` Work

In the simplest terms, `git pull` does a `git fetch` followed by a `git merge`.

1. `git pull`
When you use `git pull`, Git tries to automatically do your work for you. **It is context sensitive**, so Git will merge any pulled commits into the branch you are currently working in.  `git pull` **automatically merges the commits without letting you review them first.** If you don’t closely manage your branches, you may run into frequent conflicts.

2. `git fetch`
When you `git fetch`, Git gathers any commits from the target branch that do not exist in your current branch and **stores them in your local repository.** However, **it does not merge them with your current branch.** This is particularly useful if you need to keep your repository up to date, but are working on something that might break if you update your files. To integrate the commits into your master branch, you use `git merge`.

You can do a `git fetch` at any time to update your remote-tracking branches under `refs/remotes/<remote>/`.

## Documentation

- [git pull](/documentation/latest/git-pull/)
- [git fetch](/documentation/latest/git-fetch/)
- [git merge](/documentation/latest/git-merge/)