---
Title: How to undo last commit(s) in Git?
Section: how to
---

## Summary

{{< highlight bash >}}
git commit -m "Something terribly misguided"
git reset HEAD~1
# edit files as necessary
git add ...
git commit -c ORIG_HEAD
{{< / highlight >}}

## Details

#### Undo Last Commit

1. This is what you want to undo

{{< highlight bash >}}
git commit -m "Something terribly misguided"  
{{< / highlight >}}

2. This leaves your working tree (the state of your files on disk) unchanged but undoes the commit and leaves the changes you committed unstaged (so they'll appear as "Changes not staged for commit" in `git status` and you'll need to add them again before committing). If you only want to add more changes to the previous commit, or change the commit message1, you could use `git reset --soft HEAD~1` instead, which is like `git reset HEAD~1` but leaves your existing changes staged.

{{< highlight bash >}}
git reset HEAD~1
{{< / highlight >}}

3. Make corrections to working tree files
4. `git add` anything that you want to include in your new commit.

{{< highlight bash >}}
git add ...
{{< / highlight >}}

5. Commit the changes, reusing the old commit message. `reset` copied the old head to `.git/ORIG_HEAD`; `commit` with `-c ORIG_HEAD` will open an editor, which initially contains the log message from the old commit and allows you to edit it. If you do not need to edit the message, you could use the `-C` option.

{{< highlight bash >}}
git commit -c ORIG_HEAD
{{< / highlight >}}

## Documentation

- [git branch](/documentation/latest/git-commit/)
- [git push](/documentation/latest/git-reset/)