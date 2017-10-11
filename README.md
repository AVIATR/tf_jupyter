# tf_jupyter
Docker container for machine learning, runs jupyter notebook & tensorflow

Container runs jupyter notebook on port 8888, and can be launched as
`docker run -d -p 8888:8888 aviatr/tf_jupyter jupyter notebook --ip=0.0.0.0 --no-browser --allow-root`