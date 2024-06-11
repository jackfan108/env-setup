# install homebrew
if command -v brew >/dev/null 2>&1; then
  echo "Homebrew is installed."
  brew --version
else
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
fi

# install command-line fuzzy finder
brew install fzf

# Difftastic is a structural diff tool that compares files based on their syntax.
brew install difftastic

# create and download zshrc
curl -o ~/.zshrc -L "https://raw.githubusercontent.com/jackfan108/env-setup/main/.zshrc"
source ~/.zshrc