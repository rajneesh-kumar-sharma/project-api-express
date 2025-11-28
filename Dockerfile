# Use official Node.js image as base
FROM node:18-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy rest of the application code
COPY . .

# Expose the port your app runs on (e.g., 3000)
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
