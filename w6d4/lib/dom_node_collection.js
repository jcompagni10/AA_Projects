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
