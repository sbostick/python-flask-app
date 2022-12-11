#!/usr/bin/env python3
import socket
from flask import Flask, render_template, request, jsonify, send_file
from markupsafe import escape

app = Flask(__name__, template_folder='templates')
app.url_map.strict_slashes = False


@app.route("/healthz")
def health():
    return jsonify({'status': 'healthy'})


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return jsonify({
        'args'         : request.args,
        'full_path'    : request.full_path,
        'hostname'     : socket.gethostname(),
        'path'         : escape(request.path),
        'query_string' : request.query_string.decode('utf-8'),
        'remote_addr'  : request.remote_addr,
        'remote_addr'  : request.remote_addr,
        'scheme'       : request.scheme,
        'url'          : escape(request.url)})


@app.route('/test/template/<name>')
def test_template(name="guest"):
    return render_template("welcome.html", name=name)


@app.route('/test/sendfile/', methods=['GET'])
def handler_send_file():
    filepath = 'example.svg'
    return send_file(filepath, as_attachment=False)


@app.route('/test/path/<path:subpath>')
def show_subpath(subpath):
    result = escape(subpath)
    return f"Subpath {result}\n"


@app.route('/test/post/<int:post_id>', methods=['GET', 'POST'])
def show_post(post_id):
    result = {'id': post_id}
    if request.is_json:
        result['payload'] = request.get_json()
    else:
        result['payload'] = 'n/a'
    return jsonify(result)
