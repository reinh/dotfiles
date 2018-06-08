STOW_OPTS="-v"
STOW_TARGETS="zsh emacs tmux"

default: install

install: prepare stow

prepare: remove_dsstore brew zgen

brew:
	@${PWD}/install_homebrew.sh

zgen:
	@[[ -d ${HOME}/.zgen ]] || git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen

remove_dsstore:
	@find ${PWD} -name '.DS_Store' -exec rm {} \;

stow:
	@for dir in ${STOW_TARGETS}; do \
		stow ${STOW_OPTS} $$dir ; \
	done
