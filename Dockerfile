FROM ubuntu:focal

LABEL name="puppet-parser-validate-action"
LABEL repository="https://github.com/researchgate/puppet-parser-validate-action"
LABEL homepage="https://github.com/researchgate/puppet-parser-validate-action"

LABEL "com.github.actions.name"="puppet-parser-validate-action"
LABEL "com.github.actions.description"="GitHub Action to run 'puppet parser validate' syntax check"
LABEL "com.github.actions.icon"="share-2"
LABEL "com.github.actions.color"="orange"

LABEL "maintainer"="Berg <https://github.com/researchgate/>"

RUN wget https://apt.puppet.com/puppet7-release-focal.deb && dpkg -i puppet7-release-focal.deb && apt-get update && apt-get install -y puppet-agent
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
