set -gx EDITOR nvim

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

fish_add_path -aP /var/lib/flatpak/exports/bin
fish_add_path -aP /home/neuron/bin
