LANG=en_US.utf8
GODOT_VERSION=3.4
GODOT_DIR=.godot
GODOT_BIN=Godot_v${GODOT_VERSION}-stable_linux_headless.64
GODOT_ZIP=${GODOT_BIN}.zip
GODOT_URL=https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/${GODOT_ZIP}

ifeq ($(origin GITHUB_WORKSPACE), undefined)
	GITHUB_WORKSPACE = ${PWD}
endif

${GODOT_DIR}:
	mkdir -p ${GODOT_DIR}

${GODOT_DIR}/${GODOT_ZIP}: ${GODOT_DIR}
	curl -s -S ${GODOT_URL} --output ${GODOT_DIR}/${GODOT_ZIP}

${GODOT_DIR}/${GODOT_BIN}: ${GODOT_DIR}/${GODOT_ZIP}
	unzip -q -n ${GODOT_DIR}/${GODOT_ZIP} -d ${GODOT_DIR}
	chmod +x ${GODOT_DIR}/${GODOT_BIN}

clean:
	rm ${GODOT_DIR}/${GODOT_ZIP}
	rm ${GODOT_DIR}/${GODOT_BIN}
	rm -d ${GODOT_DIR}

test: ${GODOT_DIR}/${GODOT_BIN}
	${GODOT_DIR}/${GODOT_BIN} -d -s --path ${GITHUB_WORKSPACE} addons/gut/gut_cmdln.gd -gdir=res://test -ginclude_subdirs -gexit

.PHONY: clean test
