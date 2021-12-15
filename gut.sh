#!/usr/bin/env bash

echo "  ▄████  █    ██ ▄▄▄█████▓   ▄▄▄█████▓▓█████   ██████ ▄▄▄█████▓  ██████ ";
echo " ██▒ ▀█▒ ██  ▓██▒▓  ██▒ ▓▒   ▓  ██▒ ▓▒▓█   ▀ ▒██    ▒ ▓  ██▒ ▓▒▒██    ▒ ";
echo "▒██░▄▄▄░▓██  ▒██░▒ ▓██░ ▒░   ▒ ▓██░ ▒░▒███   ░ ▓██▄   ▒ ▓██░ ▒░░ ▓██▄   ";
echo "░▓█  ██▓▓▓█  ░██░░ ▓██▓ ░    ░ ▓██▓ ░ ▒▓█  ▄   ▒   ██▒░ ▓██▓ ░   ▒   ██▒";
echo "░▒▓███▀▒▒▒█████▓   ▒██▒ ░      ▒██▒ ░ ░▒████▒▒██████▒▒  ▒██▒ ░ ▒██████▒▒";
echo " ░▒   ▒ ░▒▓▒ ▒ ▒   ▒ ░░        ▒ ░░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░   ▒ ▒▓▒ ▒ ░";
echo "  ░   ░ ░░▒░ ░ ░     ░           ░     ░ ░  ░░ ░▒  ░ ░    ░    ░ ░▒  ░ ░";
echo "░ ░   ░  ░░░ ░ ░   ░           ░         ░   ░  ░  ░    ░      ░  ░  ░  ";
echo "      ░    ░                             ░  ░      ░                 ░  ";
echo "                                                                        ";

LANG=en_US.utf8
GODOT_VERSION=3.4
GODOT_DIR=.godot
GODOT_BIN=Godot_v${GODOT_VERSION}-stable_linux_headless.64
GODOT_ZIP=${GODOT_BIN}.zip
GODOT_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_ZIP}

if [[ -z "${GITHUB_WORKSPACE}" ]]; then
  GITHUB_WORKSPACE=$PWD
fi

mkdir -p ${GODOT_DIR}
curl -s -S ${GODOT_URL} --output ${GODOT_DIR}/${GODOT_ZIP}
unzip -q -n ${GODOT_DIR}/${GODOT_ZIP} -d ${GODOT_DIR}
chmod +x ${GODOT_DIR}/${GODOT_BIN}
${GODOT_DIR}/${GODOT_BIN} -d -s --path $GITHUB_WORKSPACE addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexit
