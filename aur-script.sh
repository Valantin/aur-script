aurget() {
  wget -O - "https://aur.archlinux.org/packages/${1:0:2}/$1/$1.tar.gz" | tar zxf -
#  curl https://aur.archlinux.org/packages/${1:0:2}/$1/$1.tar.gz |tar xz
}

aurbuild() {
  makearg=${@##[^\-]*}
  for pkg in ${@##-*}
  do
    aurget $pkg
    pushd $pkg
    if [ ${#makearg} -lt 2 ] ; then
      makepkg -c -i
    else
      makepkg $makearg
    fi
    popd
  done
}

