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
		google: ["openid",
		         "email",
		         "https://www.googleapis.com/auth/admin.directory.group",
		         "https://www.googleapis.com/auth/admin.directory.user"]
	},
	requestOfflineToken: {
		google: true
	}
});
