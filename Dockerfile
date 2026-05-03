FROM node:18  # image like os node node is the default docker os image like t3.micro in aws ec2 insance which conatins required dependecies and packages
WORKDIR #app #defining the working directory 
COPY . .  #coping from local repo to any remote repositories
RUN npm install  #installing required dependencies and staring the container i.e from image to container running
EXPOSE 3000  #defining the port where it need to be run
CMD ["npm", "start"]  #starting the container
