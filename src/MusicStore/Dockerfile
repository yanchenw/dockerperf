FROM microsoft/aspnetcore:1.0.1

# Start the app
ENTRYPOINT dotnet MusicStore.dll

# Set the Working Directory
WORKDIR /app

# Configure the listening port to 80
ENV ASPNETCORE_URLS http://*:80
EXPOSE 80

# Copy the app
COPY . /app
