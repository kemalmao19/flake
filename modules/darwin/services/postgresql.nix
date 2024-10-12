{pkgs, ... }: {
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_11;
    # default
    # port = 5432;
    checkConfig = true;
    dataDir = "/var/lib/postgresql/11";

  };
}