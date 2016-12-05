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
2. Branches of release (Release branches)
3. Branches of patch (Hotfix branches)


## Rules

### Branch of functional (feature branches)

- Can be generated from: develop
- Must be put into: develop

The naming convention: anything except master, develop, release- *, or hotfix- *

#### Finished Adding functionality to develop

Finished functionality (feature) is poured back into the development branch (the develop) and into the next release.

    $ git checkout develop
    # Switched to branch 'develop'
    $ git merge --no-ff myfeature
    # Updating ea1b82a..05e9557
    # (Report on change)
    $ git branch -d myfeature
    # Deleted branch myfeature (was 05e9557).
    $ git push origin develop

**--no-ff** flag causes Git to always create a new commit object with a merger, even if the merger could be effected algorithm fast-forward. This allows you to save the information that there was a branch, and groups together all the modifications.


### Branches of release (release branches)

- Can be generated from: develop
- Must be put into: develop and master

The naming convention: release- *


#### Creating a release branch (release branch)

    $ git checkout -b release-1.2 develop
    # Switched to a new branch "release-1.2"
    $ ./bump-version.sh 1.2
    # Files modified successfully, version bumped to 1.2.
    $ git commit -a -m "Bumped version number to 1.2"
    # [Release-1.2 74d9424] Bumped version number to 1.2
    # 1 files changed, 1 insertions (+), 1 deletions (-)

#### Closing release branch

The first two steps in Git:

    $ git checkout master
    # Switched to branch 'master'
    $ git merge --no-ff release-1.2
    # Merge made by recursive.
    # (Report on change)
    $ git tag -a 1.2

Now release issued and tagged.
