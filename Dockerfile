# Use the official .NET runtime as a parent image
FROM mcr.microsoft.com/dotnet/runtime:6.0 
COPY /bin/Release/ .
ENTRYPOINT ["dotnet", "MyApp.dll"]
