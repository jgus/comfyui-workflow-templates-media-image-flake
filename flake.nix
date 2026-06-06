{
  description = "ComfyUI workflow templates: media-image sub-package";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    flake-lib = {
      url = "github:jgus/flake-lib/v1";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-lib }:
    flake-lib.lib.mkLeafFlake {
      inherit nixpkgs flake-utils;
      source = { type = "pypi"; pname = "comfyui_workflow_templates_media_image"; format = "sdist"; };
      package = {
        attr = "comfyui-workflow-templates-media-image";
        description = "ComfyUI workflow templates: media-image sub-package";
        extra = { dontCheckRuntimeDeps = true; };
      };
      pin = import ./pin.nix;
    };
}
