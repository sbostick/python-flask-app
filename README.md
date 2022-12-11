Overview
--------

A basic Python Flask example.
Currently working with python 3.9.10.


Dev Loop
--------

```bash
pip install -r requirements.txt

make check-python
make check-shell
make run-native
make tests
```


Testing
-------

* http://127.0.0.1:5000/healthz
* http://127.0.0.1:5000/test/catch-all/foo/bar/baz?greeting=hello&name=world
* http://127.0.0.1:5000/test/sendfile/
* http://127.0.0.1:5000/test/template/lucky-go-happy
* http://127.0.0.1:5000/test/path/foo/bar/baz/
* http://127.0.0.1:5000/test/post/1234
