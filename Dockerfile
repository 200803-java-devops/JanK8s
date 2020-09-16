FROM jenkins/jenkins
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
ENV CASC_JENKINS_CONFIG /var/jenkins_conf

ENV DOCKER_CHANNEL stable
ENV DOCKER_VERSION 19.03.12
USER root
# DOCKER_GID should correspond to the group id of the docker group. You can check it on Linux systems with 'getent group docker'
ENV DOCKER_GID=1001

ENV SMTP_HOST=smtp.gmail.com
ENV TESTING=test
ENV SMTP_PORT=465
ENV SMTP_USERNAME=downward150@gmail.com
ENV DEFAULT_RECIPIENTS=downward150@gmail.com
ENV SA_TOKEN=eyJhbGciOiJSUzI1NiIsImtpZCI6IndFWTFnUHhFSkk1dG9HV21NX0hUQ3hRUUowUlNseXJza3A3bWZnWDhUcncifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJqYW5rOHMiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlY3JldC5uYW1lIjoiamFuazhzYS10b2tlbi1kcDRkeCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJqYW5rOHNhIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZXJ2aWNlLWFjY291bnQudWlkIjoiODA3N2I4ZWMtZDdjNS00MzgyLWE4OTEtMTQwMzJjNzUyOWUyIiwic3ViIjoic3lzdGVtOnNlcnZpY2VhY2NvdW50Omphbms4czpqYW5rOHNhIn0.A9IBhBZG5ckjCiQj8fdHdWwEGpYcjkHQMboJQhEuqmmfQ3iwoSV8P9kWsp6o_LedYzp-p11TsRy_WMXBeMsTdwuABbW8-4iO0O-Qi5gGG5YYx8GdqW7ftoH-zBu-3X86PoMQOcCZr3NSTNn9F_UauCgWSHSk-lfKPQuAVChWEau0o4OwIv0ebaLICjU75stJ_8aje_wPOPN2ssLzvK3h4FeSW1crVJfJqztkwo-IjNVPJkvSRga7hBtguNLYVMVeDVrMMrFXQFsoLEocuVE9T-c9mLwuw4Ho_Xdslns-DcFTs733mpWhVX3EIbbiaXNMRskCKq8XjdUNwzO6YTqyqg
ENV SLACK_TOKEN=jQnM60CIJeJHq9xeHkx2iN3K

ENV SLACK_TEAM_DOMAIN=revaturetrain-cx22851

RUN groupadd -g ${DOCKER_GID} docker\
&& usermod -a -G docker jenkins
RUN curl -fsSL "https://download.docker.com/linux/static/${DOCKER_CHANNEL}/x86_64/docker-${DOCKER_VERSION}.tgz" \
  | tar -xzC /usr/local/bin --strip=1 docker/docker
USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /var/jenkins_conf/jenkins.yaml
RUN xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt