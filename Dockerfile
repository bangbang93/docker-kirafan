FROM centos

ENV NODE_VERSION latest
ENV N_PREFIX "/opt/n"

RUN yum group install "Development Tools" -y \
 && yum install epel-release -y

RUN yum install python36-devel zlib-devel libpng-devel -y \
 && ln -s /usr/bin/python3.6 /usr/bin/python3 \
 && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
 && python3 get-pip.py \
 && pip3 install pyyaml pycryptodome unitypack

RUN curl -L https://git.io/n-install | bash -s -- -y -q ${NODE_VERSION}

RUN curl http://download.mono-project.com/repo/centos7-stable.repo -o /etc/yum.repos.d/mono.repo \
 && yum install -y mono-core

 ENV PATH "${PATH}:${N_PREFIX}/bin"