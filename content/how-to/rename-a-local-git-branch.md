---
Title: How do I rename a local Git branch?
Section: how to
---

## Summary

{{< highlight bash >}}
git branch -m <oldname> <newname>  # From any branch
git branch -m <newname>            # From current branch
{{< / highlight >}}

## Details

#### Renaming Any Other Branch

1. If you want to rename a branch while pointed to any branch, do:

{{< highlight bash >}}
git branch -m <oldname> <newname>
{{< / highlight >}}

#### Renaming Current Branch

1. If you want to rename the current branch, you can do:

{{< highlight bash >}}
git branch -m <newname>
{{< / highlight >}}

## Documentation

- [git branch](/documentation/latest/git-branch/)
