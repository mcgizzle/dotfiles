export ZSH="$HOME/.oh-my-zsh"
export EDITOR=/usr/local/bin/nvim

export ORGVUE_API="$HOME/code/orgvue-api"

# AWS ###################################################################################
export DATA_AWS_KMS_ALIAS="alias/orgvue-seanmcgroarty"
export DATA_AWS_ACCESSKEY=$(awk -F"aws_access_key_id =" '{print $2}' $HOME/.aws/credentials | tr -d " \t\n\r" )
export DATA_AWS_SECRETKEY=$(awk -F"aws_secret_access_key =" '{print $2}' $HOME/.aws/credentials | tr -d " \t\n\r")
