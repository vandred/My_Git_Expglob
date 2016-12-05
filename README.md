expglob
=====

## Main branches

#### The central repository contains two main branches exist all the time:

1. master
2. develop

#### We consider origin/master main branch. That is, the source code must be in its production-ready state at any arbitrary time.


## Ancillary branches

#### We use the following types of branches:

1. Branches of functionality (Feature branches)
2. The release branch (Release branches)
3. Branches of patch (Hotfix branches)


## Rules

Finished Adding functionality to develop

Finished functionality (feature) is poured back into the development branch (the develop) and into the next release.

    $ git checkout develop
    #Switched to branch 'develop'
    $ git merge --no-ff myfeature
    #Updating ea1b82a..05e9557
    #(Report on change)
    $ git branch -d myfeature
    #Deleted branch myfeature (was 05e9557).
    $ git push origin develop
