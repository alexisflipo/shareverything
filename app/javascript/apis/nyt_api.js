const nyt = document.getElementById("nyt");

const callNytApi = () => {

   if (nyt) {
     fetch("https://api.nytimes.com/svc/topstories/v2/home.json?api-key=dlhLwAV19TVntyHf796mfDOXhXA0xkJH")
     .then(response => response.json())
     .then((data) => {
      const firtsFourResults = data["results"].slice(0, 4);
      const title = `
        <h3>Some time ? Read the New-York-Times !</h3>
        <div class="card-articles" id="nyt-articles">
        </div>
      `
      nyt.insertAdjacentHTML("beforeend", title);
       firtsFourResults.forEach((article) => {
          const infos = {
            title: article['title'],
            summary: article["abstract"],
            url: article['url'],
            imgUrl: article["multimedia"][0]["url"],
            imgCopyright: article["multimedia"][0]["copyright"]
          };
          displayArticlesInfos(infos);
       })
     });

   }
 };


 const displayArticlesInfos = (infos) => {
  const nytArticles = document.getElementById("nyt-articles");
  const infosHtml = `
    <div class="card-article">
      <a href="${infos['url']}" target="_blank">
        <img src="${infos['imgUrl']}" alt="Image illustrating the article ${infos['title']}">
        <div class="card-article-infos">
          <p class="copyright">© ${infos['imgCopyright']}</p>
          <h4>${infos['title']}</h4>
          <p>${infos['summary']}</p>
        </div>
      </a>
    </div>
  `

  nytArticles.insertAdjacentHTML("beforeend", infosHtml);
 };

 export { callNytApi };