const core = require('@actions/core');
const fs = require('fs');
const { exec } = require("child_process");

// most @actions toolkit packages have async methods
async function run() {

  const repoToken = core.getInput('repo-token');
  const repoName = core.getInput('repo-name');

  try {
    fs.readdir(".", (err, files) => {
      files.forEach(file => {
        console.log(file);
      });
    });
    exec(`docker run -it --rm -v .:/usr/local/src/your-app ferrarimarco/github-changelog-generator -p ${repoName} --token ${repoToken} `, (error, stdout, stderr) => {
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
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
