FROM amazonlinux:2
RUN yum -y install tar gcc gcc-c++ make ncurses-compat-libs
RUN amazon-linux-extras enable corretto8
RUN yum clean metadata
# for gradle
RUN yum -y install java-1.8.0-amazon-corretto-devel
RUN yum -y install install which zip unzip
RUN curl -s http://get.sdkman.io | bash && \
    bash ${HOME}/.sdkman/bin/sdkman-init.sh && \
    source ${HOME}/.bashrc && \
    sdk install gradle
