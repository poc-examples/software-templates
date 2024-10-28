FROM quay.io/devfile/universal-developer-image:latest

USER root

# Install necessary tools (e.g., curl) to download code-oss
RUN yum install -y curl tar

# Download and install code-oss
RUN curl -L https://update.code.visualstudio.com/commit:7f6ab5485bbc008386c4386d08766667e155244e/server-linux-x64/stable \
    -o /tmp/code-oss.tar.gz \
    && ls -la /tmp/ \
    && tar -xvzf /tmp/code-oss.tar.gz \
    && ls -la /tmp/
    # && mkdir -p /usr/local/bin/code-oss \
    # && tar -xvzf /tmp/code-oss.tar.gz -C /usr/local/bin/code-oss --strip-components=1 \
    # && ln -s /usr/local/bin/code-oss/bin/code-server /usr/local/bin/code-oss

# Install any extensions (optional)
RUN code-oss --install-extension ms-python.python
