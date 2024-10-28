FROM quay.io/devfile/universal-developer-image:latest

# Install code-oss extensions
RUN code-oss --install-extension danielsanmedium.dscodegpt \
    && code-oss --install-extension ms-python.python

# Set up a volume for extensions to persist across sessions (optional)
VOLUME /home/user/.vscode/extensions

# Expose the port for the code-oss server (if required)
EXPOSE 8080