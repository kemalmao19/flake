{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kemalmao = {
    isNormalUser = true;
    description = "kemalmao";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.fish;
    packages = with pkgs; [ firefox-esr ];
  };
  nix.settings.trusted-users = [ "root" "kemalmao" ];
}
