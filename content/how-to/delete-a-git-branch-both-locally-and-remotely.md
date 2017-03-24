---
Title: How to delete a Git branch both locally and remotely?
Section: how to
---

[http://stackoverflow.com/questions/2003505/how-to-delete-a-git-branch-both-locally-and-remotely](http://stackoverflow.com/questions/2003505/how-to-delete-a-git-branch-both-locally-and-remotely)

## Summary

Deleting a local branch:

```sh
git branch --delete <branch>  
git branch -d <branch>        # Shorter version
git branch -D <branch>        # Force delete un-merged branches
```

Deleting a remote branch:

```sh
git push origin --delete <branch>  # Git version 1.7.0 or newer
git push origin :<branch>          # Git versions older than 1.7.0
```

Deleting a local remote-tracking branch:

```sh
git branch --delete --remotes <remote>/<branch>
git branch -dr <remote>/<branch> # Shorter

git fetch <remote> --prune # Delete multiple obsolete tracking branches
git fetch <remote> -p      # Shorter
```

## Details

### Delete Local And Remote Branch

1. To delete the local branch.

> The `-d` option is an alias for `—delete`, which only deletes the branch if it has already been fully merged in its upstream branch. You could also use `-D`, which is an alias for `—delete --force`, which deletes the branch "irrespective of its merged status."

```sh
git branch -d branch_name
```

2. To delete remote branch

As of [Git v1.7.0](https://github.com/gitster/git/blob/master/Documentation/RelNotes/1.7.0.txt), you delete a remote branch using:

```sh
git push origin --delete <branch_name>
```

Before [Git v1.7.0](https://github.com/gitster/git/blob/master/Documentation/RelNotes/1.5.0.txt), you delete remote branches using:

```sh
git push origin :<branch_name>
```


## Documentation

- [git branch]()
- [git push]()
