{ pkgs, ... }:

let
  pythonPackages = pkgs.python39.withPackages (ps: with ps; [
    numpy
    pandas
    matplotlib
    scipy
    scikit-learn
    jupyterlab
    seaborn
    # Add any additional Python packages you need
  ]);
in
{
  environment.systemPackages = [
    pkgs.python39
    pythonPackages
  ];

  # Set up Jupyter Notebook as the default Python environment
  jupyter = {
    enable = true;
    ipython.enable = true;
    ipython.kernel = "python3";
    lab.enable = false;
    extensions = [
      "matplotlib_inline"
      # Add any additional Jupyter extensions you need
    ];
  };

  # Set up Matplotlib configuration
  matplotlib = {
    enable = true;
    backend = "Agg";
  };
}
