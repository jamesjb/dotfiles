#! /bin/sh
#
# setup.sh --- Set up symlinks for a new system.
#
# Copyright (C) 2013, James Bielman <jamesjb@gmail.com>
# All Rights Reserved.
#

# maybe_backup(FILE)
#
# Move FILE to FILE.orig if it exists.
maybe_backup()
{
  if [ -f "$1" ]; then
    echo "Backing up old $1"
    mv "$1" "$1.orig"
  fi
}

# symlink(SRC, DEST)
#
# Symlinks $PWD/SRC to $HOME/DEST, backing up any old file.
symlink()
{
  maybe_backup "$HOME/$2"
  echo "Symlinking $2"
  ln -s "$PWD/$1" "$HOME/$2"
}

symlink bashrc     .bashrc
symlink profile    .profile
symlink vimrc      .vimrc
symlink emacs.el   .emacs.el
symlink Xresources .Xresources
echo "Done."
