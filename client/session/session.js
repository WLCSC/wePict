Template.loginForm.events({
	"submit #login-form": function(event, template) {
		event.preventDefault();
		
		Meteor.loginWithGoogle(function (error) {
			if (error)
				alert(error);
		});
	}
});

Template.logoutForm.events({
	"submit #logout-form": function(event, template) {
		event.preventDefault();

		Meteor.logout(function(error) {
			if (error)
				alert(error);
		});
	}
});
