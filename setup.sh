# install homebrew
if command -v brew >/dev/null 2>&1; then
  echo -e "\033[0;96m Homebrew\033[0m is installed. Version=$(brew --version)"
else
  echo -e "\033[0;96m Installing Homebrew\033[0m"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/jackfan/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install command-line fuzzy finder
if command -v fzf >/dev/null 2>&1; then
  echo -e "\033[0;96m fzf\033[0m is installed; version=$(fzf --version)"
  fzf --version
else
  echo -e "\033[0;96m Installing fzf (command-line fuzzy finder)\033[0m"
  brew install fzf
fi

# Difftastic is a structural diff tool that compares files based on their syntax.
if command -v fzf >/dev/null 2>&1; then
  echo -e "\033[0;96m difftastic\033[0m is installed"
else
  brew install difftastic
fi

# create and download zshrc
curl -o ~/.zshrc -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/.zshrc"
source ~/.zshrc