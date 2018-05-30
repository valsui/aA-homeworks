import React from 'react';

import GiphysIndex from './giphys_index';


class GiphysSearch extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event){
    this.setState({searchTerm: event.currentTarget.value});
  }

  handleSubmit(event){
    event.preventDefault();
    // this.props.fetchSearchGiphys(this.state).then(() => this.setState({searchTerm: ""}));
    this.props.fetchSearchGiphys(this.state).then((resp) => console.log(resp));
  }


  render(){
    const {giphys} = this.props;
    // console.log(this.props);
    return(
      <div>
        <div>
          Search gif:
          <input onChange={this.handleChange} value={this.state.searchTerm}></input>
          <button onClick={this.handleSubmit}>Click Me</button>
        </div>
        <GiphysIndex giphys = {giphys}/>
      </div>
    )
  }
}

export default GiphysSearch;
