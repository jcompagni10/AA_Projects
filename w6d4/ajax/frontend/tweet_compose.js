const APIUtil = require("./api_util.js");

class TweetCompose{
  constructor(){
    this.form = $(".tweet-compose");
    this.form.on('submit', this.handleSubmit.bind(this));
    let textarea = this.form.find('textarea');
    textarea.on('input', this.updateChars.bind(this));
  }
  handleSubmit(e){
    e.preventDefault();
    this.form.find('input').attr('disabled', true);
    let contents = this.form.serializeJSON();
    APIUtil.createTweet(contents)
      .then(this.renderTweet.bind(this))
      .always(this.reenable.bind(this));
  }

  renderTweet(data){
    this.form.find('textarea').val("");
    let tweet = $("<li></li>");
    tweet.append(data.content+ " -- ");
    tweet.append(`<a href=/users/${data.user.id}>${data.user.username}</a> -- `);
    tweet.append(data.created_at);
    let feed = this.form.data('tweets-ul');
    $(feed).prepend(tweet);
  }

  reenable(){
    this.form.find('input').attr('disabled', false);
  }

  updateChars(e){
    const chars = 140;
    let left = chars - $(e.target).val().length;
    $('.chars-left').html(`${left} characters left`);
  }
}

module.exports = TweetCompose;
