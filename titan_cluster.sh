weave launch
weave run 10.0.0.1/24 --name cass1 -e CASSANDRA_SEEDS="10.0.0.1,10.0.0.2" cassandra:2.1.5
weave run 10.0.0.2/24 --name cass2 -e CASSANDRA_SEEDS="10.0.0.1,10.0.0.2" cassandra:2.1.5
weave run 10.0.1.1/24 --name es1 elasticsearch:1.5.2
weave run 10.0.1.2/24 --name es2 elasticsearch:1.5.2
docker build -t titan .
weave run 10.1.0.1/24 titan
