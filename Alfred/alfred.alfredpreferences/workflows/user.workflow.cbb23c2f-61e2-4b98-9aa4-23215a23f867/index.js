const fsp = require('fs-promise');
const _   = require('lodash');

const directoriesToRead = [
  '/Users/chris.albert/git'
];

const dirContents = _.map(directoriesToRead,dir => {
  return fsp.readdir(dir)
    .then(dirs => {
      return _.map(dirs,d => {
        return {
          name: d,
          path: (dir + '/' + d)
        };
      })
    });
})


function getProjectDirs() {
  return Promise.all(dirContents)
    .then(dirs => {
      return _.filter(_.flatten(dirs),d => !_.startsWith(d,'.'));
    })
}

function generateAlfredJson(directories) {
  const items = _.map(directories,directory => {
    return {
      title: directory.name,
      uid: directory.name,
      arg: directory.path
    }
  });
  return {
    items: items
  };
}

function printJson(json) {
  console.log(JSON.stringify(json));
}

getProjectDirs()
  .then(generateAlfredJson)
  .then(printJson);
