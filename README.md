# tf_jupyter
Docker container for machine learning, runs jupyter notebook & tensorflow

Container runs jupyter notebook on port 8888, and can be launched simply by running the `./run.sh` script

If you'd like to put this in the cloud somewhere, create a _private_ folder, and replace the sha-1 hashed password in pwd.txt file (currently _password_) with your own password. Furthermore, add your ssl keys underneath _private_. You can then launch the container with the script `./run.sh` which will mount the _private_ folder in the docker container where the jupyter notebook expects to find them, and also pass your password to the jupyter notebook.

The GPU version is buiult from Dockerfile_gpu, and is autobuilt and tagged as `gpu`, and you can similarly run `./run_gpu.sh` to launch the gpu version.

The automatic builds can be found on Dockerhub as `aviatr/tf_jupyter` and `aviatr/tf_jupyter:gpu`.

## Acknowledgements:
[Dark theme for Jupyter Notebook/iPython 4](https://github.com/powerpak/jupyter-dark-theme) is created by Theodore Pak.
