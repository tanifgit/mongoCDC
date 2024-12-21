ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2024.1
FROM $IMAGE

USER root

# change ownership
# RUN mkdir -p /opt/irisapp
# RUN chown -R ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
# WORKDIR /opt/irisapp

# USER ${ISC_PACKAGE_MGRUSER}

USER root

WORKDIR /opt/irisapp
RUN chown -R irisowner:irisowner /opt/irisapp

USER irisowner

# copy source
# COPY iris.script iris.script
# COPY src src



WORKDIR /opt/irisapp
COPY --chown=irisowner:irisowner src src/
COPY --chown=irisowner:irisowner iris.script iris.script
COPY --chown=irisowner:irisowner requirements.txt requirements.txt
#COPY --chown=irisowner:irisowner webapp.xml webapp.xml


# install python requirements 


#RUN ["/bin/bash", "-c", "pip3 install --target /usr/irissys/mgr/python/ -r requirements.txt"]


RUN pip3 install --target /usr/irissys/mgr/python/ -r requirements.txt

# run iris.script
RUN iris start IRIS && \ 
    iris session IRIS < /opt/irisapp/iris.script && \
    iris stop IRIS quietly

