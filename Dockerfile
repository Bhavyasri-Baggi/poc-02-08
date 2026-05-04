FROM node:18  # This pulls the official Node.js base image which contains Node.js and npm preinstalled. It is not an OS like EC2; it is a lightweight container base image.
WORKDIR /app #Sets /app as the working directory inside the container. All subsequent commands run from here.
COPY . .  #Copies the application source code from the Git repository into the container filesystem.
RUN npm install  #Installs application dependencies during image build time.
EXPOSE 3000  #Documents that the application listens on port 3000 inside the container. This does not publish the port by itself.
CMD ["npm", "start"]  #Defines the default command that runs when the container starts.
