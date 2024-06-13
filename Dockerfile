# Use the official .NET runtime as a parent image
FROM mcr.microsoft.com/dotnet/runtime:6.0 AS base
WORKDIR /app


COPY . .

RUN dotnet  run .\Program.cs


