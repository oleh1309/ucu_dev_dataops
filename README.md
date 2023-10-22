**Docker image location**

https://hub.docker.com/r/oleh1309/ucu/tags

**Plan**

1. Clone repo from current branch
2. Switch to `multi_stage_builds` branch
2. In the source dir, build an image with specific target stage
3. Run an image, and see the result in the browser

**How to build?**

The main thing which should be done to build an image with default 
settings is to run the following command:

``docker build -t oleh1309/ucu:latest .``

By default it would build start from the first stage - `builder` and complete 
building on the last stage which calls - `final_build_2`

To build, for example, only first 2 stage -  `builder` and `final_build_1`, run 
the following command:

`docker build --target final_build_1 -t oleh1309/ucu:latest .`

**How to run?**

Command to run the following image:

`docker run -p 5000:5000 oleh1309/ucu:latest`