// Questions are embedded in banks.
Banks = new Meteor.Collection("banks");
Groups = new Meteor.Collection("groups");
Memberships = new Meteor.Collection("memberships");
Posts = new Meteor.Collection("posts");
// Assignments are embedded in rooms.
Rooms = new Meteor.Collection("rooms");

if (Meteor.isClient) {
	// Client code, such as template stuff
}

if (Meteor.isServer) {
	Meteor.startup(function () {
		// code to run on server at startup
	});
}
