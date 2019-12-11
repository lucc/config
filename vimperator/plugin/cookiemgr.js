
// Cookie manager functions.  A plugin by luc.

function CurrentDomain() {
  return buffer.URL.toString().split('://')[1].split('/')[0]
}
function ListCookiesForCurrentDomain() {
  // See https://developer.mozilla.org/en-US/Add-ons/Code_snippets/Cookies for
  // upstream documentation.
  let enum_x = Services.cookies.getCookiesFromHost(CurrentDomain());
  while (enum_x.hasMoreElements()) {
    var cookie = enum_x.getNext().QueryInterface(Ci.nsICookie2);
    dump(cookie.host + ";" + cookie.name + "=" + cookie.value + "\n");
  }
}
