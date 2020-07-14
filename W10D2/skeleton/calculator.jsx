import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {num1: '', num2: '', result: 0}
  }

  setNum1(e) {
    e.preventDefault();
    let val1 = parseInt(e.target.value);
    this.setState({ num1: val1 });
  }

  setNum2(e) {
    e.preventDefault();
    let val2 = parseInt(e.target.value);
    this.setState({ num2: val2 });
  }

  add(e) {
    e.preventDefault();
    let addition = this.state.num1 + this.state.num2;
    this.setState({ result: addition });
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
            <form>
                <input value={this.state.num1} onChange={this.setNum1.bind(this)}></input>
                <input value={this.state.num2} onChange={this.setNum2.bind(this)}></input>
                <button onClick={this.add.bind(this)}>+</button>
            </form>
      </div>
    );
  }
}

export default Calculator;