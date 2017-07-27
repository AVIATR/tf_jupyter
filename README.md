# MLDocker
Docker container for computer vision and machine learning

Container runs jupyter notebook on port 8888, and can be launched as
`docker run -d -p 8888:8888 endertekin/mltest jupyter notebook --ip=0.0.0.0 --no-browser --allow-root`