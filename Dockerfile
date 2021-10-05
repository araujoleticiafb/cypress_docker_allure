FROM cypress/browsers:node14.16.0-chrome90-ff88

# Update the dependencies to get the latest and greatest (and safest!) packages.
RUN apt update --allow-releaseinfo-change && apt upgrade -y

# avoid too many progress messages
# https://github.com/cypress-io/cypress/issues/1243
ENV CI=1

# disable shared memory X11 affecting Cypress v4 and Chrome
# https://github.com/cypress-io/cypress-docker-images/issues/270
ENV QT_X11_NO_MITSHM=1
ENV _X11_NO_MITSHM=1
ENV _MITSHM=0

# should be root user
RUN echo "whoami: $(whoami)"
RUN npm config -g set user $(whoami)

# command "id" should print:
# uid=0(root) gid=0(root) groups=0(root)
# which means the current user is root
RUN id

# point Cypress at the /root/cache no matter what user account is used
# see https://on.cypress.io/caching
ENV CYPRESS_CACHE_FOLDER=/root/.cache/Cypress
RUN npm install -g "cypress@8.1.0"
RUN npm i -D "@shelex/cypress-allure-plugin"
RUN npm install --save-dev @cypress/browserify-preprocessor
RUN npm install --save-dev @types/cypress-cucumber-preprocessor
RUN cypress verify

# Cypress cache and installed version
# should be in the root user's home folder
RUN cypress cache path
RUN cypress cache list
RUN cypress info
RUN cypress version

# Install java
COPY --from=openjdk:8-jre-slim /usr/local/openjdk-8 /usr/local/openjdk-8
ENV JAVA_HOME /usr/local/openjdk-8
RUN update-alternatives --install /usr/bin/java java /usr/local/openjdk-8/bin/java 1

# Config Allure Report
ENV VERSION 2.8.1

RUN mkdir /allure

RUN wget https://repo.maven.apache.org/maven2/io/qameta/allure/allure-commandline/$VERSION/allure-commandline-$VERSION.tgz
RUN tar -zxf allure-commandline-$VERSION.tgz
RUN mv ./allure-$VERSION/* /allure/
RUN rm allure-commandline-$VERSION.tgz
ENV PATH="/allure/bin:${PATH}"   

# give every user read access to the "/root" folder where the binary is cached
# we really only need to worry about the top folder, fortunately
RUN ls -la /root
RUN chmod 755 /root

# always grab the latest Yarn
# otherwise the base image might have old versions
# NPM does not need to be installed as it is already included with Node.
RUN npm i -g yarn@latest

# Show where Node loads required modules from
RUN node -p 'module.paths'

# should print Cypress version
# plus Electron and bundled Node versions
RUN cypress version
RUN echo  " node version:    $(node -v) \n" \
  "npm version:     $(npm -v) \n" \
  "yarn version:    $(yarn -v) \n" \
  "debian version:  $(cat /etc/debian_version) \n" \
  "user:            $(whoami) \n" \
  "chrome:          $(google-chrome --version || true) \n" \
  "firefox:         $(firefox --version || true) \n"

COPY ./ .
RUN chmod +x /start.sh

CMD /start.sh ci
