# conda-env-docker

docker build --force-rm --rm -t condatest .

docker run -it condatest

docker run --name conda-env-test -p 8888:8888 -v "$PWD/src:/home/src" -d condatest

docker run -it conda-env-test /bin/bash
