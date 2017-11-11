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
