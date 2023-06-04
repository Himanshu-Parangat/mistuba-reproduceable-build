{
 description = "violetevergarden Flakie setup"; #You can change this to whatever

 inputs = {
   # Nixpkgs
   nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

   # Home manager
   home-manager.url = "github:nix-community/home-manager";
   home-manager.inputs.nixpkgs.follows = "nixpkgs";

   # Hardware
   hardware.url = "github:nixos/nixos-hardware";

   # Hyprland 
   hyprland.url = "github:hyprwm/Hyprland";

 };

 outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
   # NixOS configuration entrypoint
   # Available through 'nixos-rebuild --flake .#your-hostname'

   nixosConfigurations = {
     # your hostname
     mistubatakanashi = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit inputs; }; # Pass flake inputs to our config
       # > Our main nixos configuration file <
       modules = [ 
         ./nixos/configuration.nix
         hyprland.nixosModules.default
         {programs.hyprland.enable = true;}
       ];
     };
   };

   # home-manager configuration entrypoint
   # Available through 'home-manager --flake .#your-username@your-hostname'
   homeConfigurations = {
     # your user and hostname like username@hostname
     "violet@mistubatakanashi" = home-manager.lib.homeManagerConfiguration {
       pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
       extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
       # > Our main home-manager configuration file <
       modules = [ 
           ./home-manager/home.nix 
           ];
     };
   };
 };
}
