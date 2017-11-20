const APIUtil = require("./api_util.js");


class FollowToggle{
  constructor(el, options){
    this.el = $(el);
    this.userId = this.el.data('userid') || options.userId;
    this.followed = this.el.data('followed') || options.followState;
    this.el.on('click', this.handleClick.bind(this));
    this.render();
  }
  render(){
    if (this.followed){
      this.el.html("Unfollow");
    }
    else{
      this.el.html("Follow");
    }
  }

  handleClick(e){
    this.disable();
    e.preventDefault();
    if (this.followed){
      APIUtil.unfollowUser.call(this, this.userId).then(this.toggleState.bind(this));
    } else{
      APIUtil.followUser(this.userId).then(this.toggleState.bind(this));
    }
  }

  toggleState(){
    this.followed = !this.followed;
    this.render();
    this.enable();
  }

  disable(){
    this.el.attr('disabled', true);
  }
  enable(){
    this.el.attr('disabled', false);
  }
}

module.exports = FollowToggle;
