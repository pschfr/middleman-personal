// Localized weekday names, adapted from https://twitter.com/wesbos/status/1067534197903056901
var days = Array.from({ length: 7 }, (x, index) => (
	new Date(0, 0, index).toLocaleDateString('en-US', { weekday: 'long' })
));

document.getElementById('day').innerHTML = days[new Date().getDay()];
