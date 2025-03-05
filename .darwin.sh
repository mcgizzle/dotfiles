fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# >>> scala-cli completions >>>
fpath=("/Users/mcgizzle/Library/Application Support/ScalaCli/completions/zsh" $fpath)
# <<< scala-cli completions <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(rbenv init - --path)"
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

eval "$(jenv init -)"
