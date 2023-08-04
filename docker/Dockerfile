FROM fathyb/carbonyl:latest
ARG START_PAGE="https://start.duckduckgo.com/"
USER root
RUN apt update && apt install -y openssh-server mosh locales && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /carbonyl/data/.ssh && usermod -d /carbonyl/data carbonyl
COPY carbonyl_rsa.pub /carbonyl/data/.ssh/authorized_keys
RUN echo "/carbonyl/carbonyl --no-sandbox --disable-dev-shm-usage --user-data-dir=/carbonyl/data --incognito \${START_PAGE:-$START_PAGE}; exit" > /carbonyl/data/.profile
RUN chown -R carbonyl:carbonyl /carbonyl/data && chmod 600 /carbonyl/data/.ssh/authorized_keys
RUN sed -i "s/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/" /etc/locale.gen && locale-gen
RUN sed -i "s/AcceptEnv /AcceptEnv START_PAGE /" /etc/ssh/sshd_config
RUN service ssh start
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22 60000-60100/udp
