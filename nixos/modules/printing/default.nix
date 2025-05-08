{ pkgs, ... }: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ 
    # pkgs.epson-201401w pkgs.hplip 
    ];
  };

  # Scanner
  hardware.sane = {
    enable = true;
    extraBackends = [ 
    # pkgs.hplipWithPlugin 
    ];
  };
}
