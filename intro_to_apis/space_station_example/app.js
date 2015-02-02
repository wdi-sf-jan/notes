console.log("calling for ISS location data...");

$.getJSON("http://api.open-notify.org/iss-now.json", function (data) {
  console.log("data from space", data);
});
