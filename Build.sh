dotnet restore

dotnet publish src/MusicStore -c Release

docker-compose -f src/MusicStore/bin/Release/netcoreapp1.0/publish/docker-compose.yml build

docker-compose -f src/MusicStore/bin/Release/netcoreapp1.0/publish/docker-compose.volume.mapped.yml build
