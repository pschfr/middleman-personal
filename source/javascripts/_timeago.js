//= require timeago.js.js

// Creates the timeago instance, and collects all <time> elements.
var timeagoInstance = timeago(),
	nodes = document.getElementsByTagName('time');

// Converts them all!
timeagoInstance.render(nodes);
