Template.loginButton.events({
	"click": function(event, template) {
		event.preventDefault();
		
		Meteor.loginWithGoogle({
			requestPermissions: ["email",
			                     "https://www.googleapis.com/auth/admin.directory.group.readonly",
			                     "https://www.googleapis.com/auth/admin.directory.user.readonly"],
			requestOfflineToken: true
		}, function (error) {
			if (error)
				alert(error);
		});
	}
});

Template.logoutButton.events({
	"click": function(event, template) {
		event.preventDefault();

		Meteor.logout(function(error) {
			if (error)
				alert(error);
		});
	}
});
