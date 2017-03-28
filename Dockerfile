FROM node:boron
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Install app dependencies
COPY package.json /usr/src/app/
COPY index.js /usr/src/app/
COPY app.json /usr/src/app/
RUN npm install
RUN npm start
RUN npm build
# Bundle app source
COPY . /usr/src/app
EXPOSE 8083
CMD [ 'npm', 'start', 'build' ]

