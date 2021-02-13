if (location.pathname.match("lists/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const InputElement = document.getElementById("lists_tag_name");
    InputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("lists_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = ()=>{
        const tagName = XHR.response.keyword;
        const searchResult = document.getElementById("search"); //タグ表示の為にseachIDを取得
        searchResult.innerHTML = ""; //タグ入力が消えるたびに表示も消える
        tagName.forEach((tag) => { //forEachで繰り返し処理
          const childElement = document.createElement("div"); //createElementでタグを表示させるための要素生成
          childElement.setAttribute("class", "child");
          childElement.setAttribute("id", tag.id);
          childElement.innerHTML = tag.name;
          searchResult.appendChild(childElement); //要素を追加し、Web上に表示してくれる
          const clickElement = document.getElementById(tag.id);
          clickElement.addEventListener("click", () => {
            document.getElementById("lists_tag_name").value = clickElement.textContent;
            clickElement.remove();
          });
        });
      }
    });
  });
};