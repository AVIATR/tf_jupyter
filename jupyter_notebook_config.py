# Set options for certfile, ip, password, and toggle off
# Set ip to '*' to bind on all interfaces (ips) for the public server
# Instructions at http://jupyter-notebook.readthedocs.io/en/stable/public_server.html#notebook-public-server
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.password = u'sha1:bcd259ccf...<your hashed password here>'
c.NotebookApp.open_browser = False

# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 8888
