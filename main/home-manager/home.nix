{ config, pkgs, inputs, lib, ... }:

{
  home.username = "violet";
  home.homeDirectory = "/home/violet";
  home.stateVersion = "22.11";
  nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.packages = with pkgs; [
        bat
        exa
        fzf
        ripgrep
        jq
        tree
        git
        killall
        pciutils
        wget
        xclip

        feh
        mpv
        pavucontrol
      
        firefox
        google-chrome

        gnome.file-roller # Archive Manager
        okular            # PDF Viewer
        pcmanfm           # File Manager
        p7zip             # Zip Encryption
        rsync

        unzip             # Zip Files
        unrar             # Rar Files
        zip               # Zip

	];
  
  programs.neovim = {
  	enable = true;
  	viAlias = true;
	  vimAlias = true;
  	};

	home.sessionVariables = {
		EDITOR="nvim";
	};
	home.shellAliases = {
		ls = "exa";
            l="ls -CF";
            ll="ls -l";
            la="ls -A";
            grep="grep --color=auto";
            fgrep="fgrep --color=auto";
            egrep="egrep --color=auto";
            diff="diff --color=auto";
            ip="ip --color=auto";
        		cat = "bat";
		        ".."="cd ..";
            "..."="cd ../..";
            "...."="cd ../../..";
            "....."="cd ../../../..";
            cdcd="cd '$OLDPWD'";
	};



  gtk = {                                     # Theming
    enable = true;
    theme = {
      name = "Dracula";
      package = pkgs.dracula-theme;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    # font = {
    #   #name = "JetBrains Mono Medium";
    #   name = "FiraCode Nerd Font Mono Medium";
    #     };                                        # Cursor is declared under home.pointerCursor
    };


  xdg.configFile."awesome/rc.lua".source = ../dot-configs/awesome/rc.lua;


	# programs.zsh = {
	# 	enable = true;
	# };

	# programs.zsh.oh-my-zsh= {
	# 	enable = true;
	# 	plugins = ["git" "python" "docker" "fzf"];
	# 	theme = "dpoggi";
	# };

}
