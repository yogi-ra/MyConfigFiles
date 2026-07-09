export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="yogi"
plugins=(git)
source "$ZSH/oh-my-zsh.sh"

set -o vi

path_add() {
  [[ -d "$1" ]] || return
  case ":$PATH:" in
    *":$1:"*) ;;
    *) export PATH="$1:$PATH" ;;
  esac
}

if [[ -z "$FASTFETCH_MOTD" ]] && command -v fastfetch >/dev/null; then
  fastfetch
  export FASTFETCH_MOTD=1
fi

enable-pyenv() {
 export PYENV_ROOT="$HOME/.pyenv"
 [[ -d "$PYENV_ROOT/bin" ]] && path_add "$PYENV_ROOT/bin"
 command -v pyenv >/dev/null || return
 eval "$(pyenv init -)"
 eval "$(pyenv virtualenv-init -)"
}
command -v pyenv >/dev/null && enable-pyenv

semgrep(){ docker run -v "$PWD:/src:ro" --entrypoint semgrep -it --rm semgrep/semgrep:latest "$@"; }
gitleaks(){ docker run -v "$PWD:/src:ro" --entrypoint gitleaks -it --rm ghcr.io/gitleaks/gitleaks:latest "$@"; }
trivy(){ docker run -v "$PWD:/src:ro" -it --rm aquasec/trivy:latest "$@"; }
sage(){ docker run -it --rm sagemath/sagemath:latest "$@"; }

alias pwninit='pwninit --template-path ~/.config/pwninit/template.py --template-bin-name e'

export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_HOME="$ANDROID_HOME"
export ANDROID_AVD_HOME="$HOME/.android/avd"

# path_add "$HOME/.local/bin"
# path_add "/snap/bin"
# path_add "$ANDROID_HOME/platform-tools"
# path_add "/opt/nvim-linux-x86_64/bin"
# path_add "/opt/jadx/bin"
# path_add "/opt/autopsy-4.22.1/bin"
# path_add "$ANDROID_HOME/cmdline-tools/9.0/bin"
# path_add "/opt/john/run"

[[ -x /opt/john/run/john ]] && alias john=/opt/john/run/john

# Use this if wayland
# export SDL_VIDEODRIVER=wayland

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.config/nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

export BUN_INSTALL="$HOME/.bun"
path_add "$BUN_INSTALL/bin"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

[[ -s "$HOME/.openclaw/completions/openclaw.zsh" ]] && source "$HOME/.openclaw/completions/openclaw.zsh"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

export PNPM_HOME="$HOME/.local/share/pnpm"
path_add "$PNPM_HOME"

[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
