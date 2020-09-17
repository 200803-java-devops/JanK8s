var http = require('http');
const { exec } = require("child_process");

http.createServer(function (req, res) {
  exec("docker pull jank8s/jenkins-sample", (error, stdout, stderr) => {
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
  
  exec("docker kill sample1", (error, stdout, stderr) => {
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

  exec("docker run --rm --name=sample1 -p 8085:8080 jank8s/jenkins-sample", (error, stdout, stderr) => {
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
  res.write('running pull command');
  res.end();
}).listen(8086);

console.log("listing on port 8086")