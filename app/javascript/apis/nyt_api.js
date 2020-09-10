const nyt = document.getElementById("nyt");

const callNytApi = () => {

  if (nyt) {
    fetch("https://api.nytimes.com/svc/topstories/v2/home.json?api-key=dlhLwAV19TVntyHf796mfDOXhXA0xkJH")
    .then(response => response.json())
    .then((data) => {
      const firtsTenResults = data["results"];
      console.log(firtsTenResults);
    });

  }
}

export { callNytApi };
