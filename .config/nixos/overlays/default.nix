final: prev: {
  spotifast = final.callPackage ../packages/spotifast.nix { };
  postman-agent = final.callPackage ../packages/postman-agent.nix { };
}
