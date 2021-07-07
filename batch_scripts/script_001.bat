@ECHO OFF
REM ********************************************************************
REM Move Dockerfile and *.csproj + Program.cs into separate directories and 
REM  build a second version of the image (without relying on cache 
REM  from the last build). 
REM Use -f to point to the Dockerfile and specify the directory of the 
REM build context
REM ********************************************************************
mkdir dockerfiles
mkdir context
copy C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\Dockerfile dockerfiles
copy C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\dotnet.csproj context
copy C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\Program.cs context

REM move C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\Dockerfile dockerfiles 
REM move C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\dotnet.csproj context
REM move C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app\Program.cs context
REM chdir /d C:\Users\Mustermann\source\repos\my-docker-projects\Docker\console.core.docker.app\console.core.docker.app
REM docker build -t mydotnetimage:v1 .
docker build --no-cache -t mydotnetimage:v2 -f dockerfiles/Dockerfile context
PAUSE  
