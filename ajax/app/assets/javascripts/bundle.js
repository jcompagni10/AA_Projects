/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(1);
const UserSearch = __webpack_require__(3);
const TweetCompose = __webpack_require__(4);

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);


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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {

followUser: id=> {return $.ajax({
                    type: 'post',
                    url: "/users/"+id+"/follow",
                    dataType: 'json',
                    success: (resp) => console.log("resp"),
                    error: () => console.log("ERROR w/ request")
                  });
                },

  unfollowUser: function(id) { debugger; return $.ajax({
                          type: 'delete',
                          url: "/users/"+id+"/follow",
                          dataType: 'json',
                          success: (resp) => console.log("resp"),
                          error: () => console.log("ERROR w/ request")
                        });
                      },

  searchUsers: query => {return $.ajax({
                          type: 'get',
                          url: '/users/search',
                          dataType: 'json',
                          data: {'query':query},
                          success: (data) => console.log(data ),
                          error: (e) => console.log(e)
                        });
                      },
  createTweet: tweet => {return $.ajax({
                          type: 'post',
                          url: '/tweets',
                          dataType: 'json',
                          data: tweet,
                          success: (data) => console.log(data),
                          error: (e) => console.log(e)
                        });
                      }


};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);
const FollowToggle = __webpack_require__(1);

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


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

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


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map