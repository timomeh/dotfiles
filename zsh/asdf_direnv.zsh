# Install hook for asdf-direnv integration

_zini_asdf_install() {
  # path export temporary required so the asdf script finds itself
  PATH="${PWD}/bin:$PATH"
  asdf plugin add direnv
  asdf install direnv latest
  asdf global direnv latest
  # see https://github.com/asdf-community/asdf-direnv#setup
  asdf exec direnv hook zsh > asdf_direnv_hook.zsh
  echo 'direnv() { asdf exec direnv "$@"; }' >> asdf_direnv_hook.zsh
}