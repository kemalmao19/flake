{ config, pkgs, ...}:
{
  python310.withPackages (
  ps:
    with ps; [
      # IDE
      spyder
      spyder-kernel
      jupyterlab
      ipython
      ipykernel

      # DS
      matplotlib
      numpy
      plotly
      scikit-learn-extra
      scipy
      seaborn

      # probabilistic
      pymc

      # formatter
      black

      # other
      virtualenv
    ];
);
}
