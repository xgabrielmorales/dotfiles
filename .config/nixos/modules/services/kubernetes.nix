{ pkgs, ... }:

{
  services.k3s = {
    enable = true;
    role = "server";
    extraFlags = toString [
      "--write-kubeconfig-mode=644"
    ];
  };

  networking.firewall.allowedTCPPorts = [
    6443 # Kubernetes API server
  ];

  environment.systemPackages = with pkgs; [
    kubernetes-helm
    kustomize
    kustomize-sops
  ];

  environment.sessionVariables = {
    KUBECONFIG = "/etc/rancher/k3s/k3s.yaml";
  };
}
