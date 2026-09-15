private_dir := "../dotfiles-private"

# List available recipes
default:
    @just --list

# Relink all stow packages (safe to run after adding/removing files)
restow: restow-public restow-private

restow-public:
    stow -d stow -t ~ --dotfiles -R bin shell bash_profile_includes hammerspoon

restow-private:
    #!/usr/bin/env bash
    set -euo pipefail
    if [[ -d "{{private_dir}}/stow" ]]; then
        stow -d "{{private_dir}}/stow" -t ~ --dotfiles -R bin shell bash_profile_includes ssh
    fi
