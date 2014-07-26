UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

Ember.ObjectController.extend({
	isAdmin: (function() {
		return Meteor.call("isAdmin");
	}).property()
});
