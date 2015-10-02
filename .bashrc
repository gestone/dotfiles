# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load the shell dotfiles, and then some:
for file in ~/.{aliases,bash_prompt,exports,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# auto complete git
#if [ -f ~/.git-completion.bash ]; then
#    . ~/.git-completion.bash
#fi

GIT_PROMPT_ONLY_IN_REPO=1

source ~/.bash-git-prompt/gitprompt.sh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# add autojump

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# Added by the Heroku Toolbelt
# Export PS1 to show directory
export PS1="\u@\h \w> "
