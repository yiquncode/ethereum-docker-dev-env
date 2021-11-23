FROM centos:8
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN yum install -y curl
RUN curl -fsSL https://rpm.nodesource.com/setup_16.x | bash -
RUN yum install -y nodejs
RUN yum install -y gcc gcc-c++ autoconf make python3 python3-devel git
RUN npm install -g truffle

COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip setuptools -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip3 install -r /tmp/requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

WORKDIR /home/app