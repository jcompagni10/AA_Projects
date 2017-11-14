import React from 'react';

export class TodoForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {title: '', body: ''};
    this.handleSubmit = this.handleSubmit.bind(this);
    this.receiveTodo = props.receiveTodo;
    this.handleInputChange = this.handleInputChange.bind(this);
  }

  uniqueId(){
    return new Date().getTime();
  }

  handleInputChange(e){
    console.log(e.currentTarget.value);
    this.setState({[e.currentTarget.id]: e.currentTarget.value});
    console.log(this.state.title);
  }
  handleSubmit(e){
    e.preventDefault();
    let newTodo = {
      title: this.state.title,
      body: this.state.body,
      id: this.uniqueId(),
      done: false
    };
    this.receiveTodo(newTodo);
    this.setState({title: '', body: ''});
  }

  render(){
    return(
      <form >
        <label>
          Title:
          <input type="text" id="title"
                 onChange = {this.handleInputChange}
                 value={this.state.title}
                 placeholder="what do you want to do" />
        </label>
        <br/>
        <label>
          Body:
          <textarea id="body"
                    placeholder="description.."
                    onChange = {this.handleInputChange}
                    value ={this.state.body}>
          </textarea>
        </label>
        <br/>
        <input type="submit" onClick ={this.handleSubmit} value="Submit"/>
      </form>
    );
  }
}
