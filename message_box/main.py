
from http.server import HTTPServer,BaseHTTPRequestHandler
from urllib.parse import urlparse

message_box: dict[str,str] = {}

class Server(BaseHTTPRequestHandler):
    def do_HEAD(self):
        return

    def do_GET(self):
        self.respond()

    def do_POST(self):
        return

    def handle_http(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        parsed = urlparse(self.path).path[1:].partition("/")
        if parsed[2]:
            # set 
            message_box[parsed[0]] = parsed[2]
        return bytes(message_box.get(parsed[0]), "UTF-8")

    def respond(self):
        content = self.handle_http()
        self.wfile.write(content)

if __name__ == '__main__':
    httpd = HTTPServer(("localhost", 8081), Server)
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()