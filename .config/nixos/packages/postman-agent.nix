{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  copyDesktopItems,
  makeDesktopItem,
  gtk3,
  nss,
  alsa-lib,
  mesa,
  udev,
  libxkbcommon,
  libsecret,
  at-spi2-atk,
  at-spi2-core,
  cups,
  expat,
  glib,
  libx11,
  libxcomposite,
  libxdamage,
  libxext,
  libxfixes,
  libxrandr,
  libxcb,
}:

stdenv.mkDerivation rec {
  pname = "postman-agent";
  version = "latest";

  src = fetchurl {
    url = "https://dl-agent.pstmn.io/download/latest/linux";
    hash = "sha256-8xN41KVR4y9FT/Ue45PvpW1MMONiJXAV6lYfDtU0FL0=";
    name = "${pname}-${version}.tar.gz";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    copyDesktopItems
  ];

  desktopItems = [
    (makeDesktopItem {
      name = "postman-agent";
      desktopName = "Postman Agent";
      exec = "postman-agent";
      comment = "Postman Desktop Agent";
      categories = [ "Development" ];
    })
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    gtk3
    nss
    alsa-lib
    mesa
    udev
    libxkbcommon
    libsecret
    at-spi2-atk
    at-spi2-core
    cups
    expat
    glib
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxcb
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/lib/postman-agent

    cp -r * $out/lib/postman-agent/
    rm -rf $out/lib/postman-agent/nix-support

    ln -s "$out/lib/postman-agent/Postman Agent/app/postman-agent" $out/bin/postman-agent

    runHook postInstall
  '';

  meta = with lib; {
    description = "Postman Desktop Agent for API development";
    homepage = "https://www.postman.com/downloads/postman-agent/";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "postman-agent";
  };
}
