alias avenv="source venv/bin/activate"
alias ..="cd .."
alias la="ls -a"

mcd () {
	mkdir -p -- $1
	cd -P -- $1
}

cloneme () {
	git clone https://github.com/cmdcjones/$1.git
}
