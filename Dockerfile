# Dockerfile
FROM ubuntu:22.04

# Install prerequisites
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd bash && \
    rm -rf /var/lib/apt/lists/*

# Copy the script
COPY wisecow.sh .
ENV PATH="/usr/games:${PATH}"

RUN chmod 777 wisecow.sh

# Expose the default port
EXPOSE 4499

# Run the application
CMD ["./wisecow.sh"]

