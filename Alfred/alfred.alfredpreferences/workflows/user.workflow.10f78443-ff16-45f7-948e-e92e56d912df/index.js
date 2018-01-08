const jenkinsapi = require('jenkins-api');
const _          = require('lodash');

const j = {
  url: 'jenkins.tfly-cloud.com/jenkins',
  user: 'chris.albert@ticketfly.com',
  token: '******'
}
// API Token
var jenkins = jenkinsapi.init(`http://${j.user}:${j.token}@${j.url}`);

jenkins.all_jobs((e,d) => {
  if(e) {
    console.error('Error occured');
    console.error(d);
  } else {
    const json = _.map(d,job => {
      var color = job.color;
      if(color === 'notbuilt' || color === 'aborted' || color === 'disabled') {
        color = 'gray';
      }
      var fileType = '.png';
      if(color === 'blue_anime') {
        fileType = '.gif';
      }
      return {
        title: job.name,
        uid: job.name,
        arg: job.url,
        icon: {
          path: (color + fileType)
        }
      }
    })

    console.log(JSON.stringify({items: json}));
  }
})
