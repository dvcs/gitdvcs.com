---
Title: How to modify staged (existing/unpushed) commit(s) in Git?
Section: how to
---

## Summary

Modify previous staged commit

{{< highlight bash >}}
git commit --amend
{{< / highlight >}}

Modify previous staged commit with *new* message

{{< highlight bash >}}
git commit --amend -m "Updated commit message"
{{< / highlight >}}

Modify any previous commit message

{{< highlight bash >}}
git rebase --interactive $parent_of_flawed_commit
{{< / highlight >}}

## Details

**Modify Staged Commit And Push To Remote**

1. This command will pen your editor, allowing you to change the commit message of the most recent commit.

{{< highlight bash >}}
git commit --amend
{{< / highlight >}}

This command lets you set the commit message directly in the command line with:

{{< highlight bash >}}
git commit --amend -m "Updated commit message"
{{< / highlight >}}

Make sure you don't have any working copy changes staged before doing this or they will get committed too. (Unstaged changes will not get committed.)

2. If you've already pushed your commit up to your remote branch, then you'll need to [force push]() the commit with

{{< highlight bash >}}
git push --force <remote> <branch>  # Force push
git push -f <remote> <branch>       # Shorter
{{< / highlight >}}



<div class="alert alert-warning" role="alert"><b>Warning: force-pushing will overwrite the remote branch with the state of your local one.</b> If there are commits on the remote branch that you don't have in your local branch, you will lose those commits.</div>


<div class="alert alert-warning" role="alert"><b>Warning: be cautious about amending commits that you have already shared with other people.</b> Amending commits essentially rewrites them to have different SHA IDs, which poses a problem if other people have copies of the old commit that you've rewritten. Anyone who has a copy of the old commit will need to synchronize their work with your newly re-written commit, which can sometimes be difficult, so make sure you coordinate with others when attempting to rewrite shared commit history, or just avoid rewriting shared commits altogether.</div>

**Modify Multiple Previous Local Commits**

1. If you want to fix several flawed commits, pass the parent of the oldest one of them.

{{< highlight bash >}}
git rebase --interactive $parent_of_flawed_commit  # Interactive
git rebase -i $parent_of_flawed_commit             # Shorter
{{< / highlight >}}

2. An editor will come up, with a list of all commits since the one you specified in `$parent_of_flawed_commit`.
- Change `pick` to `reword` (or on old versions of Git, to `edit`) in front of any commits you want to fix.
- Once you save, Git will replay the listed commits.

3. For each commit you want to reword, Git will drop you back into your editor. For each commit you want to edit, Git drops you into the shell. If you’re in the shell:

{{< highlight bash >}}
# Change the commit in any way you like.
git commit --amend
git rebase --continue
{{< / highlight >}}

Most of this sequence will be explained to you by the output of the various commands as you go. It’s very easy, you don’t need to memorize it – just remember that `git rebase --interactive` lets you correct commits no matter how long ago they were.


## Documentation

- [git branch](/documentation/latest/git-commit/)
- [git push](/documentation/latest/git-rebase/)
