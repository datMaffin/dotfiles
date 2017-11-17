#####################
# cd, ls aliases... #

# some ls aliases
alias la='ls -la'

# cd alias to print out the files after cd
cdls() { cd "$@" && ls; }

# shortcuts for cd ..
alias cd.='cd ..'
alias cd..='cd .. && cd ..'
alias cd...='cd .. && cd .. && cd ..'

################################
# pushd, popd, dirs aliases... #

# pushd alias to a shorter command
alias pd='pushd'

# popd alias to a shorter command
alias po='popd'

# pushd alias to print out the files after pushd "ps"
pdls() { pushd "$@" && ls; }

# dirs alias for a better overview
alias dirs='dirs -v'

#################
# rm aliases... #

# always ask 
alias rm='rm -i'

##########################
# exit alias (vim style) #

alias q!='exit'
