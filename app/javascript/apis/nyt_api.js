const nyt = document.getElementById("nyt");

 const callNytApi = () => {

   if (nyt) {
     fetch("https://api.nytimes.com/svc/topstories/v2/home.json?api-key=dlhLwAV19TVntyHf796mfDOXhXA0xkJH")
     .then(response => response.json())
     .then((data) => {
       const firtsFourResults = data["results"].slice(0, 4);
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
  const infosHtml = ``
 };

 export { callNytApi };
