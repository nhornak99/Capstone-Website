function navOpen() {
    var x = document.getElementById("myNavbar");
    if (x.className === "navbar") {
        x.className += "collapsed";
    } else {
        x.className = "navbar";
    }
}