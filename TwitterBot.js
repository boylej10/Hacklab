var Twitter = require('twitter');

var client = new Twitter({
    consumer_key: '',
    consumer_secret: '',
    access_token_key: '',
    access_token_secret: '',
});

var params = {screen_name: 'realDonaldTrump'};
client.get('statuses/user_timeline', params, function(error, tweets, response) {
 if (!error) {
     console.log(tweets);
 }
});

client.post('statuses/update', {status: 'what the tweet'}),
    function(error,tweet,response) {
    if(error) throw error;
    console.log(tweet); // Tweet Body
    console.log(response); // Raw response object
}