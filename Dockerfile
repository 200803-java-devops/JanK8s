FROM jenkins/jenkins
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
ENV CASC_JENKINS_CONFIG /var/jenkins_conf

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.12
USER root
# DOCKER_GID should correspond to the group id of the docker group. You can check it on Linux systems with 'getent group docker'
ENV DOCKER_GID=1001

# RUN mkdir -p /scripts
# COPY set-env-vars.sh /scripts
# RUN /scripts/set-env-vars.sh
ENV SMTP_HOST=smtp.gmail.com
ENV TESTING=test
ENV SMTP_PORT=465
ENV SMTP_USERNAME=downward150@gmail.com
ENV DEFAULT_RECIPIENTS=downward150@gmail.com

ENV SLACK_TEAM_DOMAIN=revaturetrain-cx22851
ENV SLACK_TOKEN=jQnM60CIJeJHq9xeHkx2iN3K

RUN groupadd -g ${DOCKER_GID} docker\
&& usermod -a -G docker jenkins
RUN curl -fsSL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /var/jenkins_conf/jenkins.yaml
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt