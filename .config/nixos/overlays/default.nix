final: prev: {
  fastpotify = final.callPackage ../packages/fastpotify.nix { };
  postman-agent = final.callPackage ../packages/postman-agent.nix { };
}
