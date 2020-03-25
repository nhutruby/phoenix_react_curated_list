import React from "react"
import axios from "axios"
class Form extends React.Component {
  constructor() {
    super()
    this.state = {
      title: "",
      subtitle: "",
      image: "",
      link: "",
      author: ""
    }
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleTitle = this.handleTitle.bind(this)
    this.handleSubtitle = this.handleSubtitle.bind(this)
    this.handleImage = this.handleImage.bind(this)
    this.handleLink = this.handleLink.bind(this)
    this.handleAuthor = this.handleAuthor.bind(this)
  }
  handleSubmit(event) {
    event.preventDefault()
    axios.post("http://localhost:4000/api/blogs", {
      headers: { "Content-Type": "application/json" },
      blog: {
        title: this.state.title,
        subtitle: this.state.subtitle,
        image: this.state.image,
        link: this.state.link,
        author: this.state.author
      }
    })
  }
  handleTitle(event) {
    console.log(event.target.value)
    this.setState({ title: event.target.value })
  }
  handleSubtitle(event) {
    this.setState({ subtitle: event.target.value })
  }
  handleImage(event) {
    this.setState({ image: event.target.value })
  }
  handleLink(event) {
    this.setState({ link: event.target.value })
  }
  handleAuthor(event) {
    this.setState({ author: event.target.value })
  }
  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <div className="field">
          <label className="label">Title</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.title}
              onChange={this.handleTitle}
            />
          </div>
        </div>
        <div className="field">
          <label className="label">Subtitle</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.subtitle}
              onChange={this.handleSubtitle}
            />
          </div>
        </div>
        <div className="field">
          <label className="label">Image</label>
          <div className="control">
            <input
              className="input"
              type="text"
              placeholder="Enter Image URL"
              value={this.state.image}
              onChange={this.handleImage}
            />
          </div>
        </div>
        <div className="field">
          <label className="label">Link</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.link}
              onChange={this.handleLink}
            />
          </div>
        </div>
        <div className="field">
          <label className="label">Author</label>
          <div className="control">
            <input
              className="input"
              type="text"
              value={this.state.author}
              onChange={this.handleAuthor}
            />
          </div>
        </div>
        <button type="submit" value="Submit" className="button is-primary">
          Submit
        </button>
      </form>
    )
  }
}
export default Form
