#!/usr/bin/env node

const exec = require('child_process').exec; //, child;
                                                            // Make this path relative or better yet global symlink
const updateWorkSpaceScript = exec('sh get-all-updates.sh /Users/stefanlachmann/Desktop/Z/z-code/update-all-repos/');

updateWorkSpaceScript.stdout.on('data', function(data){
    console.log('info: ',data); 
});

updateWorkSpaceScript.stderr.on('data', function(data){
    console.log('error: ', data);
});