const addCsrf = object => {
  const token = document.querySelector('meta[name=csrf-token]').content;
  const key = document.querySelector('meta[name=csrf-param]').content;
  object[key]=token;
  return object;
};

export const fetchArticles = async () => {
  const response = await fetch('/articles', {
    headers: {
      'Content-Type': "application/json",
      Accept: "application/json",
    },
  });
  const articles = await response.json();
  return articles;
};

export const addArticle = async () => {
  const reponse = await fetch('/articles', {
    headers: {
      'Content-Type': "application/json",
      Accept: "application/json",
    },
    method: 'POST',
    body: JSON.stringify(addCsrf({article:{content }})),
  });
  const article = await response.json();
  return article.article;
};
