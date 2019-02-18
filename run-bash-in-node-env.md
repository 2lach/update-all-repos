<!-- markdownlint-disable -->

Dec 17, 2016
Running Bash scripts from Node.js
How simple Bash scripts can add some old-school spice (and serious power) to your Node projects
https://medium.com/the-readme/old-school-bash-for-your-node-projects-dfc8ed674a91


https://nodejs.org/api/child_process.html



this guy:
https://tutorialedge.net/javascript/nodejs/executing-shell-scripts-with-nodejs/



link bin -> 
https://www.npmjs.com/package/link-bin

To test it you can also run npm install -g . in the folder where you added the above app.js and package.json files.



check out npm struct from https://github.com/sindresorhus/trash-cli/blob/master/cli.js


--------------------------------------------------------------------------------------
// const spawn = require('child_process').spawn();
// const exec = require("child_process").exec(); //command[, options][, callback])
// const exec = require('child_process').exec;
// const { exec } = require('child_process');

// spawn('sh', [''], { cwd: 'bash ./get-all-updates.sh' })

// exec('"/path/to/test file/test.sh" arg1 arg2');
// Double quotes are used so that the space in the path is not interpreted as
// multiple arguments
/*
exec('sh ./../get-all-updates.sh', (error, stdout, stderr) => {
if (error) {
        console.error(`exec error: ${error}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
    console.log(`stderr: ${stderr}`);
});
*/