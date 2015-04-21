FROM ubuntu:14.04

MAINTAINER Mark Rendle <github.com/markrendle>

#based on dockerfile by Michael Friis

RUN apt-get update \
	&& apt-get install -y curl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/lib/dpkg/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list \
	&& echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | tee -a /etc/apt/sources.list.d/mono-xamarin.list \
	&& apt-get update \
	&& apt-get install -y mono-complete ca-certificates-mono fsharp mono-vbnc nuget \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /var/lib/dpkg/lists/* \
	&& mozroots --machine --import --sync --quiet

