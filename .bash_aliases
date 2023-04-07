alias avenv="source venv/bin/activate"
alias ..="cd .."
alias la="ls -a --color=auto"
alias ll="ls -al --color=auto"
alias ls="ls --color=auto"
alias nvc="cd ~/.config/nvim"
alias sourceme="source ~/.bashrc"

mcd () {
	mkdir -p -- $1
	cd -P -- $1
}

cloneme () {
	git clone git@github.com:cmdcjones/$1.git
}

storeproj () {
    export CPJ=$PWD
    echo "Path to project stored"
}

cdproj () {
    cd $CPJ
}

vim () {
    nvim $1
}
