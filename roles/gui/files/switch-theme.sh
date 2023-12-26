#!/bin/bash

PROGRAM_NAME=$(basename "${0}")

switch_config_gtk() {
	if [ "${1}" == "dark" ]; then
		ENABLE=1
	else
		ENABLE=0
	fi

	sed -i \
		"s/dark-theme=[[:digit:]]/dark-theme=${ENABLE}/" \
		"${HOME}"/.config/{gtk-3.0/settings.ini,gtk-4.0/settings.ini}
}

switch_config_kitty() {
	cp "${HOME}"/.config/kitty/theme-"${1}".conf "${HOME}"/.config/kitty/current-theme.conf
}

usage() {
	printf "usage: ${PROGRAM_NAME}

set light environment:

    $ ${PROGRAM_NAME} light

set dark environment:

    $ ${PROGRAM_NAME} dark\n"
}

main() {
	if [ -z "${1}" ]; then
		usage
		exit 1
	fi

	if [ "${1}" != "dark" ] && [ "${1}" != "light" ]; then
		usage
		exit 1
	fi

	switch_config_gtk "${1}"
	switch_config_kitty "${1}"
}

main "${1}"
