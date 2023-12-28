FROM composer:2

ARG USER
ARG GROUP

RUN adduser -g ${GROUP} -s /bin/sh -D ${USER}

USER ${USER}