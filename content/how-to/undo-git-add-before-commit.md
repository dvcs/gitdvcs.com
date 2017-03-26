---
Title: How to undo 'git add' before commit?
Section: how to
---

## Summary

```sh
git reset :file:  # Remove file from stage
git reset         # Remove all files from stage
```

## Details

### Undo File `git add` Before Commit

1. Reset file which will remove it from the current index (the "about to be committed" list) without changing anything else.

```sh
git reset :file:  # Remove file from stage
```

### Undo All Files `git add` Before Commit

2. Reset without any file name to unstage all due changes. This can come in handy when there are too many files to be listed one by one in a reasonable amount of time.

```sh
git reset         # Remove all files from stage
```

## Documentation

- [git branch](/documentation/latest/git-reset/)
