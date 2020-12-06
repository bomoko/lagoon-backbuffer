# lagoon-backbuffer

The problem that we'd like to solve is that of the content/code divide in static sites.

There are two reasons to rebuild a static site. First, the actual code changes. Second, there's a content change, and we thus need to rebuild simply to address this new content.


Ideally we'd like to be able to have our application redepolyed on _code_ changes, but still have the static assets rebuild on content changes.


This repo is a proof on concept that brings in the idea of the front and back buffering patters from graphics programming.
Essentially, when we have a content refresh, we'd like to rebuild the static site in the background and if it has new content.
If the rebuild is successful we swap out the backbuffer (the new static site) with the old files.

the directory structure of the POC is as follows
- in the root directory we have the code that creates the images and moves the "app" and "deployer" into their relevant directories
- the "app" is a simple gatsby app - when we run "gatsby build" it will output the static site in the usual ./public directory - this functions as the backbuffer
- the "deployer" directory contains a node app that statically serves anything in its `./dist` directory
-- Furthermore, it has a command "content-deploy" that will copy anything from the backbuffer to the front-buffer (i.e. from /build/public to /app/dist)


## Configuration

By default, the backbuffer directory will be `/build/public` - but can be set by setting the `LAGOON_BACKBUFFER` environment variable.


## TODO

* Introduce a varnish cache in front of the node process - internally we'd like to have a single source of truth for the static files. If we want to horizontally scale we could add multiple varnishes serving our code.
* Replace the static site node process entirely
* Move all the deoployer code into a base image
