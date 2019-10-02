FROM python

###
### Envs
###
ENV MY_USER="codexten" \
	MY_GROUP="codexten" \
	MY_UID="1000" \
	MY_GID="1000"
###
### User/Group
###
RUN set -x \
	&& groupadd -g ${MY_GID} -r ${MY_GROUP} \
&& useradd -u ${MY_UID} -m -s /bin/bash -g ${MY_GROUP} ${MY_USER}

USER ${MY_USER}

RUN pip3 install awscli --upgrade --user
RUN pip install awsebcli --upgrade --user
ENV PATH="/home/${MY_USER}/.local/bin:${PATH}"

CMD tail -f /dev/null