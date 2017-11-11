const DOMNodeCollection = require('./dom_node_collection');

Window.prototype.$l = function (...arg) {
  if (arg[0] instanceof Function){
    let fxns = arg;
    window.onload = ()=>{
      fxns.forEach( (fx)=>fx() );
    };
  }else if (arg instanceof HTMLElement) {
    let dom = new DOMNodeCollection([arg[0]]);
    return dom;
  } else {
    let nodes = document.querySelectorAll(arg[0]);
    let nodesArr = Array.from(nodes);
    let dom = new DOMNodeCollection(nodesArr);
    return dom;
  }

};

$l.extend = function(...objs){
  let newObj = {};
  objs.forEach((obj)=>{
    let keys = Object.keys(obj);
    keys.forEach((key)=>{
      newObj[key] = obj[key];
    });
  });
  return newObj;
};


$l.ajax = function(userParams){
  const defaultParams = {
    url: '',
    success: ()=> {console.log("SUCCESS");},
    error: ()=> {console.log("ERROR");},
    method: 'GET',
    data: '',
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8'
  };
  let params = $l.extend(defaultParams, userParams);
  const xhr = new XMLHttpRequest();
  xhr.open(params['method'], params['url']);
  xhr.onload = function(){
    debugger
    if(xhr.status === 200){
      params['success'](xhr.response);
    }else{
      params['error'](xhr.response);
    }
  };

  // xhr.send(params['data']);

};




window.$l = $l;
