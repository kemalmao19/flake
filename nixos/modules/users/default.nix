{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kemalmao = {
    isNormalUser = true;
    description = "kemalmao";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [ firefox-esr ];
  };
}
