// This file assists with the random theme on page load.
// The rest is done in source/stylesheets/_colors.scss.

window.onload = function() {
	// Get the total number of colors from the CSS Vars
	var colorsCount = getComputedStyle(document.body).getPropertyValue('--count');

	// Generate a random number
	var randomTheme = randomInteger(1, colorsCount);

	// Capture all themed elements
	var elements = document.getElementsByClassName('bg-blue');

	// Add theme class to all themed elements
	for (i = 0; i < elements.length; i++) {
		elements[i].classList.add('theme-' + randomTheme);
	}
}

// https://stackoverflow.com/a/29246176/
function randomInteger(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
}
