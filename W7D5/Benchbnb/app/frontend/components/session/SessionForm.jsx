import React from 'react';
import {Link} from 'react-router-dom';

class SessionForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      username: '',
      password: ''
    };
  }

  handleInput(e){
    const type = e.target.getAttribute('name');
    this.setState({[type]: e.target.value});
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.action({user: this.state});
  }

  typeText(){
    return (this.props.formType === "signup") ? "Sign Up" : "Log In";
  }

  reverseTypeText(){
    return (this.props.formType !== "signup") ? "Sign Up" : "Log In";
  }
  otherSessionForm(){
    return (this.props.formType !== "signup") ? "/signup" : "/login";
  }

  render(){
    return(
      <div>
        <h1> {this.typeText()}</h1>
        <form>
          <label>username:
            <input type="text"
                   name="username"
                   value={this.props.username}
                   onChange ={this.handleInput.bind(this)}/>
         </label>
          <label>password:
            <input type="password"
                   name="password"
                   value={this.props.password}
                   onChange ={this.handleInput.bind(this)}/>
         </label>
         <button onClick= {this.handleSubmit.bind(this)}>
           {this.typeText()}
         </button>
        </form>
        <h2> OR</h2>
        <Link to={this.otherSessionForm()}>
          {this.reverseTypeText()}
        </Link>
      </div>
    );
  }
}

export default SessionForm;
