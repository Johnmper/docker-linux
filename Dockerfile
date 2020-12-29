FROM debian:buster-slim
LABEL maintainer="joaomgper <joaomgper94@gmail.com>"

# Install dependencies
RUN apt update && apt -y -q upgrade
RUN apt -y -q install build-essential git libncurses-dev bison flex libssl-dev libelf-dev
RUN apt clean

# Create extensions folders for non-roots
RUN mkdir -p /root/.vscode-server/extensions \
             /root/.vscode-server-insiders/extensions

# Store bash_history in persintent location (volume)
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/ldod/.config/.bash_history" \
    && echo $SNIPPET >> "/root/.bashrc" \
    && mkdir -p /ldod/.config \
    && touch /ldod/.config/.bash_history
# Extra stuff to put in bashrcW
RUN echo "source /ldod/.ws/.bashrc_profile" >> "/root/.bashrc"
# Set default shell as bash instead of sh
SHELL ["/bin/bash", "-c"]