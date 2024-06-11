# install homebrew
if command -v brew >/dev/null 2>&1; then
  echo -e "👍\033[0;96m Homebrew\033[0m is installed. Version=$(brew --version)"
else
  echo -e "✅\033[0;96m Installing Homebrew\033[0m"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jackfan/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install command-line fuzzy finder
if command -v fzf >/dev/null 2>&1; then
  echo -e "👍\033[0;96m fzf\033[0m is installed; version=$(fzf --version)"
else
  echo -e "✅\033[0;96m Installing fzf (command-line fuzzy finder)\033[0m"
  brew install fzf
fi

# Difftastic is a structural diff tool that compares files based on their syntax.
if command -v fzf >/dev/null 2>&1; then
  echo -e "👍\033[0;96m difftastic\033[0m is installed"
else
  brew install difftastic
fi

# create and download zshrc
echo -e "✅ download \033[0;96m .zshrc\033[0m"
curl -o ~/.zshrc -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/.zshrc"
echo -e "✅ source \033[0;96m .zshrc\033[0m"

if [ -e /Users/jackfan/Library/Application Support/Sublime Text 3/Packages/User ]; then
  echo -e "✅ download \033[0;96m sublime keymap\033[0m"
  curl -o "/Users/jackfan/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap" -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/https://raw.githubusercontent.com/jackfan108/env-setup/main/Default%20(OSX).sublime-keymap"
else
  echo -e "🔸sublime text may not be installed; skipping keymap download"
fi