# Steps to run the experiment
1. ~~setup a repository and download notices: `make init`~~
1. download limes: `make get_limes`
1. [optional] tweak the config file (`config/config.json`)
1. generate XML config file: `make gen_config`
1. run link discovery process (LIMES): `make run_ld`
1. copy experiment results to a dedicated subdirectory under `experiments`: ` make archive_experimentDIR_NAME=e01-xs`
1. inspect results in the new `experiments` subdirectory
1. clean LIMES cache before running another experiment: `make clean_cache`