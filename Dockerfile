# Use the official .NET runtime as a parent image
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app

# Use the official .NET SDK as a parent image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MyApp.csproj", "./"]
#RUN dotnet restore "MyApp.csproj"
COPY . .
WORKDIR "/src"
RUN dotnet publish -c Release -o /app/publish

# Copy the build output to the runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "MyApp.dll"]
