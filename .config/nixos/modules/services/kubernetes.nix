{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fluxcd
    kompose
    kubectl
    kubernetes-helm
    kustomize
    kustomize-sops
  ];
}
