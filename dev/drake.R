renv::install("vctrs", INSTALL_opts = "--no-multiarch")
renv::install("drake")
remotes::install_github("MilesMcBain/fnmate", INSTALL_opts = "--no-multiarch")
remotes::install_github("MilesMcBain/dflow", INSTALL_opts = "--no-multiarch")
renv::install("dotenv")
renv::install("conflicted")

dflow::use_dflow()
