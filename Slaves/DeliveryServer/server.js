var http = require('http');
const { exec } = require("child_process");
http.createServer(function (req, res) {
  exec("kubectl delete deployment sample -n jank8s || true && kubectl apply -f sample-deploy.yaml -n jank8s", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
  });
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Attempting to create deployment for sample");
  res.end();
}).listen(8086);
console.log("listening on port 8086")