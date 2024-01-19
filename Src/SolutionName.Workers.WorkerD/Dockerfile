#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/runtime:8.0 AS base
USER app
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Src/SolutionName.Workers.WorkerD/SolutionName.Workers.WorkerD.csproj", "Src/SolutionName.Workers.WorkerD/"]
RUN dotnet restore "./Src/SolutionName.Workers.WorkerD/./SolutionName.Workers.WorkerD.csproj"
COPY . .
WORKDIR "/src/Src/SolutionName.Workers.WorkerD"
RUN dotnet build "./SolutionName.Workers.WorkerD.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./SolutionName.Workers.WorkerD.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "SolutionName.Workers.WorkerD.dll"]