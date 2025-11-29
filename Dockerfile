# Start from the official Node.js image
FROM node:18-alpine

# Create a working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the work directory
COPY package*.json ./

# Install dependencies (this leverages the dependencies already resolved in the CI job)
RUN npm install --omit=dev

# Copy the rest of the application code
COPY . .

# Expose the port the application runs on (default for Express is often 3000)
# You should check the port used by your URL shortener project
EXPOSE 3000

# Define the command to run the application when the container starts
CMD [ "npm", "start" ]