local STARSHIP_BINDIR="$HOME/.local/bin"

starship_exist() {
	command -v "$STARSHIP_BINDIR/starship" >/dev/null 2>&1
}

starship_install() {
	curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir "$STARSHIP_BINDIR"
}

if ! starship_exist; then
	starship_install
	# Restart zsh for loading the starship command.
	exec zsh
fi
