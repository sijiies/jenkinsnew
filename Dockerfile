# Use a base image with ASP.NET and Windows Server Core compatible with .NET Framework 4.6.1
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.6.1-windowsservercore-ltsc2019

# Set the build argument for source folder
ARG source
WORKDIR /inetpub/wwwroot

# Copy the published application files into the container
COPY ${source:-obj/Docker/publish} .

# Expose the necessary ports
EXPOSE 80

# Define the entry point
ENTRYPOINT ["cmd", "/c", "start"]

