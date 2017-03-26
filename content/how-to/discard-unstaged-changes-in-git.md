---
Title: How do I discard unstaged changes in Git?
Section: how to
---

## Summary

1. Stashing files (Can recover later)

```sh
git stash save --keep-index
```

2. Cleaning files (Cannot recover later)

```sh
git clean -fd
git checkout -- .
```

## Details

### Stashing Files

1. `git stash` saves files in a stashed list of temporary repository edits.

```sh
git stash save --keep-index
```

2. After stashing, you can drop that stash with a `git stash drop` command if you like.

### Cleaning Files

1. `git clean` removes all untracked files (warning: while it won't delete ignored files mentioned directly in .gitignore, it may delete ignored files residing in folders) and `git checkout` clears all unstaged changes.

```sh
git clean -fd
git checkout -- .
```

## Documentation

- [git stash](/documentation/latest/git-stash/)
- [git clean](/documentation/latest/git-clean/)
