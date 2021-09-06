FROM node:14-buster AS build

# Set working directory and node user
WORKDIR /home/node/lowdefy

USER node

# Copy app config, and change ownership of files to "node" user
COPY  --chown=node:node  . .

# Build the Lowdefy config using the Lowdefy CLI
RUN npx lowdefy@latest build

# Use the correct Lowdefy base image
FROM lowdefy/lowdefy-aws-lambda:3.21.2

# Copy build output from build stage
COPY --from=build /home/node/lowdefy/.lowdefy/build ./build

# Copy contents of public directory into image
COPY ./public ./public

# Lambda handler
CMD [ "dist/server.handler"]
