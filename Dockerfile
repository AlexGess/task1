# ---------------------------------------------------------------------------
# Dockefile to build Docker Image for task1 running on AmazonLinux 
#
# Made by Pereboev Anton 9-March-2021
# ---------------------------------------------------------------------------

FROM amazonlinux

RUN yum -y update

COPY task1.sh /tasks/

CMD /tasks/task1.sh

