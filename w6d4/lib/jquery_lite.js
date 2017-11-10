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

const DOMNodeCollection = __webpack_require__(1);

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


/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection {
  constructor(array) {
    this.array = array;
  }

  html(arg){
    if (arg === undefined) {
      return this.array[0].innerHTML;
    } else {
      this.array.forEach((el)=>{
        el.innerHTML = arg;
      });
    }
  }

  empty(arg){
    this.array.forEach((el)=>{
      el.innerHTML = '';
    });
  }

  append(arg){
    if (arg instanceof HTMLElement ){
      this.array.forEach((el)=>{
        el.append(arg);
      });
    }else if(typeof arg ==='string'){
      this.array.forEach((el)=>{
        el.append(arg);
      });
    }else if (arg.constructor.name === "DOMNodeCollection"){
      arg.array.forEach((el)=>{
        this.array.forEach((node)=>{
          node.append(el.cloneNode(true));
        });
      });
    }
  }

  attr(attribute, value){
    if (value === undefined){
      return this.array[0].getAttribute(attribute);
    } else{
      this.array.forEach((el)=>{
        el.setAttribute(attribute, value);
      });
    }
  }

  addClass(classNames){
    this.array.forEach((el)=>{
      classNames.split(" ").forEach((className) =>{
        el.classList.add(className);
      });
    });
  }

  removeClass(classNames){
    this.array.forEach((el)=>{
      classNames.split(" ").forEach((className) =>{
        el.classList.remove(className);
      });
    });
  }

  children(){
    return this.array[0].childNodes;
  }

  parent(){
    return this.array[0].parentNode;
  }

  find(element){
    let found = [];
    this.array.forEach((el)=>{
      el.querySelectorAll(element);
      found.push(el.querySelectorAll(element));
    });
    return found;
  }

  remove(){
    this.array.forEach((el)=>{
      el.remove();
    });
  }

  on(event, fxn){
    this.array.forEach((el)=>{
      el.addEventListener(event, fxn);
    });
  }

  off(event, fxn){
    this.array.forEach((el)=>{
      el.removeEventListener(event, fxn);
    });
  }

}

module.exports = DOMNodeCollection;


/***/ })
/******/ ]);