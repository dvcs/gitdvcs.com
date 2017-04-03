---
Title: How do I discard unstaged changes in Git?
Section: how to
---

## Summary

1. Stashing files (Can recover later)

{{< highlight bash >}}
git stash save --keep-index
{{< / highlight >}}

2. Cleaning files (Cannot recover later)

{{< highlight bash >}}
git clean -fd
git checkout -- .
{{< / highlight >}}

## Details

**Stashing Files**

1. `git stash` saves files in a stashed list of temporary repository edits.

{{< highlight bash >}}
git stash save --keep-index
{{< / highlight >}}

2. After stashing, you can drop that stash with a `git stash drop` command if you like.

**Cleaning Files**

1. `git clean` removes all untracked files (warning: while it won't delete ignored files mentioned directly in .gitignore, it may delete ignored files residing in folders) and `git checkout` clears all unstaged changes.

{{< highlight bash >}}
git clean -fd
git checkout -- .
{{< / highlight >}}

## Documentation

- [git stash](/documentation/latest/git-stash/)
- [git clean](/documentation/latest/git-clean/)
