# ros-mrs-docker

The Dockerfiles was used in the research at NTHU ICMEMS.

### docker build

This repo contains 3 kinds of dockerfile, just build the dockerfile you need.

* Dockerfile - normal one, with intel CPU and iGPU
* Dockerfile.jetson - on the NVIDIA Jetson series
* Dockerfile.nvidiagpu - on the PC with NVIDIA GPU

### docker run

Three shell scripts were prepared, run the script corresponding to Dockerfile.

```shell
# normal one
./run_docker.sh
# with NVIDIA Jetson series
./run_docker_jetson.sh
# with NVIDIA GPU
./run_docker_nvidiagpu.sh
```
