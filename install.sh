#!/usr/bin/env bash

# Install script to create all of the symlinks for this directory

function safe_link {
  FROM_FILE=$1
  TO_FILE=$2

  if [[ -e "${TO_FILE}" && ! -L "${TO_FILE}" ]]; then
    echo "Moving ${TO_FILE} to ${TO_FILE}_bak"
    mv "${TO_FILE}" "${TO_FILE}_bak"
  fi
  ln -sfv "${FROM_FILE}" "${TO_FILE}"
}

function install_files {
  FROM_DIR=$1
  TO_DIR=$2
  PREFIX_WITH_DOT=$3

  if [[ -z "${FROM_DIR}" ]]; then
    echo "Cannot copy files from an empty directory!"
    return 1
  fi

  if [[ ! -e "${TO_DIR}" ]]; then
    echo "Making directory ${TO_DIR}"
    mkdir .ssh 2>/dev/null
    if [[ ! -d "${TO_DIR}" ]]; then
      echo "Directory ${TO_DIR} does not exist after attempting to make it. Skipping."
      return 1
    fi
  elif [[ ! -d "${TO_DIR}" ]]; then
    echo "${TO_DIR} exists and is not a directory. Skipping installation from ${FROM_DIR}"
    return 1
  fi

  echo "Installing files from ${FROM_DIR} to ${TO_DIR}"

  if [[ -d "${FROM_DIR}" ]]; then
    for file in "${FROM_DIR}"/*
    do
      file_name=`basename "${file}"`

      if [[ -z "$PREFIX_WITH_DOT" ]]; then
        safe_link "${FROM_DIR}"/${file_name} "${TO_DIR}/${file_name}"
      else
        safe_link "${FROM_DIR}"/${file_name} "${TO_DIR}/.${file_name}"
      fi
    done
  fi
}

function install_fonts {
  OS=$1
  if [[ "Darwin" -eq "$OS" ]]; then
    echo "Checking to see if we need to install the SourceCodePro TTF files..."
    FONTS_INSTALLED=0
    LOCAL_FONT_DIRECTORY=fonts/SourceCodePro_FontsOnly-1.017/TTF
    SYSTEM_FONT_DIRECTORY=/System/Library/Fonts

    for file in ${LOCAL_FONT_DIRECTORY}/*.ttf
    do
      basename=`basename ${file}`
      if ! [[ -e "${SYSTEM_FONT_DIRECTORY}/${basename}" ]]; then
        FONTS_INSTALLED=$((FONTS_INSTALLED + 1))
        sudo cp "$file" "${SYSTEM_FONT_DIRECTORY}/${basename}"
      fi
    done

    echo "Installed ${FONTS_INSTALLED} fonts."
  fi
}

function link_bash_profile_includes {
  FROM_DIR=$1
  if [[ -z "${FROM_DIR}" ]]; then
    echo "Cannot copy files from an empty directory!"
    return 1
  fi

  STARTING_DIRECTORY=`pwd`
  cd "$HOME"

  if [[ -e ".bash_profile_includes" && ! -L ".bash_profile_includes" ]]; then
    echo "${HOME}/.bash_profile_includes already exists and is not symlink\'ed. Not modifying."
  elif [[ -L ".bash_profile_includes" ]]; then
    echo "${HOME}/.bash_profile_includes is a symlink already. Removing it and pointing it here."
    rm ~/.bash_profile_includes
    ln -sfv "${START_PWD}/bash_profile_includes" .bash_profile_includes
  else
    ln -sfv "${START_PWD}/bash_profile_includes" .bash_profile_includes
  fi

  cd "${STARTING_DIRECTORY}"

}

function backup_vim_files {
  if [[ -e ".vimrc" && ! -L ".vimrc" ]]; then
    mv .vimrc .vimrc_bak
  elif [[ -L ".vimrc" ]]; then
    rm .vimrc
  fi
}

function pull_down_janus {
  STARTING_DIRECTORY=`pwd`
  # assume Janus will always have janus directory
  if ! [[ -e ".vim/janus" ]]; then
    # only go through Janus installation if it doesn't seem to be present.
    if [[ -e ".vim" && ! -L ".vim" ]]; then
      mv .vim .vim_bak
    elif [[ -L ".vim" ]]; then
      rm .vim
    fi
    echo "Cloning Janus (https://github.com/carlhuda/janus) into .vim"
    git clone -q git://github.com/carlhuda/janus.git ~/.vim
  fi

  # make sure Janus is up to date.
  cd $HOME/.vim
  rake
  cd ..

  if [[ -e ".janus" && ! -L ".janus" ]]; then
    mv .janus .janus_bak
  elif [[ -L ".janus" ]]; then
    rm .janus
  fi
  ln -sfv ${START_PWD}/submodules/vim_plugins .janus

  cd $STARTING_DIRECTORY
}

########## MAIN ###########
if [[ $0 == ./* ]]; then
  START_PWD=`pwd`
else
  START_PWD=`dirname $0`
fi

if [[ -d "${HOME}/Google Drive/dotfiles" ]]; then
  PRIVATE_FILE_PATH="${HOME}/Google Drive/dotfiles"
fi

mkdir "${HOME}/bin" 2>/dev/null

backup_vim_files
pull_down_janus

echo "Fetching submodules..."
git submodule init
git submodule update

link_bash_profile_includes "$START_PWD"
install_files "${START_PWD}"/bin "${HOME}"/bin
install_files "${START_PWD}"/ssh "${HOME}/.ssh"
install_files "${START_PWD}"/dotfiles "${HOME}" true
install_fonts `uname -s`

if [[ -n "${PRIVATE_FILE_PATH}" ]]; then
  install_files "${PRIVATE_FILE_PATH}"/bin "${HOME}"/bin
  install_files "${PRIVATE_FILE_PATH}"/ssh "${HOME}/.ssh"
  install_files "${PRIVATE_FILE_PATH}"/dotfiles "${HOME}" true
fi
