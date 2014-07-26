UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

Meteor.call("isAdmin", function(error, result) {
	if (error)
		Session.set("admin", false);
	else
		Session.set("admin", result);
});

UI.registerHelper("isAdmin", function() {
	return Session.get("admin");
});
