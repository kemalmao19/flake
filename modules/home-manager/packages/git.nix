{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "kemalmao19";
    userEmail = "sebelumtidur14@gmail.com";

  };

  programs.gh.gitCredentialHelper.enable = true;
}
