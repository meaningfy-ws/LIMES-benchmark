This repository contains a mini-benchmark for the LIMES: a Java tool for Link
Discovery. The repository includes configuration and data. The Makefile serves
as an interface and offers steps required to generate results. However, some
initial manual steps are required (setting up triple store, initializing triple
store repositories). GraphDB is the database system used for these experiments.

# Steps to run the experiment
1. ~~setup a repository and download notices: `make init`~~
1. download limes: `make get_limes`
1. [optional] tweak the config file (`config/config.json`)
1. generate XML config file: `make gen_config`
1. run link discovery process (LIMES): `make run_ld`
1. copy experiment results to a dedicated subdirectory under `experiments`: ` make archive_experimentDIR_NAME=e01-xs`
1. inspect results in the new `experiments` subdirectory
1. clean LIMES cache before running another experiment: `make clean_cache`

# Data source
Files stored in ./data directory were produced by using 
SPARQL queries based on these stored in ./queries.
Source of the data: https://fuseki.staging.meaningfy.ws/#/dataset/mdr_dataset/query
The triple store contains TED-SWS MDR data. The MDR annotations 
has been filtered out.
