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
  pname = "fastpotify";
  version = "0.6.0";

  src = fetchurl {
    url = "https://github.com/crmne/fastpotify/releases/download/v${version}/fastpotify-v${version}-x86_64-unknown-linux-gnu.tar.gz";
    hash = "sha256-FXIuJZGBLQgwTzUD/7mx405zyHhhSBMP75yHfB4rCxI=";
  };

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

    install -Dm755 fastpotify $out/bin/fastpotify
    install -Dm644 packaging/applications/fastpotify.desktop $out/share/applications/fastpotify.desktop
    install -Dm644 packaging/icons/fastpotify.svg $out/share/icons/hicolor/scalable/apps/fastpotify.svg

    runHook postInstall
  '';

  meta = with lib; {
    description = "Fast, native Spotify client written in Rust";
    homepage = "https://fastpotify.rocks/";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "fastpotify";
  };
}
