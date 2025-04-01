FROM oraclelinux:8

# Create app directory
WORKDIR /usr/src/app

# Copy the .js files from your host machine into the new app directory
ADD *.js ./

RUN  dnf -y install oracle-instantclient-release-el8 && \
     dnf -y install oracle-instantclient-basic oracle-instantclient-devel oracle-instantclient-sqlplus && \
     dnf -y node
     rm -rf /var/cache/dnf

# Uncomment if the tools package is added
# ENV PATH=$PATH:/usr/lib/oracle/21/client64/bin

EXPOSE 3000

CMD ["node", "server.js"]
