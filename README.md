# React Production Starter

[![Build Status](https://travis-ci.org/vidrowan/react-production-starter.svg?branch=master)](https://travis-ci.org/vidrowan/react-production-starter)

An example react application (master-detail feed) with isomorphic rendering, async react-router routes, async redux reducers, async data fetching, and code-splitting.

#### Motivation
The file size of isomorphic React apps can quickly get out of hand. Many isomorphic starter kits look awesome to begin with but yield a several megabyte javascript file for the client to download. This project aims to demonstrate some possible solutions.

#### Under the Hood
 - [Node.js](https://nodejs.org/en/)
 - [Express](https://github.com/expressjs/express)
 - [React](https://github.com/facebook/react)
 - [Redux](https://github.com/reactjs/redux)
 - [React Router](https://github.com/reactjs/react-router) 2.0
 - [Aphrodite](https://github.com/Khan/aphrodite) for CSS by Khan Academy
 - [React Helmet](https://github.com/nfl/react-helmet) for meta tags by the NFL
 - [Redial](https://github.com/markdalgleish/redial) for data fetching by [@markdalgleish](https://twitter.com/markdalgleish)
 - [Babel 6](https://github.com/babel/babel)
 - [Webpack](https://github.com/webpack/webpack) with vanilla Hot Module Replacement

#### Inspiration
 - [example-react-router-server-rendering-lazy-routes](https://github.com/ryanflorence/example-react-router-server-rendering-lazy-routes) by [@ryanflorence](https://twitter.com/ryanflorence)
 - [Cake's approach to React Router server rendering w/code splitting and Redux](https://gist.github.com/rgrove/3e612aa366541845161c) by [@rgrove](https://twitter.com/yaypie)
 - [How to dynamically load reducers for code splitting in a Redux application?](http://stackoverflow.com/questions/32968016/how-to-dynamically-load-reducers-for-code-splitting-in-a-redux-application) by [@dan_abramov](https://twitter.com/dan_abramov)

#### Folder Structure:
```
.
├── /build/                     # The folder for compiled output
├── /node_modules/              # 3rd-party libraries and utilities
├── /src/                       # The source code of the application
│   ├── /components/            # Global React components
│   ├── /middleware/            # Redux middleware (comes with callAPIMiddileware)
│   ├── /routes/                # **React-router routes (i.e. mini-redux-apps)** (:fire:)
│   ├── /server/                # Server
│   |   ├── /api/               # API endpoints
│   |   |   ├── /posts.js       # Posts endpoint
│   |   |   ├── /post.js        # Single Post endpoint
│   |   ├── /fakeDB.js          # Database Stub
│   |   ├── /server.js          # Express app
│   |   └── /index.js           # Server entry point (with babel-register)
│   ├── /client.js              # Client-side entry point
│   ├── /constants.js           # Global constants (action types)
│   ├── /createReducer.js       # Like rootReducer, but async
│   ├── /store.js               # Async store configuration
│   ├── /style.js               # Global style/layout constants
├── /test/                      # Mocha tests (e.g. xxx_spec.js)
├── /coverage/                  # Code coverage data
│── .env                        # **Server-side configuration variables**
│── Procfile                    # Heroku startup commands
│── package.json                # The list of 3rd party libraries and utilities and NPM scripts
│── webpack.config.dev.js       # Webpack Development Configuration File
└── webpack.config.prod.js      # Webpack Production Configuration File
```

### Getting started
```bash
git clone https://github.com/vidrowan/react-production-starter MyApp
cd MyApp
npm install
npm start

# Open localhost:5000
```

More docs soon. PRs welcome!

## Docker Tips
 - [Hub.Docker repo](https://hub.docker.com/r/vidrowan/react-production-starter/)

### Mac & Kitematic
 - In order to view the app from your Mac:
   - It's helpful to pass port 5000 like so 
```docker run -d -t -p 80:80 -p 5000:5000 -v `pwd`/MyApp:/stuff vidrowan/react-production-starter```
   - Additionally, It's important to update the /etc/hosts file to be able to view the app from your mac.
     - I capture the docker id and preferred URL in vars and prompt the user to update the file. 
     - Here's the one-liner I use:

```docker_id=''; docker_ip=''; docker_container=''; default='docker-app.dev'; read -t 10 -p 'What would you like your URL to be? ('$default') ' docker_url; docker_url=${docker_url:-$default}; echo "OK. We'll use: $docker_url"; docker_id=$(docker run -d -t -p 80:80 -p 5000:5000 vidrowan/react-production-starter ${docker_url}); echo 'Docker ID: '$docker_id; docker_ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $docker_id); docker ps; echo 'Docker IP: '$docker_ip; docker_container=$(echo $docker_id | cut -c1-12); echo 'Docker Container: '$docker_container; echo "${docker_ip} ${docker_url}" | pbcopy; while [ -z $prompt ]; do read -t 8 -n 1 -p $'A host entry: "${docker_ip} ${docker_url}" has been copied to your clipboard. Would you like to edit your /etc/hosts file now: sudo vim /etc/hosts (Y/n)?' choice; case "$choice" in y|Y ) echo; echo 'OK.'; sudo vim /etc/hosts; break;; n|N ) echo; echo 'OK. You may need to do that later if you have issues viewing your docker app in a browser'; break;; esac; done; prompt=; echo 'To stop; run: docker stop '$docker_container; echo 'To remove the host entry find: "${docker_ip} ${docker_url}" in /etc/hosts delete the line.'; echo 'sudo vim /etc/hosts';```

     - Here it is on multi-lines:
```bash
docker_id=''; 
docker_ip=''; 
docker_container=''; 
default='docker-app.dev'; 
read -t 10 -p 'What would you like your URL to be? ('$default') ' docker_url; 
docker_url=${docker_url:-$default};
echo "OK. We'll use: $docker_url";
docker_id=$(docker run -d -t -p 80:80 -p 5000:5000 vidrowan/react-production-starter ${docker_url});
echo 'Docker ID: '$docker_id;
docker_ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' $docker_id);
docker ps;
echo 'Docker IP: '$docker_ip;
docker_container=$(echo $docker_id | cut -c1-12);
echo 'Docker Container: '$docker_container;
echo "${docker_ip} ${docker_url}" | pbcopy;
while [ -z $prompt ];
do read -t 8 -n 1 -p $'A host entry: "${docker_ip} ${docker_url}" has been copied to your clipboard. Would you like to edit your /etc/hosts file now: sudo vim /etc/hosts (Y/n)?' choice;
  case "$choice" in y|Y ) echo;
    echo 'OK.';
    sudo vim /etc/hosts;
  break;;
  n|N ) echo;
    echo 'OK. You may need to do that later if you have issues viewing your docker app in a browser';
  break;;
  esac;
done;
prompt=;
echo 'To stop;
run: docker stop '$docker_container;
echo 'To remove the host entry find: "${docker_ip} ${docker_url}" in /etc/hosts delete the line.';
echo 'sudo vim /etc/hosts';
```
