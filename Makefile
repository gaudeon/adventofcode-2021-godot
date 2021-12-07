LANG="en_US.utf8"
GODOT_VERSION=3.2.2
GODOT_BIN=Godot_v${GODOT_VERSION}-stable_linux_headless.64
GODOT_ZIP=${GODOT_BIN}.zip
GODOT_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_ZIP}

test:
	./.godot/${GODOT_BIN} -d -s --path $GITHUB_WORKSPACE addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexit

.PHONY: test
