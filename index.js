const core = require('@actions/core');
const fs = require('fs');
const { exec } = require("child_process");

// most @actions toolkit packages have async methods
async function run() {

  const repoToken = core.getInput('repo-token');
  const repoName = core.getInput('repo-name');
  const repoUser = core.getInput('repo-user');
  const currentPath = process.cwd();
  const branchName = Math.random()

  try {
    fs.readdir(".", (err, files) => {
      files.forEach(file => {
        console.log(file);
      });
    });
    exec(`docker run --rm -v ${currentPath}:/usr/local/src/your-app ferrarimarco/github-changelog-generator -u ${repoUser} -p ${repoName} --token ${repoToken} `, (error, stdout, stderr) => {
      if (error) {
        console.log(`error: ${error.message}`);
        return;
      }
      if (stderr) {
        console.log(`stderr: ${stderr}`);
        return;
      }
      console.log(`stdout: ${stdout}`);
      fs.readdir(".", (err, files) => {
        files.forEach(file => {
          console.log(file);
        });
      });
      exec(`git checkout -b ${branchName}`)
      exec(`git add .`)
      exec(`git commit -m "add change-log"`)
      exec(`git push origin ${branchName}`)
    });
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
