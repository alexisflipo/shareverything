 const change_buttons_color = () => {
  let button2 = document.querySelector("#sender_days_2")
  let button3 = document.querySelector("#sender_days_3")
  let button4 = document.querySelector("#sender_days_4")
  let buttons = [button2, button3, button4]

  buttons.forEach(button =>
    button.addEventListener("click", addActive)
  )
  function addActive(element) {
    element = this;
  if (element.classList.contains('active')) {
    element.classList.remove('active');
  } else {
    buttons.forEach(function(e) {
      e.classList.remove('active');
    });
    element.classList.add('active');
  }
  }
}
export { change_buttons_color };
