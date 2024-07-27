# Dockerfile used to test whether changes in config cause failure to start
# emacs
#
# Can be run like `docker run -d <hash of built docker image>`
# and then connected to like `docker exec -it "$(docker container list --format '{{.ID}}')" emacsclient -t`

FROM ubuntu:noble

RUN apt-get update && apt-get install -y emacs-nox git

COPY .emacs.d/init.el /root/.emacs.d/init.el
COPY .emacs.d/straight/versions/default.el /root/.emacs.d/straight/versions/
COPY .emacs.d/user-config /root/.emacs.d/user-config
COPY .emacs.d/autogen-config /root/.emacs.d/autogen-config

# We want this fore-grounded from the standpoint of docker, since `emacs
# --daemon`'s default behaviour of returning your terminal to you (i.e.
# backgrounding itself) gets interpreted by Docker as an indication that the
# container is done doing what it's meant to, and can be removed. We want the
# container to stick around, so we can exec into a shell and try out using it
# via `emacsclient`
ENTRYPOINT ["emacs", "--fg-daemon"]
