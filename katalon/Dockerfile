FROM katalon-base

# common environment variables
ENV KATALON_KATALON_ROOT_DIR=$KATALON_ROOT_DIR/katalon
ENV KATALON_KATALON_INSTALL_DIR_PARENT=/opt
ENV KATALON_KATALON_INSTALL_DIR=$KATALON_KATALON_INSTALL_DIR_PARENT/katalonstudio

RUN mkdir -p $KATALON_KATALON_ROOT_DIR
WORKDIR $KATALON_KATALON_ROOT_DIR
ADD ./src ./

RUN ./index.sh

ENV PATH "$PATH:$KATALON_KATALON_ROOT_DIR/scripts"
WORKDIR /
CMD $KATALON_KATALON_ROOT_DIR/scripts/katalon-notify.sh
