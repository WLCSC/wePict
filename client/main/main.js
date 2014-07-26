UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});
