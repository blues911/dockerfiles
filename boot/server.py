import SimpleHTTPServer
import SocketServer

PORT = 5555

class MyHttpRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

        content = "<html><head></head><body>Localhost:" + str(PORT) + "</body></html>"
        self.wfile.write(content.encode("utf8"))
        return

httpd = SocketServer.TCPServer(("", PORT), MyHttpRequestHandler)
httpd.serve_forever()