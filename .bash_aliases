alias avenv="source venv/bin/activate"
alias ..="cd .."
alias la="ls -a"
alias nvc="cd ~/.config/nvim"
alias ph="cd ~/p"
alias sourceme="source ~/.bashrc"
alias mh="cd /mnt/c/Users/15712/Media"

mcd () {
	mkdir -p -- $1
	cd -P -- $1
}

cloneme () {
	git clone https://github.com/cmdcjones/$1.git
}
