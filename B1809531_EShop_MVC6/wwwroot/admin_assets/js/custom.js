﻿ function showPreview(event){
  if(event.target.files.length > 0){
    var src = URL.createObjectURL(event.target.files[0]);
    var preview = document.getElementById("file-ip-1-preview");
    preview.src = src;
    preview.style.display = "block";
  }
}

function cleanImageFile(id) {
    document.getElementById(id).value = "";
    var preview = document.getElementById("file-ip-1-preview");
    preview.src = "";
}

function hideShowProductDetail(){
    var element = document.getElementById("product-describe");
    var state = element.style.display;
    if (state == "") {
        element.style.display = "block";
    }
    else {
        element.style.display = "";
    }
}