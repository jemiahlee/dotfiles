#!/usr/bin/env bash

# Install script to create all of the symlinks for this directory

function canonical_path {
  # Absolutizes and canonicalizes a path's directory portion (following any
  # symlinks in it) without following the path's own final component --
  # used to compare "what a symlink literally points at" against a source
  # file, even when that source file is itself a symlink (e.g. the
  # Hammerspoon Spoons, which point on into a submodule).
  local p=$1
  local dir
  dir=$(cd -P "$(dirname "$p")" 2>/dev/null && pwd -P)
  [[ -z "$dir" ]] && return 1
  echo "${dir}/$(basename "$p")"
}

function resolve_symlink {
  # Resolves a (possibly relative, possibly dangling) one-level symlink to
  # an absolute path, without relying on GNU-only `readlink -f`.
  local link=$1
  local raw_target
  raw_target=$(readlink "$link")
  if [[ "$raw_target" != /* ]]; then
    raw_target="$(dirname "$link")/${raw_target}"
  fi
  canonical_path "$raw_target"
}

function is_owned_by_a_stow_dir {
  # Mirrors GNU Stow's own multi-stow-dir convention: a symlink is legitimately
  # stow-owned if it resolves to a path under some directory containing a
  # ".stow" marker file (see `info stow` -- Multiple Stow Directories).
  local resolved=$1
  [[ -e "$resolved" ]] || return 1
  local d="$resolved"
  while [[ -n "$d" && "$d" != "/" ]]; do
    [[ -f "${d}/.stow" ]] && return 0
    d=$(dirname "$d")
  done
  return 1
}

function stow_with_backup {
  local stow_dir=$1 target_dir=$2
  shift 2

  for pkg in "$@"; do
    while IFS= read -r -d '' src_file; do
      local rel=${src_file#"$stow_dir"/"$pkg"/}
      local translated=""
      local IFS_OLD=$IFS
      IFS=/
      local segments=($rel)
      IFS=$IFS_OLD
      local segment
      for segment in "${segments[@]}"; do
        if [[ $segment == dot-* ]]; then
          segment=".${segment#dot-}"
        fi
        if [[ -z "$translated" ]]; then
          translated="$segment"
        else
          translated="${translated}/${segment}"
        fi
      done
      local target="${target_dir}/${translated}"

      # Walk from target_dir down to target's parent, clearing out any
      # stale directory symlink left over from the pre-stow install (e.g.
      # the old whole-directory ~/.bash_profile_includes symlink). If we
      # instead hit a symlink that's legitimately stow-owned (this run's
      # or a cooperating repo's, per the .stow marker), stop -- stow will
      # unfold it correctly on its own, and the leaf below is just the
      # real source file seen through that fold, not a conflict.
      local ancestor_is_link=false
      local check_dir=$(dirname "$target")
      while [[ "$check_dir" != "$target_dir" && "$check_dir" != "/" ]]; do
        if [[ -L "$check_dir" ]]; then
          local resolved
          resolved=$(resolve_symlink "$check_dir")
          if [[ -n "$resolved" ]] && is_owned_by_a_stow_dir "$resolved"; then
            ancestor_is_link=true
          else
            echo "Removing stale directory symlink at ${check_dir}"
            rm "$check_dir"
          fi
          break
        fi
        check_dir=$(dirname "$check_dir")
      done

      if [[ "$ancestor_is_link" == true ]]; then
        continue
      fi

      if [[ -L "$target" ]]; then
        local target_points_to
        target_points_to=$(resolve_symlink "$target")
        if [[ "$target_points_to" != "$(canonical_path "$src_file")" ]]; then
          echo "Removing stale symlink at ${target}"
          rm "$target"
        fi
      elif [[ -e "$target" ]]; then
        echo "Moving ${target} to ${target}_bak"
        mv "$target" "${target}_bak"
      fi
    done < <(find "${stow_dir}/${pkg}" \( -type f -o -type l \) -print0)
  done

  stow -d "$stow_dir" -t "$target_dir" --dotfiles -R "$@"
}

function safe_link {
  FROM_FILE=$1
  TO_FILE=$2

  if [[ -e "${TO_FILE}" && ! -L "${TO_FILE}" ]]; then
    echo "Moving ${TO_FILE} to ${TO_FILE}_bak"
    mv "${TO_FILE}" "${TO_FILE}_bak"
  elif [[ -e "${TO_FILE}" ]]; then
    echo "Removing symlink to ${FROM_FILE}"
    rm "${TO_FILE}"
  fi

  ln -sfv "${FROM_FILE}" "${TO_FILE}"
}

function setup_scm_breeze {
  THIS_DIR=`pwd`
  scmbDir="$THIS_DIR/submodules/scm_breeze"
  SCM_BREEZE_INSTALL_DIR="$HOME/.scm_breeze"

  if [[ ! -e "$SCM_BREEZE_INSTALL_DIR" ]]; then
    echo "Installing scm_breeze: Symlinking $SCM_BREEZE_INSTALL_DIR to $scmbDir"
    ln -fs "$scmbDir" "$SCM_BREEZE_INSTALL_DIR"
    source "$scmbDir/lib/scm_breeze.sh"
    echo "Installing scm_breeze: Creating .scmbrc"
    _create_or_patch_scmbrc
    echo "Installing scm_breeze: Completed."
  else
    echo "Installing scm_breeze: Extant symlink $SCM_BREEZE_INSTALL_DIR, skipping install."
  fi
}

function backup_vim_files {
  pushd "${HOME}" > /dev/null

  if [[ -e ".vim" && -e ".vim/janus" ]]; then
    mv .vim .vim_bak
  fi

  popd > /dev/null
}

########## MAIN ###########
if [[ $0 == ./* ]]; then
  START_PWD=`pwd`
else
  START_PWD=`dirname $0`
fi

git submodule init
echo "First, ensuring submodules are up-to-date."
git submodule update --recursive

stow_with_backup "${START_PWD}/stow" "${HOME}" bin shell bash_profile_includes hammerspoon claude

PRIVATE_DIR="${START_PWD}/../dotfiles-private"
if [[ -d "${PRIVATE_DIR}/stow" ]]; then
  stow_with_backup "${PRIVATE_DIR}/stow" "${HOME}" bin shell bash_profile_includes ssh
  gpg --import "${PRIVATE_DIR}/gpg_key/keyfile"
  if [[ -x "${PRIVATE_DIR}/custom-install.sh" ]]; then
    "${PRIVATE_DIR}/custom-install.sh"
  fi
elif [[ -d "$PRIVATE_DIR" ]]; then
  echo "WARNING: ${PRIVATE_DIR} exists but has no stow/ directory yet -- migrate it to the new layout. Skipping private dotfiles." >&2
else
  cat <<EOTEXT
Ran the install process without a private repository. If you would like to take
advantage of this additional functionality, you will need to have a "dotfiles-private"
directory at the same place as this directory. Please see the README for more info.

EOTEXT

fi

echo
echo "Setting up SCM Breeze..."
setup_scm_breeze
echo
echo "If you'd like programmer fonts, please install them using FontBook on a Mac."
echo "There are several fonts in the /fonts dir, and more information in the README.md in this repository."
echo

if [[ $1 != '--no-vim' ]]; then
  echo "Running VIM file installation."
  echo "Backing up old VIM files as necessary."
  backup_vim_files

  if [[ ! -d "${HOME}"/.vim/autoload ]]; then
    mkdir -p ~/.vim/autoload
  fi
  safe_link "${START_PWD}/submodules/vim-plug/plug.vim" "${HOME}/.vim/autoload/plug.vim"

  # something about this is outputting crap the to screen at the end of the install
  # TODO: figure this out and fix that
  echo "Installing VIM plugins via vim-plug"
  vim -s "${START_PWD}/install/vim_startup_commands"
fi
