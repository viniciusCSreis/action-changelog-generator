const core = require('@actions/core');
const fs = require('fs');

// most @actions toolkit packages have async methods
async function run() {
  try {
    fs.readdir(".", (err, files) => {
      files.forEach(file => {
        console.log(file);
      });
    });
  }
  catch (error) {
    core.setFailed(error.message);
  }
}

run()
