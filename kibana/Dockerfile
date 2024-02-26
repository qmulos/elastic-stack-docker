FROM ubuntu-base
ARG KIBANA_REPO
ARG KIBANA_BRANCH
ARG KIBANA_REPO_PATH
CMD ["/bin/bash"]
EXPOSE 5601:5601/tcp
RUN chown kibana:kibana /usr/share/kibana
COPY --chown=kibana:kibana entrypoint.sh /tmp
COPY --chown=kibana:kibana package.json /usr/share/kibana
COPY --chown=kibana:kibana .nvmrc /usr/share/kibana
COPY --chown=kibana:kibana /opt/dev/yarn_requirements/yarn_requirements.tgz /usr/share/kibana
RUN chmod +x /tmp/entrypoint.sh
#RUN git config --global http.postBuffer 1048576000
#RUN git config --global https.postBuffer 1048576000
#RUN source ~/.profile && cd /usr/share && \
 #   git clone -b ${KIBANA_BRANCH} ${KIBANA_REPO} 
#COPY --chown=kibana:kibana ${KIBANA_REPO_PATH}/kibana.tgz /usr/share
#RUN cd /usr/share && tar xvzf kibana.tgz
#RUN source ~/.profile && cd /usr/share/kibana &&\
#    nvm use && \
#    yarn kbn bootstrap
CMD ["/bin/bash"]
USER kibana
WORKDIR /usr/share/kibana
RUN source ~/.profile && nvm use && \
    tar xvzf yarn_requirements.tgz && \
    yarn kbn bootstrap
ENTRYPOINT [ "/tmp/entrypoint.sh" ]