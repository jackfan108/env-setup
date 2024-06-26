# some ~ are not working :(
HOME=$(pwd)

# install homebrew
if command -v brew >/dev/null 2>&1; then
  echo -e "👍\033[0;96m Homebrew\033[0m installed already. Version=$(brew --version)"
else
  echo -e "✅\033[0;96m Installing Homebrew\033[0m"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install iterm2
if [ -e /Applications/iterm.app ]; then
  echo -e "👍\033[0;96m iterm2\033[0m installed already"
else
  echo -e "✅\033[0;96m Installing iterm2\033[0m"
  brew install iterm2 > /dev/null 2>&1
fi

# install gotham theme on iterm
if [ -e "$HOME/Library/Preferences/com.googlecode.iterm2.plist" ] && grep Gotham "$HOME/Library/Preferences/com.googlecode.iterm2.plist"; then
  echo -e "👍\033[0;96m gotham theme\033[0m installed"
else
  echo -e "✅ download \033[0;96mgotham theme\033[0m"
  curl -sSo Gotham-stable.itermcolors -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/Gotham-stable.itermcolors"
  open Gotham-stable.itermcolors
  rm Gotham-stable.itermcolors
fi

# install sublime text
if [ -e /Applications/Sublime\ Text.app ]; then
  echo -e "👍\033[0;96m Sublime Text\033[0m installed already"
else
  SUBLIME_FIRST_START_WARNING=1
  echo -e "✅\033[0;96m install Sublime Text\033[0m"
  brew install --cask sublime-text > /dev/null 2>&1
  # here we manually create these dirs because these dirs don't get created until we run subl for the first time
  mkdir -p "$HOME/Library/Application Support/Sublime Text/Installed Packages"
  mkdir -p "$HOME/Library/Application Support/Sublime Text/Packages/User"
  echo -e "✅\033[0;96m download Sublime Package Control\033[0m"
  curl -sSo "$HOME/Library/Application Support/Sublime Text/Installed Packages/Package Control.sublime-package" -L "https://packagecontrol.io/Package%20Control.sublime-package"
fi

# install command-line fuzzy finder
if command -v fzf >/dev/null 2>&1; then
  echo -e "👍\033[0;96m fzf\033[0m installed already; version=$(fzf --version)"
else
  echo -e "✅\033[0;96m Installing fzf (command-line fuzzy finder)\033[0m"
  brew install fzf > /dev/null 2>&1
  source <(fzf --zsh)
fi

# Difftastic is a structural diff tool that compares files based on their syntax.
if brew list | grep difftastic; then
  echo -e "👍\033[0;96m difftastic\033[0m installed already"
else
  echo -e "✅\033[0;96m Installing difftastic\033[0m"
  brew install difftastic > /dev/null 2>&1
fi

# create and download zshrc
echo -e "✅ download \033[0;96m .zshrc\033[0m"
curl -sSo $HOME/.zshrc -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/.zshrc"
echo -e "✅ source \033[0;96m .zshrc\033[0m"

if [ -e "$HOME/Library/Application Support/Sublime Text" ]; then
  echo -e "✅ download \033[0;96m sublime preference settings\033[0m"
  curl -sSo "$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings" -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/Preferences.sublime-settings"
  echo -e "✅ download \033[0;96m sublime keymap\033[0m"
  curl -sSo "$HOME/Library/Application Support/Sublime Text/Packages/User/Default (OSX).sublime-keymap" -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/Default%20(OSX).sublime-keymap"
  echo -e "✅ download \033[0;96m sublime mousemap\033[0m"
  curl -sSo "$HOME/Library/Application Support/Sublime Text/Packages/User/Default (OSX).sublime-mousemap" -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/Default%20(OSX).sublime-mousemap"
  echo -e "✅ download \033[0;96m sublime package list\033[0m"
  curl -sSo "$HOME/Library/Application Support/Sublime Text/Packages/User/Package Control.sublime-settings" -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/Package%20Control.sublime-settings"
else
  echo -e "🔸sublime text may not be installed; skipping settings/bindings download"
fi

if [[ -n $SUBLIME_FIRST_START_WARNING && $SUBLIME_FIRST_START_WARNING -eq 1 ]]; then
  echo -e "📙 Note that if you're starting Sublime for the first time, it would complain about certain packages not existing. The installed package-manager should auto-resolve this within seconds. Use \033[0;96m subl\033[0m or \033[0;96m subl .\033[0m to start Sublime."
fi
