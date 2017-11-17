import React from "react";
import {withRouter } from 'react-router-dom';

class CreatePokemonForm extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      name: "",
      attack: "",
      defense: "",
      poke_type: "fire",
      moves: "",
      image_url: ""
    };
    this.TYPES = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel'
    ];
    this.handleUpdate = this.handleUpdate.bind(this);
  }

  handleUpdate(e){
    let name = e.currentTarget.name;
    this.setState({[name]: e.currentTarget.value});
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.createPokemon({pokemon: this.state})
      .then(pokemon => {
        let id = Object.keys(pokemon.pokemon)[0];
        console.log(`/pokemon/${id}`);
        this.props.history.push(`/pokemon/${id}`);
      }
    );
  }
  render(){
    return (
      <div>
        <ul className = "errors">
          {this.props.errors.map(error => (
            <li>{error}</li>
          ))}
        </ul>
        <h1>Create Pokemon</h1>
        <label>Name:</label>
        <input type = "text" onChange ={this.handleUpdate}
               value = {this.state.name} name="name"/><br/>
        <label>Attack:</label>
        <input type = "number" onChange ={this.handleUpdate}
               value = {this.state.attack} name="attack"/><br/>
        <label>Defense:</label>
        <input type = "number" onChange ={this.handleUpdate}
               value = {this.state.defense} name="defense"/><br/>
        <label>Type:</label>
        <select name= "poke_type" onChange ={this.handleUpdate}>
          {this.TYPES.map((type)=>(
            <option key = {type} value = {type}>{type}</option>
          ))}
        </select><br/>
        <label>Moves:</label>
        <input type = "text" onChange ={this.handleUpdate}
               value = {this.state.moves} name="moves"/><br/>
        <label>Image:</label>
        <input type = "text" onChange ={this.handleUpdate}
               value = {this.state.image_url} name="image_url"/><br/>
             <button onClick={this.handleSubmit.bind(this)}>Create Pokemon</button>
      </div>
    );
  }
}

export default withRouter(CreatePokemonForm);
