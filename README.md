expglob
=====

## Main branches

### The central repository contains two main branches exist all the time:

1. master
2. develop

#### We consider origin/master main branch. That is, the source code must be in its production-ready state at any arbitrary time.


## Ancillary branches

### We use the following types of branches:

1. Branches of functionality (Feature branches)
2. The release branch (Release branches)
3. Branches of patch (Hotfix branches)


## Rules

### Branch of functional (feature branches)

- Can be generated from: develop
- Must be put into: develop

The naming convention: anything except master, develop, release- *, or hotfix- *

### Finished Adding functionality to develop

Finished functionality (feature) is poured back into the development branch (the develop) and into the next release.

    $ git checkout develop
    #Switched to branch 'develop'
    $ git merge --no-ff myfeature
    #Updating ea1b82a..05e9557
    #(Report on change)
    $ git branch -d myfeature
    #Deleted branch myfeature (was 05e9557).
    $ git push origin develop

**--no-ff** flag causes Git to always create a new commit object with a merger, even if the merger could be effected algorithm fast-forward. This allows you to save the information that there was a branch, and groups together all the modifications.
