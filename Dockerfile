# Use an official Python 3.11 base image
FROM devkitpro/devkitarm:latest

# Create folder
RUN mkdir -p /hello-world-nds

# Copy all files from the local 'source' folder to '/source' in the container
COPY . /hello-world-nds/

# Set the working directory inside the container
WORKDIR /hello-world-nds

# Create an entrypoint script
RUN echo '#!/bin/sh\nmake && cp hello-world-nds.nds bin/' > /entrypoint.sh && chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Default command (you can override this when running the container)
CMD []