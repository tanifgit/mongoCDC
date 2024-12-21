FROM mongo:6.0

# Copy the initialization script to the container
COPY init-replica.js /docker-entrypoint-initdb.d/

# Copy the key file into the container
COPY mongo-keyfile /data/configdb/mongo-keyfile

# Set correct permissions for the key file
RUN chmod 400 /data/configdb/mongo-keyfile && chown mongodb:mongodb /data/configdb/mongo-keyfile

# Set the entry point to use mongod with necessary arguments
CMD ["mongod", "--replSet", "rs0", "--bind_ip_all", "--auth", "--keyFile", "/data/configdb/mongo-keyfile"]