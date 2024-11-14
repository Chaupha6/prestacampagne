function setCookie_ow(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}
function getCookie_ow(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}
function checkCookie_ow() {
    var user = getCookie_ow("omegawebmention");
    if (user != "") {
        //alert("Welcome again " + user);
        jQuery("#test_ow_cookies").removeClass("d-block");
        jQuery("#test_ow_cookies").addClass("d-none");
    } else {
        jQuery("#test_ow_cookies").removeClass("d-none");
        jQuery("#test_ow_cookies").addClass("d-block");
    }
}
function set_ow_cookie(){
    setCookie_ow("omegawebmention", "6548732154654", 30);
    jQuery("#test_ow_cookies").removeClass("d-block");
    jQuery("#test_ow_cookies").addClass("d-none");
}

console.log('there');