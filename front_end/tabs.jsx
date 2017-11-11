import React from 'react';

class Tab extends React.Component {
  constructor({tabArr}) {
    super();
    this.state = {tabArr, selected: 0 };
  }

  componentDidMount(){
    document.querySelector(".tabs li").className += "selected";
  }

  render() {
    return(
      <header className="tabs">
        <ul>
          {this.state.tabArr.map((el, idx)=>(
            <li onClick={(e)=>this.selectTab(idx, e)}>{el.title}</li>
          ))}
        </ul>
        <article>
          {this.state.tabArr[this.state.selected].content}
        </article>
      </header>
    );
  }

  selectTab(idx, e) {
    this.setState({selected: idx});
    document.querySelector(".selected").className = "";
    e.currentTarget.className += "selected";
  }

}

export default Tab;
