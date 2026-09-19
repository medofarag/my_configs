mkcd() {
  mkdir -p $1
  cd $1
}

cdls() {
  cd $1
  eza -lh --group-directories-first --git
}

full-update() {
  flatpak update -y
}

# runit
sv-ls() {
  echo "===available services==="
  ls -laF /etc/sv/
}

sv-add() {
  sudo ln -s /etc/sv/$1 /var/service/
}

sv-add-default() {
  sudo ln -s /etc/sv/$1 /etc/runit/runsvdir/default/
}

sv-show() {
  ls -la /var/service/
}

sv-show-default() {
  ls -laF /etc/runit/runsvdir/default/
}

sv-rm() {
  sudo rm -rf /var/service/$1
  sudo rm -rf /etc/runit/runsvdir/default/$1
}
