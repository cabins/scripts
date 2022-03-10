#!/bin/bash

echo " * Change repository..."
termux-change-repo

echo " * Refresh repositories..."
pkg update -y

echo " * Setup for SDCard access..."
termux-setup-storage

echo " * Install more API..."
pkg install -y termux-api

echo " * Install develpment tools..."
echo " * Complete list: ccls | clang | curl | emacs | gdb | git | golang | llvm | man | mariadb | nodejs | openjdk-17 | openssh | proot-distro | python | rust | vim | wget"
pkg install -y ccls clang curl emacs gdb git golang llvm man mariadb nodejs openjdk-17 openssh proot-distro python rust vim wget

echo " * Setting up Emacs..."
git clone https://github.com/cabins/emacs.d ~/.emacs.d

echo " * You may configure MariaDB from: https://wiki.termux.com/wiki/MariaDB "
echo " * You may configure Postgresql from: https://wiki.termux.com/wiki/Postgresql "
