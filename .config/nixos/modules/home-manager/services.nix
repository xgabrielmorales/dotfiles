{ pkgs, config, ... }:

let
  whisperModel = pkgs.fetchurl {
    url = "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-large-v3-turbo-q5_0.bin";
    sha256 = "1qm7zxamlvac564c3270wqqqks5wc7532q3fqi01zbfmkiq22hir";
  };
  whisper = pkgs.whisper-cpp.override { vulkanSupport = true; };
in
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [ epkgs.treesit-grammars.with-all-grammars ];
  };

  services.emacs = {
    enable = true;
    client.enable = true;
  };

  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = "4.69";
    longitude = "-74.1";
  };

  systemd.user.services.whisper-server = {
    Unit.Description = "whisper.cpp - servidor de transcripción para dictate";
    Service = {
      ExecStart = "${whisper}/bin/whisper-server --model ${whisperModel} --device 0 --language es --no-timestamps --port 8642";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "default.target" ];
  };

  systemd.user.services.xremap = {
    Unit = {
      Description = "xremap - foot pedal dictation trigger";
      After = [
        "graphical-session.target"
        "pipewire.service"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = ''${pkgs.xremap}/bin/xremap --device "PCsensor FootSwitch Keyboard" --watch=device --allow-launch true ${config.xdg.configHome}/xremap/config.yml'';
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
