HOST := 127.0.0.1
PORT := 5000

check-python:
	pycodestyle --ignore E111,E701,E203 --verbose ./src/*.py

check-shell:
	shellcheck ./test/main.sh

run-native:
	echo "open http://127.0.0.1:${PORT}"
	cd src && FLASK_APP=app.py FLASK_DEBUG=1 flask run --host ${HOST} --port ${PORT}

.PHONY: test
test:
	./test/main.sh
