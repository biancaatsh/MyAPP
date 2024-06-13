# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project file and restore any dependencies
COPY *.csproj ./
RUN dotnet restore

# Copy the remaining source code and build the app
COPY . ./
RUN dotnet publish -c Release -o out

# Use the official .NET runtime image to run the app
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .

# Run the application
ENTRYPOINT ["dotnet", "my-dotnet-app.dll"]
