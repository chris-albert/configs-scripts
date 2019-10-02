Here is a place i have my mac scripts and configs.

* bash functions
    - Add `source ~/git/configs-scripts/profile` to your `~/.profile` to load this profile
* IntelliJ settings
    - ./intellij_settings.jar
* git configs
    - Run `ln -s ~/git/configs-scripts/gitconfig ~/.gitconfig`
    - Add local config in `~/.gitlocal`
      ```
      [user]
        name = asdf-fdsa
        email = asdf@gmail.com
      ```
    - Add bash git status https://github.com/magicmonty/bash-git-prompt
* vim config
    - Run `ln -s ~/git/configs-scripts/vimrc ~/.vimrc`
* tmux config
    - Run `ln -s ~/git/configs-scripts/.tmux.conf ~/.tmux.conf`
    - Run `ln -s ~/git/configs-scripts/.tmux.conf.local ~/.tmux.conf.local`

I would imagine that you can just link to these files so that i can keep them backed up in git.

Mac Programs:
* Alfred - Cmd + Space
* Moom - Shift + Ctrl + Enter
* Docker
* 1password
* git
* IntelliJ
* nvm `brew install nvm` cloning from git doesn't work on Mac
* sbt (scala)
* Kalidescope
* Atom
* Little Snitch
* MySql Workbench
* stack (haskell)

For Alfred, sync your alfred to `this-dir/Alfred`

* b -> chrome bookmarks
* gh -> git hub autocomplete
* j -> jenkins jobs autocomplete
* p -> open iterm to project
* hotkey cmd + shift + d -> scala test diff with kalidescope
* uuid -> gen and paste uuid
* t -> tower
* g -> google autocomplete
* slk -> slack (dont really use, tooo slow)
