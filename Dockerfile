FROM node:16

COPY . /app

WORKDIR /app
#RUN npx create-react-app yourprojectname
#RUN npm install axios
RUN npm cache clean --force && \
    npm install
RUN npm run build


EXPOSE 3000
CMD [ "npm", "start" ]
