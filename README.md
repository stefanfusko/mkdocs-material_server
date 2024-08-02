# mkdocs-material_server

To start run following code
```bash
$ sudo mv BLOG/ /opt/BLOG
$ sudo mv SystemD/BLOG_server.service /lib/systemd/system/
$ sudo chown root:root /lib/systemd/system/BLOG_server.service
$ sudo systemctl daemon-reload
$ sudo systemctl start BLOG_server
```
