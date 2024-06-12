The setup script does the following:
- install [homebrew](https://brew.sh/)
- install [iterm2](https://iterm2.com/)
- install [gotham theme](https://github.com/whatyouhide/gotham-contrib) in iterm2
- install [Sublime Text](https://www.sublimetext.com/)
- install [fzf (command-line fuzzy finder)](https://github.com/junegunn/fzf)
- install [difftastic](https://github.com/Wilfred/difftastic)
- define Sublime settings
  - user preferences settings
  - osx key binding
  - osx mouse binding
  - packages
- setup `.zshrc` and source it

Paste the following in your terminal:
```sh
curl -sL "https://raw.githubusercontent.com/jackfan108/env-setup/main/setup.sh" | bash
```

Once you're done, you can start using iTerm and Sublime Text (command: `subl`)
