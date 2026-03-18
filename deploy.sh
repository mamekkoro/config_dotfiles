#!/usr/bin/env bash
set -u

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

deploy_file() {
  local src_name="$1"
  local dest_path="$2"
  local src_path="$REPO_DIR/$src_name"
  local answer
  local dest_dir
  local backup_path

  if [[ ! -f "$src_path" ]]; then
    echo "SKIP: source not found: $src_path"
    return
  fi

  echo
  echo "Source : $src_path"
  echo "Deploy : $dest_path"
  read -r -p "Deploy this file? [y/N] " answer

  case "$answer" in
    y|Y)
      dest_dir="$(dirname "$dest_path")"
      mkdir -p "$dest_dir"

      if [[ -e "$dest_path" && ! -L "$dest_path" ]]; then
        backup_path="${dest_path}.bak.${TIMESTAMP}"
        cp -a "$dest_path" "$backup_path"
        echo "Backup : $backup_path"
      elif [[ -L "$dest_path" ]]; then
        backup_path="${dest_path}.bak.${TIMESTAMP}"
        mv "$dest_path" "$backup_path"
        echo "Backup symlink : $backup_path"
      fi

      cp -a "$src_path" "$dest_path"
      echo "Deployed."
      ;;
    *)
      echo "Skipped."
      ;;
  esac
}

echo "== dotfiles deploy =="
echo "Repository: $REPO_DIR"

deploy_file "zprofile"    "$HOME/.zprofile"
deploy_file "zshrc"       "$HOME/.zshrc"
deploy_file "vimrc"       "$HOME/.vimrc"
deploy_file "inputrc"     "$HOME/.inputrc"
deploy_file "tmux.conf"   "$HOME/.tmux.conf"
deploy_file "bash_profile" "$HOME/.bash_profile"
deploy_file "bashrc"      "$HOME/.bashrc"

echo
echo "Done."
