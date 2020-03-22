const core = require('@actions/core');
const fs = require('fs');
const { exec } = require("child_process");

// most @actions toolkit packages have async methods
async function run() {

  const repoToken = 'b39553443821220bcb259cbdef722cd71651c7c5';
  const repoName = 'action-changelog-generator'
  const repoUser = 'viniciusCSreis';
  const currentPath = process.cwd();
  const branchName = Math.random()

  try {
    fs.readdir(".", (err, files) => {
      files.forEach(file => {
        console.log(file);
      });
    });
    console.log(`docker run --rm -v ${currentPath}:/usr/local/src/your-app ferrarimarco/github-changelog-generator -u ${repoUser} -p ${repoName} --token ${repoToken}`)
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
