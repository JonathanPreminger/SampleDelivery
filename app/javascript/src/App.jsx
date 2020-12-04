import React, {Component} from 'react';
import { fetchArticles } from './APIs/articles';
import { addArticle } from './APIs/articles';


export class App extends Component {
  state = {
    articles: [],
  };
  refreshArticleCount = async () => {
    const articles = await fetchArticles();
    this.setState({
      articles: articles.articles,
      value: ""
    })
  }

  handleChange = e => {
    this.setState({
      value: e.target.value,
    })
  }

  handleSubmit = async e => {
    e.preventDefault();
    const newArticle = await addArticle(this.state.value);
    this.setState({
      articles: [newArticle, ...this.state.articles],
    })
  }

  componentDidMount = async () => {
    await this.refreshArticleCount();
  }
  render () {
    return (
    <div>
      <p> bonjour unknown ArticleCount : {this.state.articles.length}</p>
      <div style={{'marginTop':'60px'}}>
        <form onSubmit={this.handleSubmit}>
          <label htmlFor="text" className="text-label" style={{display:'block','marginRight':'500px'}}>
            <input type="text" name="text" id="text" onChange={this.handleChange} className="" placeholder="Titre de l'article"/>
          </label>
          <input type="submit" value="Article!"/>
        </form>
      </div>
      <div style={{'marginTop':'60px'}}>
        {this.state.articles.map(article => {return article.title})}
      </div>
    </div>)
  }
}

export default App;
