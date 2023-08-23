{ config, pkgs, ...}:
{	home.packages = with pkgs; [
	  (python310.withPackages (
	  	ps:
			with ps; [
			  # IDE
			  jupyterlab
			  ipython
			  ipykernel

				# Spyder IDE
				spyder
				spyder-kernels

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
			])
	)
  ];
}
