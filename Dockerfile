# Use official Node.js image
FROM node:20

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Build Strapi admin panel
RUN npm run build

# Expose Strapi default port
EXPOSE 1337

# Start Strapi in production mode
CMD ["npm", "run", "start"]
