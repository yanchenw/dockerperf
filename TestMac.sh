#!/bin/bash

waitForUrl() {
	echo "Opening site $1"

	while true; do
		status=$(curl -H 'Cache-Control: no-cache' --write-out %{http_code} --silent --output /dev/null $1)
		if [ "$status" = "200" ]; then
			break;
		fi
	done

	echo "Connected successfully."
}

if [ "$1" == "-v" ]; then
	echo "Testing w/ volume mapping:"
	docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml up -d & waitForUrl http://localhost:35002 | gnomon -t elapsed-total

	docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml down --remove-orphans
else
	echo "Testing w/o volume mapping:"
	docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml up -d & waitForUrl http://localhost:35001 | gnomon -t elapsed-total

	docker-compose -f src/DockerPerf/bin/Release/netcoreapp1.0/publish/docker-compose.yml down --remove-orphans
fi