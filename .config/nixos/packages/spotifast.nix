{
  alsa-lib,
  autoPatchelfHook,
  fetchurl,
  lib,
  libglvnd,
  libpulseaudio,
  libx11,
  libxcursor,
  libxi,
  libxkbcommon,
  libxrandr,
  stdenv,
  vulkan-loader,
  wayland,
}:

stdenv.mkDerivation rec {
  pname = "spotifast";
  version = "0.10.0";

  src = fetchurl {
    url = "https://github.com/crmne/spotifast/releases/download/v${version}/spotifast-v${version}-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-oj2oD4bU6Pbr92cv5mhNouqj61VJ4DhNln8eKkEAnBI=";
  };

  sourceRoot = "spotifast-v${version}-x86_64-unknown-linux-gnu";

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    alsa-lib
    libpulseaudio
    stdenv.cc.cc.lib
  ];

  runtimeDependencies = [
    libglvnd
    libx11
    libxcursor
    libxi
    libxkbcommon
    libxrandr
    vulkan-loader
    wayland
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 spotifast $out/bin/spotifast
    install -Dm644 packaging/applications/spotifast.desktop $out/share/applications/spotifast.desktop
    install -Dm644 packaging/icons/spotifast.svg $out/share/icons/hicolor/scalable/apps/spotifast.svg

    runHook postInstall
  '';

  meta = with lib; {
    description = "Fast, native Spotify client written in Rust";
    homepage = "https://spotifast.rocks/";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "spotifast";
  };
}
