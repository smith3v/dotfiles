set -gx EDITOR vim

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

fish_add_path -aP /var/lib/flatpak/exports/bin
