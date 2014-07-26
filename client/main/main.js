UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

// The string that is used for admin in the session should ideally
// change on a daily basis to keep the enduser from knowing it.
Meteor.call("isAdmin", function(error, result) {
	if (error)
		Session.set("admin", false);
	else
		Session.set("admin", result);
});

UI.registerHelper("isAdmin", function() {
	return Session.get("admin");
});
