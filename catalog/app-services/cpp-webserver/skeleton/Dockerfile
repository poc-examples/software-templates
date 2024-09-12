FROM registry.access.redhat.com/ubi8/ubi:latest as build-env

# SET TIMEZONES
ENV TZ=America/New_York
ENV BOOST_VERSION=boost-devel-1.66.0-13.el8.x86_64.rpm
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# BRING IN LIBBOOST DEPENDENCY
RUN rpm -ivh \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

RUN yum update -y \
        && yum install -y \
            gcc-c++ \
            cmake \
            make \
            boost1.78-devel.x86_64

# RUN yum search *boost*

# CREATE WORKING DIRECTORY
WORKDIR /app
COPY app/ /app/

# MAKE THE APPLICATION
RUN cmake . && make

FROM registry.access.redhat.com/ubi8/ubi:latest

RUN rpm -ivh \
        https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

RUN yum update -y \
        && yum install -y \
            boost1.78-devel.x86_64

# COPY THE APPLICATION FROM BUILD CONTAINER TO RUN CONTAINER
# TO LIMIT THE CONTAINER SIZE
COPY --from=build-env /app/app /usr/local/bin/app

ENV PORT ${{ values.port }}

ENTRYPOINT ["app"]
