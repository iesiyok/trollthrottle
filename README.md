<h2>Project Title</h2>

This is the implementation of Trollthrottle protocol. For information about the protocol, please refer to full version of our research paper($link).

<h2>Getting Started</h2>

The deployment instructions below are given for reproducing the simulation results mentioned in the paper. For a swarm or a kubernetes deployment, additional instructions will also be present here.

<h2>Prerequisites</h2>

This application includes pre-built docker images. To build the application, Docker must be installed and Docker Engine must be running on your system. If Docker is installed, pull this repository and follow the instructions below to customise the application where necessary.


For managing and dedicating resources, we use 'taskset' tool in the docker containers. But, there is another option with kubernetes given here: https://docs.docker.com/compose/compose-file/#resources. This option will also be available here.

<h2>Preparing for Simulation</h2>

*	For customising the application, you can change the settings in the files under `conf` directory:
	-	You can update additional custom settings in `custom_mysql.cnf` for mysql server,
	-	You can update mysql connection settings in `database.yml` file for Ruby on Rails applications(issuer, id_verifier, ledger, website, sign_verifier),
	-	You can update `*_startup.sh` files, for starting applications in different environments(e.g. development,test,production) and assign cores for applications(shown below),
	-	You can update `*_unicorn.rb` files, for server side application forking settings,
	-	You can update tables in `trollthrottle` database by adding/updating scripts to `dump.sql` file,
	-	You can update mysql connection settings in `locals.js` file for Nodejs applications(simulator),
	-	You can update web server settings in `nginx.conf` file,
	-	You can update the certificates and keys under `keys_and_certs` directory, note that the keys that are placed in the directory are published for testing purposes. They cannot be used for production. 

*	For assigning cores to applications, change the core-id in the `conf/*_startup.sh` files,
such that:
	1.	in the 'id_verifier_startup.sh' file:
		taskset -c $core-id $command
	2.	in the 'issuer_startup.sh' file:
		taskset -c $core-id $command
	3.	in the 'ledger_startup.sh' file:
		taskset -c $core-id $command
	4.	in the 'sign_verifier_startup.sh' file:
		taskset -c $core-id $command
	5.	in the 'website_startup.sh' file:
		taskset -c $core-id $command

*	The simulation requires downloading data from a Bigquery dataset, https://bigquery.cloud.google.com/dataset/fh-bigquery:reddit_comments.
	The SQL queries for retrieving data based on scenario are presented in the `big_query` directory. The simulation is designed to be multithreaded since a single thread application can support only a limited load.
	Therefore, the instructions for downloading data and running the simulation are based on splitting data into multiple pieces and parallelising the applications. 

*	There are three different scenarios for running simulation, for more information about how we select the scenarios please refer to the paper.
	Scenario-1: National newspaper (`data/de` 168K comments) (scenario name : `de`)
	Scenario-2: International newspaper (`data/nytimes` 268K comments) (scenario name : `nytimes`)
	Scenario-3: Reddit (`data/reddit` 4.9M comments) (scenario name : `reddit`)

<h2>	Example: Simulation on Scenario-1:</h2>

<h4>	1.	Retrieve data:</h4>

		-	Follow the instructions given in `big_query/data_de.sql`. 
			Download 'raw' national newspaper data from Bigquery and split data into multiple pieces.
			A rule of thumb for parallelising the Scenario-1 is splitting it into 8 pieces.(For Scenario-2, it's 15 and for Scenario-3, it's 48).
			Since the downloaded data in JSON format, it's important to split it based on number of lines.
			A simple program `file_splitter.js` is provided in the directory for determining line numbers and giving file names.
			File names must be in `raw_#nr.json` format and #nr must start from 0.

		-	The splitted raw data must be placed in the `data/de/raw` directory.

		-	For determining the list of new users is presented in the same query file. The new users must not be splitted and it must be 		placed in `new_users.json` file in `data/de/raw` directory. Also, the file should not include `[` in the beginning of the file and `]` in the end. Each record in the file must be in JSON format and the records must be splitted only with newline character. 
			e.g. {"author": "abc"}
			{"author": "def"}


<h4>	2.	Assign application settings:</h4>
	
		-	Assign the cores with core-ids to the applications in the `startup.sh` files, as presented above.

		-	Clean logs of the applications. A bash script `clean_logs.sh` presented in the main directory.

		-	Assign your time zone for simulator in the bottom of `docker-compose.yml` file. The default is `Europe/Berlin`.

<h4>	3.	Build the applications:</h4>

		-	Run `docker-compose up --build -d` in the main directory. This will build the trollthrottle applications and the simulator in the directory and it might take a long time in the first run, but changes in the data and the simulation code in the front-end Nodejs applications will not require a new build. However, nginx, startup.sh and mysql changes will require a new build. 

<h4>	4.	Precomputation for the simulation in order:</h4>

		-	Add new_user information to the system: the command below adds new author information for scenario name `de`.

			execute >> docker-compose exec simulator bash -c 'cd /simulator && node sim_new_users.js de'

		-	Create cookies and identity information about the authors in the raw data: the command below spawns 8 child processes and creates cookies for each author for `de` scenario.

			execute >> docker-compose exec simulator bash -c 'cd /simulator && node sim_id_spawner.js 8 de'

		-	Create precomputation for each comments in the raw data and save in the `precomp` directory: the command below spans 8 child processes where each child process uses the corresponding raw data and computes the precomputation and saves it into `data/de/precomp` directory with `prec_#nr.json` format.

			execute >> docker-compose exec simulator bash -c 'cd /simulator && node sim_prec_spawner.js 8 de'

<h4>	5.	Run simulation:</h4>

		-	The command below spans 8 child processes where each child process takes the corresponding precomputation and schedules a commenting action. The schedule is based on the date given in the command. The date given in the example below will start the commenting action clock at '15 April 2020 13:10'. The sequence for months starts from 0, hence the sequence number for April is given 3. 

		execute >> docker-compose exec simulator bash -c 'cd /simulator && node simulation_spawner.js 8 de 2020 3 15 13 10'

<h4>	6.	Simulation results:</h4>

		-	The simulation will end in 24 hours and save the simulation results in the `data/de/result` directory and server-side results in the `logs/*` directory.
		-	The server-side ledger logs `custom_*.log` are under `logs/ledger` folder. For comment verification performance analysis, you can align the logs and aggregate them with the ones in `data/de/result` folder.
 

