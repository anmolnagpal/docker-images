# Pull base image.
FROM phusion/baseimage:0.10.1
MAINTAINER Anmol Nagpal <ianmolnagpal@gmail.com>

#####################################
ENV LANG C.UTF-8
ENV LC_ALL en_US.UTF-8

ENV PHP_MAJOR 7.2
ENV PACKER_MAJOR 1.2
ENV TERRAFORM_MAJOR 0.11
ENV ANSIBLE_MAJOR 2.5
ENV LINT_VERSION 3.5.0rc1
ENV REVIEW_VERSION 0.13.4
###
ENV PHP_VERSION 7.2.5
ENV PACKER_VERSION 1.2.3
ENV TERRAFORM_VERSION 0.11.7
ENV ANSIBLE_VERSION 2.5.2
ENV DEBIAN_FRONTEND noninteractive
####################################

#User
RUN useradd ubuntu
RUN passwd -d ubuntu


#General
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y      \
	curl                   \
	git                    \
	zip                    \
	unzip                  \
	vim                    \
	ruby-full              \
	openssh-server         \
	python-pip             \
	wget                   \
	ca-certificates        \
	openssl                \
	inetutils-ping         \
	telnet                 \
	haskell-platform       \
	libssl-dev


# DockerLint
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y          \
    nodejs                      \
    && npm install npm@latest -g
RUN npm install -g dockerlint

RUN wget -qO- https://get.haskellstack.org/ | sh
RUN cd /tmp && \
    git clone https://github.com/hadolint/hadolint && cd hadolint && stack install
#PHP
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt-get install -y          \
    php7.2                      \
    php7.2-common               \
    php7.2-cli                  \
    php7.2-curl                 \
    php7.2-json                 \
    php7.2-bz2                  \
    php7.2-xml                  \
    php7.2-zip                  \
    pkg-config

RUN phpenmod curl

#Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

##Python with Packages
RUN pip  install ansible==${ANSIBLE_VERSION} \
                 ansible-lint==${LINT_VERSION} \
                 ansible-review==${REVIEW_VERSION} \
                 awscli \
                 mongotail \
                 bumpversion \
                 pip \
                 yamllint \
                 ansigenome

#Terraform
RUN cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

#Packer
RUN cd /tmp && \
    wget https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/bin

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/ /var/cache/apk/**
WORKDIR /var/www

# Define default command.
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
