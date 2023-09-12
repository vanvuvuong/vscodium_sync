# VSCodium Setting Syncing Tools

#### The purpose of this repository is to help developers that use VSCodium (an OSS of VSCode) for multiple machine syncing settings more easily and effortlessly.

This repo is seperated with the main repo of VSCodium, and is a personal intended repo.

### Support enviroment:

-   Linux-based distribution (not included WSL)
-   Bash/Zsh shell
-   Syncing User Settings, Keymappings, Users Snippets & Extensions

### _Not-yet Support_:

-   Profile syncing

---

## Usage:

**Step 1**: Fork this repo to your own github account.

**Step 2**: Clone it (with `ssh` **OR** with `http` + `TOKEN`).

**Step 3**: Run script:

```
scripts/sync_codium.sh
```

**Step 4**: (optional) Push the new changes to repo

```
git push
```
