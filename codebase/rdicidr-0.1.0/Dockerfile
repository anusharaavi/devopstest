# Use the desired base image for Node.js
FROM node:15

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the desired port (replace 3000 with your application's port)
EXPOSE 3000

# Define the command to start your Node.js application
CMD [ "node", "app.js" ]

