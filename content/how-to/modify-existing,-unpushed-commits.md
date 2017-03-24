---
Title: How to modify staged (existing/unpushed) commit(s) in Git?
Section: how to
---

http://stackoverflow.com/questions/179123/how-to-modify-existing-unpushed-commits

## Summary

Modify previous staged commit

```sh
git commit --amend
```

Modify previous staged commit with *new* message

```sh
git commit --amend -m "Updated commit message"
```

Modify any previous commit message

```sh
git rebase --interactive $parent_of_flawed_commit
```

## Details

### Modify Staged Commit And Push To Remote

1. This command will pen your editor, allowing you to change the commit message of the most recent commit.

```sh
git commit --amend
```

This command lets you set the commit message directly in the command line with:

```sh
git commit --amend -m "Updated commit message"
```

Make sure you don't have any working copy changes staged before doing this or they will get committed too. (Unstaged changes will not get committed.)

2. If you've already pushed your commit up to your remote branch, then you'll need to [force push]() the commit with

```sh
git push --force <remote> <branch>  # Force push
git push -f <remote> <branch>       # Shorter
```

**Warning: force-pushing will overwrite the remote branch with the state of your local one.** If there are commits on the remote branch that you don't have in your local branch, you will lose those commits.

**Warning: be cautious about amending commits that you have already shared with other people.** Amending commits essentially rewrites them to have different SHA IDs, which poses a problem if other people have copies of the old commit that you've rewritten. Anyone who has a copy of the old commit will need to synchronize their work with your newly re-written commit, which can sometimes be difficult, so make sure you coordinate with others when attempting to rewrite shared commit history, or just avoid rewriting shared commits altogether.

### Modify Multiple Previous Local Commits

1. If you want to fix several flawed commits, pass the parent of the oldest one of them.

```sh
git rebase --interactive $parent_of_flawed_commit  # Interactive
git rebase -i $parent_of_flawed_commit             # Shorter
```

2. An editor will come up, with a list of all commits since the one you specified in `$parent_of_flawed_commit`.
- Change `pick` to `reword` (or on old versions of Git, to `edit`) in front of any commits you want to fix.
- Once you save, Git will replay the listed commits.

3. For each commit you want to reword, Git will drop you back into your editor. For each commit you want to edit, Git drops you into the shell. If you’re in the shell:

```sh
# Change the commit in any way you like.
git commit --amend
git rebase --continue
```

Most of this sequence will be explained to you by the output of the various commands as you go. It’s very easy, you don’t need to memorize it – just remember that `git rebase --interactive` lets you correct commits no matter how long ago they were.


## Documentation

- [git commit]()
- [git rebase]()
