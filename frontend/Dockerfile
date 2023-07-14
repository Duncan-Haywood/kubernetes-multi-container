# Base image with Node.js pre-installed
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy the rest of the project files to the container
COPY . .

# Build the React app for production
RUN npm run build

# Expose the desired port for the container
EXPOSE 3000

# Set the command to run the React app
CMD ["npm", "start"]
