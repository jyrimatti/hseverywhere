#!/bin/sh

# copy-pasted from /.nix-profile/etc/profile.d/nix.sh to make SSL work:
NIX_LINK="$HOME/.nix-profile"
# Set $NIX_SSL_CERT_FILE so that Nixpkgs applications like curl work.
if [ -e /etc/ssl/certs/ca-certificates.crt ]; then # NixOS, Ubuntu, Debian, Gentoo, Arch
    export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
elif [ -e /etc/ssl/ca-bundle.pem ]; then # openSUSE Tumbleweed
    export NIX_SSL_CERT_FILE=/etc/ssl/ca-bundle.pem
elif [ -e /etc/ssl/certs/ca-bundle.crt ]; then # Old NixOS
    export NIX_SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
elif [ -e /etc/pki/tls/certs/ca-bundle.crt ]; then # Fedora, CentOS
    export NIX_SSL_CERT_FILE=/etc/pki/tls/certs/ca-bundle.crt
elif [ -e "$NIX_LINK/etc/ssl/certs/ca-bundle.crt" ]; then # fall back to cacert in Nix profile
    export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
elif [ -e "$NIX_LINK/etc/ca-bundle.crt" ]; then # old cacert in Nix profile
    export NIX_SSL_CERT_FILE="$NIX_LINK/etc/ca-bundle.crt"
fi

# always use a specific nixpkgs revision
export NIX_PATH=nixpkgs=https://github.com/NixOS/$(cat nix-revision.txt).tar.gz
