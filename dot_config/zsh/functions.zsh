#!/usr/bin/env zsh

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_"
}

# Change working directory to the top-most Finder window location
function cdf() {
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# Show onefetch summary when entering a new git repo
LAST_REPO=""
function cd() {
	builtin cd "$@"
	if git rev-parse --is-inside-work-tree &>/dev/null; then
		local repo=$(basename $(git rev-parse --show-toplevel))
		if [ "$LAST_REPO" != "$repo" ]; then
			onefetch
			LAST_REPO=$repo
		fi
	fi
}

# Create a .tar.gz archive using zopfli, pigz, or gzip
function targz() {
	local tmpFile="${@%/}.tar"
	tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1

	local size=$(stat -f"%z" "${tmpFile}" 2>/dev/null || stat -c"%s" "${tmpFile}" 2>/dev/null)
	local cmd=""
	if (( size < 52428800 )) && hash zopfli 2>/dev/null; then
		cmd="zopfli"
	elif hash pigz 2>/dev/null; then
		cmd="pigz"
	else
		cmd="gzip"
	fi

	echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…"
	"${cmd}" -v "${tmpFile}" || return 1
	[ -f "${tmpFile}" ] && rm "${tmpFile}"

	local zippedSize=$(stat -f"%z" "${tmpFile}.gz" 2>/dev/null || stat -c"%s" "${tmpFile}.gz" 2>/dev/null)
	echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully."
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* ./*
	fi
}

# Use git's colored word-diff instead of system diff
if hash git &>/dev/null; then
	function diff() {
		git diff --no-index --color-words "$@"
	}
fi

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	python3 -m http.server "$port"
}

# Compare original and gzipped file size
function gz() {
	local origsize=$(wc -c < "$1")
	local gzipsize=$(gzip -c "$1" | wc -c)
	local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l)
	printf "orig: %d bytes\n" "$origsize"
	printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio"
}

# Run dig and show the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

# Show all CNs and SANs in an SSL certificate for a domain
function getcertnames() {
	if [ -z "${1}" ]; then
		echo "ERROR: No domain specified."
		return 1
	fi

	local domain="${1}"
	echo "Testing ${domain}…"
	echo ""

	local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
		| openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1)

	if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
		local certText=$(echo "${tmp}" \
			| openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
			no_serial, no_sigdump, no_signame, no_validity, no_version")
		echo "Common Name:"
		echo ""
		echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//"
		echo ""
		echo "Subject Alternative Name(s):"
		echo ""
		echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
			| sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2
		return 0
	else
		echo "ERROR: Certificate not found."
		return 1
	fi
}

# `o` with no arguments opens current directory, otherwise opens the given location
function o() {
	if [ $# -eq 0 ]; then
		open .
	else
		open "$@"
	fi
}

# tree with hidden files, color, ignoring .git/node_modules, dirs first
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX
}

# Push HEAD to given branch (defaults to current), Gerrit-style
function push() {
	local input
	if [ -z "$1" ]; then
		input=$(git branch | grep '*')
		input=${input:2}
	else
		input=$1
	fi
	echo "Pushing changes to \"$input\" branch"
	git push origin HEAD:refs/for/$input
}

# Empty the Trash on all mounted volumes and the main HDD
function emptytrash() {
	sudo rm -rfv /Volumes/*/.Trashes
	sudo rm -rfv "$HOME"/.Trash
	sudo rm -rfv /private/var/log/asl/*.asl
}
