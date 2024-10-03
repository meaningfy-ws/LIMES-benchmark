ENV_FILE := .env
PROJECT_PATH = $(shell pwd)

get_limes:
	@ mkdir -p ./lib
	@ wget -c https://github.com/dice-group/LIMES/releases/download/1.8.3/limes.jar -P ./lib

gen_config:
	cd config && ./gen_config

run_ld:
	time -f "User: %U seconds, System: %S seconds, Real: %e seconds" \
		java -Xmx2g -jar lib/limes.jar config/config.xml 2>&1 | tee output/limes.log

# re-run with a modified config
rerun_ld: gen_config run_ld

# note that this recipe just approximates processing time, the measurement is
# done in not the most accurate way, as the REST API is asynchronous and the
# used script does pooling
run_ld_rest_api:
	time --output=output/time.log  -f "User: %U seconds, System: %S seconds, Real: %e seconds" sh -c \
		'cd scripts && ./exec_rest_api_ld_task'
	@cat output/time.log >> output/limes.log
	@rm -f output/time.log
		
# for testing REST API
start_limes_server:
	java -jar lib/limes.jar -s

clean_cache:
	rm -rf cache

# param: DIR_NAME
archive_experiment:
ifndef DIR_NAME
		$(error DIR_NAME not specified)
endif
	@mkdir -p experiments/${DIR_NAME}
	@cp -t experiments/${DIR_NAME} config/config.json config/config.xml
	@mv output/acceptance.ttl output/review.ttl output/limes.log -t experiments/${DIR_NAME}
	@echo experiment files archived in experiments/${DIR_NAME}