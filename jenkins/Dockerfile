


FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt-get update && \
    apt-get install -y software-properties-common  zlib1g-dev python-dev  python3-setuptools python3-wheel  && \
    apt-get install -y net-tools tar curl build-essential manpages-dev libssl-dev openssl openssh-client bash libffi-dev libzip-dev dnsutils vim  bzip* 
  

WORKDIR /tmp
RUN curl https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O && \
    tar -xvzf  Python-3.9.1.tgz

WORKDIR  /tmp/Python-3.9.1
RUN    ./configure --enable-optimizations && \
       make altinstall && \
       ln -s /usr/local/bin/python3.9 /usr/bin/python3.9 && \
       ls -la /usr/bin | grep python 



 

WORKDIR /opt
RUN     curl -O https://releases.ansible.com/ansible/ansible-2.9.3.tar.gz && \
        /usr/local/bin/python3.9 -m pip install --upgrade pip && \
        pip3.9 install ansible ansible-2.9.3.tar.gz && \              
        ln -s /usr/local/bin/ansible /usr/bin/ansible && \
        ln -s /usr/local/bin/ansible-playbook /usr/bin/ansible-playbook && \
        python3 -V && \ 
        java -version

RUN useradd -ms /bin/bash devops
RUN export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\]" 

USER devops
RUN ssh-keygen -q -t rsa -b 4028 -N '' -f ~/.ssh/id_rsa << y 

RUN echo "host *" >> /home/devops/.ssh/config &&\
    echo "StrictHostKeyChecking no" >> /home/devops/.ssh/config

USER root

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_SSH_PIPELINING True
ENV PYTHONPATH /usr/bin



EXPOSE 8080
