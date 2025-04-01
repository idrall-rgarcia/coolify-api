FROM oraclelinux:9-slim

# Create app directory
WORKDIR /usr/src/app

# Copy the .js files from your host machine into the new app directory
ADD *.js ./

# Update Oracle Linux
# Install Node.js
# Install the Oracle Instant Client
# Check that Node.js and NPM installed correctly
# Install the OracleDB driver
RUN dnf update -y && \
  dnf install -y oracle-release-el9 && \
  dnf install -y oracle-nodejs-release-el9 && \
  dnf install -y --disablerepo=ol9_developer_EPEL nodejs && \
  dnf install -y oracle-instantclient19.3-basic.x86_64 && \
  dnf clean all && \
  node --version && \
  npm --version && \
  dnf install oracledb && \
  echo Installed

EXPOSE 3000

CMD ["node", "server.js"]