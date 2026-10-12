# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/), for macOS and Linux (Debian/Ubuntu, including Raspberry Pi OS).

## Init

```sh
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --apply https://github.com/juandaco/dotfiles.git
```

This installs chezmoi into `~/.local/bin`, clones this repo into `~/.local/share/chezmoi` and applies it.

On the first run chezmoi asks:

| Prompt          | When       | Effect                                                     |
| --------------- | ---------- | ---------------------------------------------------------- |
| `Work MacBook?` | macOS only | Sets the default email and adds the work scripts to `PATH` |
| `Email address` | Always     | Used in `~/.gitconfig`                                     |

The answers are stored in `~/.config/chezmoi/chezmoi.yaml`. Run `chezmoi init` again to change them.

### Requirements

- `curl` and `git`
- `sudo` access (Homebrew on macOS; apt packages, Neovim, Go and global npm packages on Linux)
- On Linux, a C toolchain (`build-essential` on Debian/Ubuntu), needed to build `tree-sitter-cli`
- `zip` and `unzip`, needed by the SDKMAN! installer
- On Linux, `tmux` is not installed by this repo; install it separately. Its plugins are installed on the next `chezmoi apply` after that

Unauthenticated GitHub API calls are heavily rate limited, and the Linux templates look up the latest releases of several tools. Once `gh` is installed, run `gh auth login`: `~/.profile` exports `GITHUB_TOKEN` from it.

## What gets installed

### Config files

| Target                  | Notes                                             |
| ----------------------- | ------------------------------------------------- |
| `~/.profile`            | Environment variables and `PATH`                  |
| `~/.bash_profile`       | Loads Homebrew (macOS), `~/.profile`, `~/.bashrc` |
| `~/.bashrc`             | Interactive shell setup                           |
| `~/.bash_aliases`       | Aliases, including a per-OS `upgrade`             |
| `~/.gitconfig`          | Aliases and `delta` settings                      |
| `~/.ideavimrc`          | IdeaVim                                           |
| `~/.config/tmux`        | tmux config; plugins are managed by tpm           |
| `~/.config/tmuxp`       | `personal`, `work` and `upgrade` sessions         |
| `~/.config/ghostty`     | Ghostty                                           |
| `~/.config/atuin`       | Atuin                                             |
| `~/.config/glow`        | Glow                                              |
| `~/.config/k9s`         | k9s config, aliases, plugins and skins            |

### Externals

Defined in `.chezmoiexternal.toml.tmpl` and refreshed weekly:

- `~/.config/nvim` from [juandaco/nvim](https://github.com/juandaco/nvim)
- `~/.config/tmux/plugins/tpm` from [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm)
- Linux only, the latest release binaries in `~/.local/bin`, with completions and man pages where available: `fd`, `bat`, `bat-extras`, `rg`, `fzf`, `shfmt`, `tldr` and `delta`

### Packages

The lists live in `.chezmoidata/packages.yaml`. Editing them re-runs the matching script on the next `chezmoi apply`.

| Platform      | What                                                                                     |
| ------------- | ---------------------------------------------------------------------------------------- |
| macOS         | Homebrew, then every formula and cask in `packages.yaml` through `brew bundle`           |
| Debian/Ubuntu | `gh` and Node.js 24 from their apt repositories                                          |
| Linux         | Neovim 0.12.x into `/usr/local` (arm64 and amd64 only), the latest stable Go into `/usr/local/go`, `tree-sitter-cli` through cargo, Atuin into `~/.atuin` (arm64 and amd64 only) |
| All           | `rustup`, SDKMAN! into `~/.sdkman`, the global npm packages, the tmux plugins            |

Notes:

- 32-bit ARM has no Neovim or Atuin build, and ARMv6 has no `ripgrep` build; they are skipped there.
- To change the Node.js major version, edit `NODE_MAJOR` in `run_onchange_before_install-nodejs.sh.tmpl`.
- To change the Neovim release series, edit `$series` in `run_onchange_before_install-neovim.sh.tmpl`.
- Go follows the newest stable release listed on [go.dev](https://go.dev/dl/); `chezmoi apply` replaces `/usr/local/go` when a new one is out.

## Daily use

```sh
chezmoi edit ~/.bashrc    # Edit the source of a managed file
chezmoi diff              # Preview pending changes
chezmoi apply             # Apply them
chezmoi update            # Pull the repo and apply
chezmoi add ~/.somefile   # Start managing a new file
chezmoi cd                # Open a shell in the source directory
```
