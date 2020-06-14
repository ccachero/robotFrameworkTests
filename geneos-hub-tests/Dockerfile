# Use an official centos7 image
FROM python:3.7-alpine

#COPY ./test_run.sh /
#RUN chmod 777 test_run.sh

COPY opt/ opt/

RUN pip install robotframework
RUN pip install -U requests
RUN pip install -U robotframework-requests

WORKDIR opt/tests/

#COPY hub_tests1:/opt/tests/reports/log.html opt/ /home/jenkins/tests/log.html

ENTRYPOINT ["sh"]


