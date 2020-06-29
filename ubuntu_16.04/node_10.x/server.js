var http = require('http');
var port = 5555;

var server = http.createServer({}, function(req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write('<code>It works!</code><br/>');
    res.write('<code>Node server is running at port: '+port+'</code>');
    res.end();
});

server.listen(port);