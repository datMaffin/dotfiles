# My Dotfiles
My dotfiles of TMUX, and Vim. 

## Installation
1. Clone the repository to a location of your choice 
   `$ git clone https://github.com/datMaffin/dotfiles.git`
2. `cd` into the repository(`$ cd dotfiles`). 
3. Execute `$ git submodule update --init --recursive` if you want all the 
   config files.
4. Execute the deploy script(`$ ./deploy.sh`) and choose which dotfiles to 
   source automatically when starting TMUX or Vim.

## Update
Execute `$ git pull` followed by `$ git submodule update --recursive`.
