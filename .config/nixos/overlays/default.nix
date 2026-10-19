final: prev: {
  spotifast = final.callPackage ../packages/spotifast.nix { };
  zapfast = final.callPackage ../packages/zapfast.nix { };
  postman-agent = final.callPackage ../packages/postman-agent.nix { };
  arc-theme = prev.arc-theme.overrideAttrs {
    mesonFlags = [ (final.lib.mesonOption "themes" "gtk3,gtk4") ];
  };
}
