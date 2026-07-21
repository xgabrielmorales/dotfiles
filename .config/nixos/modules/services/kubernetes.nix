{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    fluxcd
    k9s
    kompose
    kubectl
    kubernetes-helm
    kustomize
    kustomize-sops
  ];
}
