const APIUtil = require("./api_util.js");
const FollowToggle = require("./follow_toggle.js");

class UserSearch{
  constructor(el){
    this.el = $(el);
    this.ul = this.el.find('ul');
    this.input = this.el.find('input');

    this.input.on("input", this.search.bind(this));
  }

  search(e){
    APIUtil.searchUsers(e.target.value).then(this.populateResults.bind(this));
  }

  populateResults(data){
    this.ul.children().remove();
    data.forEach( (user)=>{
      let li = $("<li></li>");
      li.html(`<a href=${user.id}>${user.username}</a>`);
      let followButton = $('<button class="follow-toggle"></button>');
      let options = {userId: user.id, followState: user.followed};
      new FollowToggle(followButton, options);
      li.append(followButton);
      this.ul.append(li);
    });
  }
}

module.exports = UserSearch;
