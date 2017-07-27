FROM ubuntu:16.04

RUN apt-get update -qq \
  && apt-get install -qq wget
RUN wget https://apt.puppetlabs.com/puppet5-release-xenial.deb && dpkg -i puppet5-release-xenial.deb
RUN apt-get update -qq \
  && apt-get install -qq --no-install-recommends puppet-agent=5.0.1-1xenial ruby=1:2.3.0+1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN gem install bundler --no-document

ENV PATH /opt/puppetlabs/bin:$PATH
