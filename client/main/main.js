UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

Meteor.call("isAdmin", function(error, result) {
	Session.set("admin", error ? false : result);
});

UI.registerHelper("isAdmin", function() {
	return Session.get("admin");
});

Accounts.ui.config({
	requestPermissions: {
		google: ["email",
		         "https://www.googleapis.com/auth/admin.directory.group.readonly",
		         "https://www.googleapis.com/auth/admin.directory.user.readonly"]
	},
	requestOfflineToken: {
		google: true
	}
});
