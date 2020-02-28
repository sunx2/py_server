from server import get, static_file, run , route, template, url , request

@route('/statics/<filepath:path>', name='statics')
def server_static(filepath):
    return static_file(filepath, root='./statics')

@route("/")
def homepage():
  return "hello world"

run(host='localhost', port=8080)
