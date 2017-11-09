const FollowToggle = require("./follow_toggle.js");
const UserSearch = require("./user_search.js");
const TweetCompose = require("./tweet_compose.js");

$(()=>{
  setFollows();
  setSearch();
  setForm();
});

function setFollows(){
  let $allFollows = $('.follow-toggle');
  let followObjs = [];
  $allFollows.each(function(){
    let obj = new FollowToggle(this);
    followObjs.push(obj);
  });
}

function setSearch(){
  let search = new UserSearch($(".user-search"));
}

function setForm(){
  new TweetCompose();
}
