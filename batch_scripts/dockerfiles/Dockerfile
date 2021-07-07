# https://hub.docker.com/_/microsoft-dotnet
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source

#Alles kopieren
# options 
#   a)Alles unter "netcoreapp2.1" Ordner im aktuellen Ordner "source" kopieren
# 		COPY /bin/Debug/netcoreapp2.1/ .
#   b) Alles im aktuellen Ordner "source" kopieren       
#		COPY . ./

COPY *.csproj *.cs ./
# COPY *.cs ./
RUN dotnet restore dotnet.csproj

#Alles in einem Ordner (hier heißt der Ordner "out") bauen.
#Anschließend wird mit dem RUN-Befehl die .NET CLI ausgeführt 
#und mit dem Befehl dotnet publish ein Release-Build 
#im Ordner out veröffentlicht
#RUN dotnet build dotnet.csproj -c Release -o /app
RUN dotnet publish -c Release -o out

# Einstiegspunkt das dotnet-Programm
ENTRYPOINT ["dotnet", "out/dotnet.dll"]
