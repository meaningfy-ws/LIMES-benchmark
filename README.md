This repository contains a mini-benchmark for the LIMES: a Java tool for Link
Discovery. The repository includes configuration and data. The Makefile serves
as an interface and offers steps required to generate results. However, some
initial manual steps are required (setting up triple store, initializing triple
store repositories). 
The code may require some parametrization and minor improvements in order to 
make the solution reusable.

GraphDB is the database system used for these experiments.
TED Notices adhering to ePO model are used as the test data.

# experiment code explained
`eN-Y-Z` where:
* N: experiment number
* Y: data size (xs / s / m / a)
* extra description

# experiments
1. 01: heuristic-based
    * metric: `ExactMatch(x.legal_name, y.legal_name)`
    * properties: `"epo:hasLegalName AS nolang->lowercase RENAME legal_name"`
2. 02: ML-based
    * ML algorithm: Wombat simple
    * properties: unsupervised

# Steps to run an experiment
_Note that the config files were archived in ./experiments subdirectories together
with generated artifacts. In order to re-run an experiment, you need to copy a particular
config file to ./config directory._

1. setup your GraphDB database, create repositories and import data (from ./data directory)
2. download limes: `make get_limes`
3. adjust the config file (`config/config.json`). Enter an URL to your SPARQL endpoint.
4. generate XML config file: `make gen_config`
5. run link discovery process (LIMES): `make run_ld`
6. copy experiment results to a dedicated subdirectory under `experiments`: ` make archive_experimentDIR_NAME=e01-xs`
7. inspect results in the new `experiments` subdirectory
8. clean LIMES cache before running another experiment: `make clean_cache`

# Data source
Files stored in ./data directory were produced by using 
SPARQL queries based on these stored in ./queries.
Source of the data: https://fuseki.staging.meaningfy.ws/#/dataset/mdr_dataset/query
The triple store contains TED-SWS MDR data. The MDR annotations 
has been filtered out.
