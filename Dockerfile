# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# copy package.json and yarn.lock to the working directory
COPY package.json package-lock.json ./

# Install the project dependencies
RUN npm install

# Make /docs directory
RUN mkdir -p /docs

# Copy the rest of the application code
COPY . .

# Install Mintlify
RUN npm i -g mintlify

# Expose the port your app runs on (adjust if needed)
EXPOSE 17584

# Command to run your application
CMD ["mintlify", "dev", "--port", "17584"]
