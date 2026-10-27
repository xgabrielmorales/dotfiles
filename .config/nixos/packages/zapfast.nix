{
  alsa-lib,
  autoPatchelfHook,
  fetchurl,
  lib,
  libglvnd,
  libx11,
  libxcursor,
  libxi,
  libxkbcommon,
  libxrandr,
  pipewire,
  stdenv,
  vulkan-loader,
  wayland,
}:

stdenv.mkDerivation rec {
  pname = "zapfast";
  version = "0.20.1";

  src = fetchurl {
    url = "https://github.com/crmne/zapfast/releases/download/v${version}/zapfast-v${version}-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-5ZQ7wiGdDzEdThYTIiuA4y77Ko3C0pz/XZLUJKiNsTI=";
  };

  sourceRoot = "zapfast-v${version}-x86_64-unknown-linux-gnu";

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    alsa-lib
    pipewire
    stdenv.cc.cc.lib
  ];

  runtimeDependencies = [
    libglvnd
    libx11
    libxcursor
    libxi
    libxkbcommon
    libxrandr
    pipewire
    vulkan-loader
    wayland
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 zapfast $out/bin/zapfast
    install -Dm644 packaging/applications/zapfast.desktop $out/share/applications/zapfast.desktop
    install -Dm644 packaging/icons/zapfast.svg $out/share/icons/hicolor/scalable/apps/zapfast.svg

    runHook postInstall
  '';

  meta = with lib; {
    description = "Fast native WhatsApp client";
    homepage = "https://zapfast.rocks";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "zapfast";
  };
}
