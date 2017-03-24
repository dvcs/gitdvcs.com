---
Title: How do I rename a local Git branch?
Section: how to
---

[http://stackoverflow.com/questions/6591213/how-do-i-rename-a-local-git-branch](http://stackoverflow.com/questions/6591213/how-do-i-rename-a-local-git-branch)

## Summary

```sh
git branch -m <oldname> <newname>  # From any branch
git branch -m <newname>            # From current branch
```

## Details

### Renaming Any Other Branch

1. If you want to rename a branch while pointed to any branch, do:

```sh
git branch -m <oldname> <newname>
```

### Renaming Current Branch

1. If you want to rename the current branch, you can do:

```sh
git branch -m <newname>
```

## Documentation

- [git branch]()
