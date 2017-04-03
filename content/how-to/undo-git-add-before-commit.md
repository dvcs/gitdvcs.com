---
Title: How to undo `git add` before commit?
Section: how to
---

## Summary

{{< highlight bash >}}
git reset :file:  # Remove file from stage
git reset         # Remove all files from stage
{{< / highlight >}}

## Details

#### Undo File `git add` Before Commit

1. Reset file which will remove it from the current index (the "about to be committed" list) without changing anything else.

{{< highlight bash >}}
git reset :file:  # Remove file from stage
{{< / highlight >}}

#### Undo All Files `git add` Before Commit

2. Reset without any file name to unstage all due changes. This can come in handy when there are too many files to be listed one by one in a reasonable amount of time.

{{< highlight bash >}}
git reset         # Remove all files from stage
{{< / highlight >}}

## Documentation

- [git branch](/documentation/latest/git-reset/)
