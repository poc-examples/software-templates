# Base image
FROM node:14

# Set working directory
WORKDIR /tests

# Install Nunjucks and js-yaml for YAML parsing
RUN npm install nunjucks js-yaml

# Copy test script, template file, and values file to the container
COPY nunjucks-test.js .

# Run the test script
CMD ["node", "nunjucks-test.js"]
