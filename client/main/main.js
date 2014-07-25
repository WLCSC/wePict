Handlebars.registerHelper("setTitle", function() {
	var title = "";
	
	for (var i = 0; i < arguments.length - 1; i++) {
		title += arguments[i];
	}
	
	document.title = title;
});

Handlebars.registerHelper("isAdmin", function() {
	return Meteor.call("isAdmin");
});
