const { exec } = require("child_process");
const express = require('express');
const app = express();
const port = 8086;
app.get('/', (req, res) => {
  res.write("<body><ul><li>Deploy <a href=\"/sample1\">sample1</a></li> <li>Deploy <a href=\"/sample2\">sample2</a></li></ul></body>")
});
app.get('/sample1', (req, res) => {
  exec("kubectl delete deployment sample -n jank8s || true && kubectl apply -f sample-deploy.yaml -n jank8s", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        message = `error: ${error.message}`;
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        message = `error: ${error.message}`;
        return;
    }
    console.log(`stdout: ${stdout}`);
    message = `error: ${error.message}`;
  });
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Attempting to create deployment for sample 1");
  res.end();
});
app.get('/sample2', (req, res) => {
  exec("kubectl delete deployment sample2 -n jank8s || true && kubectl apply -f sample2-deploy.yaml -n jank8s", (error, stdout, stderr) => {
    if (error) {
        console.log(`error: ${error.message}`);
        message = `error: ${error.message}`;
        return;
    }
    if (stderr) {
        console.log(`stderr: ${stderr}`);
        message = `error: ${error.message}`;
        return;
    }
    console.log(`stdout: ${stdout}`);
    message = `error: ${error.message}`;
  });
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write("Attempting to create deployment for sample 2");
  res.end();
}).listen(8086);
console.log("listening on port 8086")