STOW_OPTS="-v"
STOW_TARGETS="zsh emacs tmux git brew"

default: install

install: prepare stow

prepare: remove_dsstore install_brew install_stow install_zgen

install_brew:
	@${PWD}/install_homebrew.sh

install_stow:
	@command -v stow >/dev/null || brew install stow

install_zgen:
	@[[ -d ${HOME}/.zgen ]] || git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen

remove_dsstore:
	@find ${PWD} -name '.DS_Store' -exec rm {} \;

stow:
	@for target in ${STOW_TARGETS}; do \
		stow ${STOW_OPTS} $$target ; \
	done
