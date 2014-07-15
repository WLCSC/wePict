// Questions are embedded in banks.
Banks = new Meteor.Collection("banks");
Groups = new Meteor.Collection("groups");
Memberships = new Meteor.Collection("memberships");
Posts = new Meteor.Collection("posts");
// Assignments are embedded in rooms.
Rooms = new Meteor.Collection("rooms");

if (Meteor.isClient) {
	Template.hello.greeting = function () {
		return "Welcome to wePict.";
	};

	Template.hello.events({
		'click input': function () {
			// template data, if any, is available in 'this'
			if (typeof console !== 'undefined')
				console.log("You pressed the button");
		}
	});
}

if (Meteor.isServer) {
	Meteor.startup(function () {
		// code to run on server at startup
	});
}
