#!/usr/bin/env bash

set -euo pipefail

ARCHIVE="$1"
STAMP="${ARCHIVE}.txt"

{
    echo "archive: $(basename "$ARCHIVE")"
    echo

    echo "stat:"
    stat "$1" | sed 's/^\s*/    /'
    echo

    echo "host:"
    echo "    $(hostname)"
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "    $PRETTY_NAME"
    fi
    echo

    echo "archive format:"
    echo "    tar"
    echo "    Compression: xz"
    echo

    echo "tool versions:"
    echo "    $(tar --version | head -n1)"
    echo "    $(xz --version | head -n1)"
    echo

	echo "create:"
	echo "    tar --xattrs --acls -cJpf $(basename "$ARCHIVE") $(echo $(basename "$ARCHIVE") | sed "s/\.tar\.xz//")/"
	echo

    echo "extract:"
    echo "    tar -xJpf $(basename "$ARCHIVE") --xattrs --acls"
    echo

    echo "integrity:"
    echo "    SHA512:"
    sha512sum "$ARCHIVE" | awk '{print "    "$1}'
} > "$STAMP"

echo "wrote $STAMP"
