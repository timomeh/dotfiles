// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: "Arc",
  handlers: [
    // always open Google Cloud as Gigs
    {
      match: ({ url }) => url.host.includes('cloud.google.com'),
      browser: { 
        name: "Arc",
        profile: "Work"
      }
    },

    // always open Google Meet as Gigs
    {
      match: ({ url }) => url.host.includes('meet.google.com'),
      browser: { 
        name: "Arc",
        profile: "Work"
      }
    }
  ],
  handlers: [{
    match: "linear.app/gigs/*",
    browser: "Linear"
  }]
}

function addAuthuser(search) {
  if (search.includes('authuser')) return search
  if (!search) return 'authuser=timo@gigs.com'
  return search.concat('&authuser=timo@gigs.com')
}