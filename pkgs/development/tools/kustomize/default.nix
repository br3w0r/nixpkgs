# This file was generated by https://github.com/kamilchm/go2nix v1.2.1
{ lib, stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "kustomize-${version}";
  version = "1.0.9";
  # rev is the 1.0.8 commit, mainly for kustomize version command output
  rev = "ec86b30d2b01a8fa62e645f024f26bfea5dcd30d";

  goPackagePath = "sigs.k8s.io/kustomize";

  buildFlagsArray = let t = "${goPackagePath}/pkg/commands"; in ''
    -ldflags=
      -s -X ${t}.kustomizeVersion=${version}
         -X ${t}.gitCommit=${rev}
         -X ${t}.buildDate=unknow
  '';

  src = fetchFromGitHub {
    sha256 = "06a0iic8sp745q71bh0k2zbcdhppp85bx9c3fwwr4wl77dlybz4f";
    rev = "v${version}";
    repo = "kustomize";
    owner = "kubernetes-sigs";
  };

  meta = with lib; {
    description = "Customization of kubernetes YAML configurations";
    longDescription = ''
      kustomize lets you customize raw, template-free YAML files for
      multiple purposes, leaving the original YAML untouched and usable
      as is.
    '';
    homepage = https://github.com/kubernetes-sigs/kustomize;
    license = licenses.asl20;
    maintainers = with maintainers; [ carlosdagos vdemeester periklis ];
  };
}