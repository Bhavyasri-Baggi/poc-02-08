const http = require('http');

http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('POC-02 CI/CD Pipeline Working Successfully\n');
}).listen(3000);

console.log("App running on port 3000");

