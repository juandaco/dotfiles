#!/usr/bin/env bash
# shellcheck disable=2034
#
# Shared helpers for the installer scripts. Source it, do not execute it:
#
#   source "$(dirname "${BASH_SOURCE[0]}")/lib/common.sh" || exit 1
#
# Keep it compatible with bash 3.2 (the default bash on MacOS).

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
HOME_BIN="$HOME/.local/bin"
COMPLETIONS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions"

# Prints an error message and aborts the installer.
fail() {
  echo "$*" 1>&2
  exit 1
}

# Tells whether a command is available.
has() {
  command -v "$1" >/dev/null 2>&1
}

# Prints the platform: `macos`, `arch`, `debian` (includes Raspberry Pi OS),
# `linux` (any other distribution) or `unknown`.
detect_platform() {
  case "$(uname -s)" in
  Darwin) echo "macos" ;;
  Linux)
    (
      [ -r /etc/os-release ] && . /etc/os-release
      case " $ID $ID_LIKE " in
      *" arch "*) echo "arch" ;;
      *" debian "*) echo "debian" ;;
      *) echo "linux" ;;
      esac
    )
    ;;
  *) echo "unknown" ;;
  esac
}

unsupported_platform() {
  fail "The platform $(uname -s) ($PLATFORM) is not supported yet."
}

# Prints the architecture of the installed system using the Debian names:
# `arm64`, `armhf` or `amd64`. The userland is checked before the kernel,
# since Raspberry Pi OS 32bit runs on a 64bit kernel.
linux_arch() {
  if has dpkg; then
    dpkg --print-architecture
    return
  fi

  case "$(uname -m)" in
  aarch64 | arm64) echo "arm64" ;;
  armv6l | armv7l) echo "armhf" ;;
  x86_64) echo "amd64" ;;
  *) uname -m ;;
  esac
}

unsupported_arch() {
  fail "The architecture $(linux_arch) is not supported yet."
}

# Installs a Homebrew formula unless its command is already available.
#   brew_install <formula> [command]
brew_install() {
  has brew || fail "You must install brew first."
  has "${2:-$1}" || brew install "$1"
}

# Installs a pacman package.
pacman_install() {
  sudo pacman --needed -S "$@"
}

# Installs an apt package.
apt_install() {
  sudo apt-get install -y "$@"
}

# Installs a package that has the same name in every package manager, unless
# its command is already available.
#   package_install <package> [command]
package_install() {
  has "${2:-$1}" && return

  case "$PLATFORM" in
  macos) brew_install "$@" ;;
  arch) pacman_install "$1" ;;
  debian) apt_install "$1" ;;
  *) unsupported_platform ;;
  esac
}

# Prints the latest released version of a GitHub repository, without the `v`
# prefix. Follows the redirect of the "latest release" page rather than calling
# the API, which is rate limited.
#   github_latest_version <user>/<repo>
github_latest_version() {
  local url
  url="$(curl --fail --silent --show-error --location --head --output /dev/null \
    --write-out '%{url_effective}' "https://github.com/$1/releases/latest")" || return 1

  case "$url" in
  */releases/tag/*) url="${url##*/}" && echo "${url#v}" ;;
  *) return 1 ;;
  esac
}

# Prints the version of an installed command; nothing when it is not installed.
installed_version() {
  hash -r
  has "$1" || return 0
  "$1" --version 2>/dev/null | head -1 | grep -oE '[0-9]+(\.[0-9]+)+' | head -1
}

# Aborts unless the given version of a command is the one found in the PATH.
#   verify_installed <command> <version>
verify_installed() {
  if [ "$(installed_version "$1")" == "$2" ]; then
    echo "$1 $2 correctly installed."
  else
    fail "$1 $2 was not installed."
  fi
}

# Creates `$TMP_DIR`, which is removed when the installer exits.
make_tmp_dir() {
  TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/dotfiles.XXXXXX")" || fail "Could not create a temporary directory."
  trap 'rm -rf "$TMP_DIR"' EXIT
}

# Downloads a file, aborting the installer when it is not available.
#   download <url> <file>
download() {
  curl --fail --silent --show-error --location --retry 3 --output "$2" "$1" ||
    fail "Could not download $1"
}

# Downloads and installs a Debian package.
#   install_deb <url>
install_deb() {
  make_tmp_dir
  download "$1" "$TMP_DIR/package.deb"
  sudo dpkg -i "$TMP_DIR/package.deb" || fail "Could not install $1"
}

# Installs an executable into `$HOME_BIN`.
#   install_bin <file> <name>
install_bin() {
  install -m 755 "$1" "$HOME_BIN/$2" || fail "Could not install $2 into $HOME_BIN"
}

# Installs a bash completion file for a command.
#   install_completion <file> <command>
install_completion() {
  mkdir -p "$COMPLETIONS_DIR" &&
    install -m 644 "$1" "$COMPLETIONS_DIR/$2" || fail "Could not install the $2 completions."
}

# Links (hard link) files of this repository into a directory.
#   link_files <directory> <file>...
link_files() {
  local directory="$1"
  shift

  mkdir -p "$directory" || exit 1
  (cd "$DOTFILES_DIR" && ln -vf "$@" "$directory/") || exit 1
}

# Links (hard link) a file of this repository with another name.
#   link_file <file> <target>
link_file() {
  mkdir -p "$(dirname "$2")" || exit 1
  ln -vf "$DOTFILES_DIR/$1" "$2" || exit 1
}

PLATFORM="$(detect_platform)"

# Homebrew may not be in the PATH of non login shells.
if [ "$PLATFORM" == "macos" ] && ! has brew; then
  for BREW in /opt/homebrew/bin/brew /usr/local/bin/brew; do
    [ -x "$BREW" ] && eval "$("$BREW" shellenv)" && break
  done
  unset BREW
fi

# The binaries installed into `$HOME_BIN` must be found right away.
mkdir -p "$HOME_BIN" || exit 1
case ":$PATH:" in
*":$HOME_BIN:"*) ;;
*) PATH="$HOME_BIN:$PATH" ;;
esac
