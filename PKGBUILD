# Maintainer: Luca Baldesi <baldo@lilik.it>
pkgname=pamui
pkgver=20121113
pkgrel=1
pkgdesc="Interface for packet managers"
arch=('i686' 'x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot=http://github.com/schiantaberetti/pamui/
_gitname=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
 
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

}

package() {
  cd "$srcdir/$_gitname-build"
  ./install.sh "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
