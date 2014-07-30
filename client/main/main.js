UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

Meteor.call("render", "adminMainButtons", function(error, result) {
	Session.set("adminMainButtons", error ? "" : result);
});

UI.registerHelper("adminMainButtons", function() {
	return Session.get("adminMainButtons");
});
