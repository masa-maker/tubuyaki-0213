window.addEventListener('load', function (){
  const topStr = document.getElementById("top-str")
  topStr.addEventListener('mouseover', function(){
    const box = document.getElementById("box")
    box.setAttribute("style", "background-color: rgba(255, 255, 255, 1);")
    const Str = document.getElementById("str").innerText = "Welcome"

  })

  topStr.addEventListener('mouseout', function(){
    box.removeAttribute("style", "background-color: rgba(255, 255, 255, 1);")
    const Str = document.getElementById("str").innerText = "Tubuyaki"
  })
})