# Platform detection (NOTE: I don't support windows)
ifndef PLATFORM
  ifeq ($(shell uname),Darwin)
    PLATFORM=osx
  else
    PLATFORM=linux
  endif
endif

BREW = /usr/local/bin/brew
STOW = /usr/local/bin/stow
ZGEN = ~/.zgen
EMACS_D = ~/.emacs.d
TPM = ~/.tmux/plugins/tpm

default: install

.PHONY: install
install: deps stow brew-bundle

# Stow

.PHONY: stow restow delete
stow: Makefile stow/Makefile deps
	@$(MAKE) -C stow stow

restow: Makefile stow/Makefile deps
	@$(MAKE) -C stow restow

delete: Makefile stow/Makefile deps
	@$(MAKE) -C stow delete

# Deps

.PHONY: deps
deps: $(BREW) $(STOW) $(ZGEN) $(TPM)

# TRAVIS=true installs homebrew without user interaction
$(BREW):
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install | TRAVIS=true ruby

$(STOW): $(BREW)
	$(BREW) install stow

$(ZGEN):
	git clone https://github.com/tarjoilija/zgen.git $@

.PHONY: brew-bundle
brew-bundle: ~/.BrewedAt

# An empty target used to prevent unnecessary brew bundling.
# See https://www.gnu.org/software/make/manual/make.html#Empty-Targets
~/.BrewedAt: ~/Brewfile
	$(BREW) bundle --file=~/Brewfile | grep -v '^Using'
	@touch $@

$(EMACS_D):
	git clone --depth 1 -b develop 'https://github.com/syl20bnr/spacemacs' $@

$(TPM):
	git clone 'https://github.com/tmux-plugins/tpm' $@ && \
	~/.tmux/plugins/tpm/bin/install_plugins

.PHONY: linux
linux: $(ZGEN) $(EMACS_D) $(TPM) stow
