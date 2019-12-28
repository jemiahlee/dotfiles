#!/usr/bin/env bash

# Install script to link a file from dotfiles/bin to $HOME/bin

if [[ $0 == ./* ]]; then
  START_PWD=`pwd`
else
  START_PWD=`dirname $0`
fi


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

function install_file {
  BINFILE=$1
  BINDIR="${HOME}/bin"

  echo "Installing ${BINFILE} into ${BINDIR}"

  if [[ -e "$BINFILE" ]]; then
    file_name=`basename "${BINFILE}"`

    safe_link "${START_PWD}/${BINFILE}" "${BINDIR}/${file_name}"
  else
    echo "${BINFILE} does not exist. Skipping."
  fi
}

install_file $1
