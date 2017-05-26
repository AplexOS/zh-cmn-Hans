# HomePage 

## GitLab modify

* cat /etc/gitlab/gitlab.rb
```
    ...
    external_url 'http://60.251.148.4/gitlab'
    ...
```
* gitlab-ctl configure

## Nginx modify

```
    cat /var/opt/gitlab/nginx/conf/gitlab-http.conf
        ...
        server {
          listen *:80;
          ...
          location / {
            # proxy_cache off;
            # proxy_pass  http://gitlab-workhorse;
            root /home/gitserver/webpage;
            index index.html index.htm index.php;
          }
          ...
        }
        ...
```

## MkDocs

* mkdocs tree:
```
        .
        ├── docs
        │   └── index.md
        └── mkdocs.yml
```
* mkdocs build

## Copy website page

* cp site/* ~/webpage/ -r
