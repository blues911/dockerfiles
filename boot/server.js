var http = require('http');
var port = 5555;

var server = http.createServer({}, function(req, res) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write('Localhost:'+port);
    res.end();
});

server.listen(port);
