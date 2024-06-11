export PATH="~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"

[ -f /usr/local/bin/subl ] || ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
export EDITOR=vim

# shows current branch with no arguments
# check out to the branch that first matches the regex pattern provided as 1st argument
function br () {
  if [[ -z "$1" ]]; then
    echo -e "\033[0;32m $(git br | grep -i \*) \033[0m"
  else
    git co $(git br | grep -i -m 1 $1)
  fi
}

# interactive function to loop through local branches and allows user to specify
# whether to delete the branch
function brd() {
  # for-each-ref is the "plumbing" low-level command for git
  # refs/heads/ means only fetching refs/heads, ignoring remotes and tags
  # refname fetches the name of the ref, omitting SHA
  for branchRef in $(git for-each-ref --format='%(refname)' refs/heads/); do
    # remove the "refs/heads/" in front
    branch=$(echo $branchRef | sed s/"refs\/heads\/"//g)
    if [[ $branch =~ (production)|(master)|(development) ]]; then
      echo -e "skipped \033[0;96m $branch\033[0m"
      continue
    fi
    echo -e "would you like to delete branch \033[0;96m $branch\033[0m ?"
    echo "Press [q] to quit, [y, N]"
    read answer
    tput cuu1 # move cursor up 1 line
    tput el   # clear to end of line
    tput cuu1
    tput el

    if [[ -z "$answer" || "$answer" == "n" || "$answer" == "N" ]]; then
      echo -e "  keeping \033[0;96m $branch\033[0m"
    elif [[ $answer == "q" ]]; then
      echo "exit..."
      break
    elif [[ $answer == "y" || $answer == "Y" ]]; then
      git br -D $branch
      echo -e "  deleted branch with command: git br -D \033[0;96m $branch\033[0m"
    fi
  done
}

function gss() {
  git stash show -p stash@{$([[ -z "$1" ]] && echo 0 || echo $1)}
}

function gsh() {
  git show head$([[ -z "$1" ]] || echo ~$1)
}

function gd() {
  git diff --shortstat
}

function gsf() {
  echo " - Here are the modified files:"
  echo -e "\033[0;95m"
  if [[ -z "$1" ]]; then
    git show --pretty="" --name-only head | awk '{print "    " $0}'
  else
    git show --pretty="" --name-only $1 | awk '{print "    " $0}'
  fi
  echo -e "\033[0m"
}

function src() {
  source ~/.zshrc
  echo -e "\033[0;32m ~/.zshrc sourced :)\033[0m"
}

function gpoh() {
  git push origin head
}

function gp() {
  # temp is upstream + branch name: "origin master" for example
  # temp=$(git rev-parse --symbolic-full-name --abbrev-ref @{upstream} | sed 's!/! !')
  # echo -e "running command: \033[0;32m git pull -p --ff-only $temp \033[0m"
  # git pull -p --ff-only $temp
  current_branch=$(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
  echo -e "running command: \033[0;32m git pull -p --ff-only origin $current_branch \033[0m"
  git pull -p --ff-only origin $current_branch
}

git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.aa "add -A"
git config --global alias.cm "commit -m"
git config --global alias.ca "commit --amend"
git config --global alias.lol "log --pretty=oneline"
git config --global alias.rbi "rebase -i"
git config --global alias.rba "rebase -a"
git config --global alias.rbc "rebase -c"

# use difftastic
git config --global diff.external difft

git config --global color.ui true
git config --global color.diff always
git config --global color.diff.old "red bold"
git config --global color.diff.new "green bold"
git config --global color.status.changed "blue normal"
git config --global color.status.untracked "red normal"
git config --global color.status.added "black normal"
git config --global color.status.updated "green normal"
git config --global color.status.branch "yellow normal bold"
git config --global color.status.header "white normal bold"


# AIRLAB-DO-NOT-MODIFY section:ShellWrapper {{{
# Airlab will only make edits inside these delimiters.

# Source Airlab's shell integration, if it exists.
if [ -e ~/.airlab/shellhelper.sh ]; then
  source ~/.airlab/shellhelper.sh
fi
# AIRLAB-DO-NOT-MODIFY section:ShellWrapper }}}

export CDPATH=.\
:${HOME}\
:${HOME}/airlab\
:${HOME}/airlab/repos\
:${HOME}/airlab/repos/treehouse\
:${HOME}/airlab/repos/treehouse/projects\
:${HOME}/airlab/repos/treehouse/projects/payments\
:${HOME}/airlab/repos/sysops\
:${HOME}/airlab/repos/onetouch-codelabs/projects\


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
