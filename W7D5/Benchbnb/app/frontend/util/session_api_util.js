
export const postUser = (formUser) =>(
  $.ajax({
    method: 'POST',
    url: 'api/users',
    data: formUser
  })
);

export const loginUser = (formUser) =>(
  $.ajax({
    method: 'POST',
    url: 'api/session',
    data: formUser
  })
);

export const logoutUser = () =>(
  $.ajax({
    method: 'DELETE',
    url: 'api/session',
  })
);
