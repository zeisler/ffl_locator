function getGeoLocation() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}

function setGeoCookie(position) {
  var cookie_val = position.coords.latitude + "," + position.coords.longitude;
  document.cookie = "coordinates=" + escape(cookie_val);
  $('.near_location').append($('<form class="ajax" action="/dealers/near/'+cookie_val+'"><button class="btn">Find Dealers near you</button></form>'));
}
