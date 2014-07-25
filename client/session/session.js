Template.loginButton.events({
	"click": function(event, template) {
		event.preventDefault();
		
		Meteor.loginWithGoogle({
			requestPermissions: ["email",
								 "https://www.googleapis.com/auth/admin.directory.group.readonly"]
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
