// Assignments are embedded in rooms.
Rooms = new Meteor.Collection("rooms");

if (Meteor.isClient) {
	Meteor.subscribe("rooms");
}

if (Meteor.isServer) {
	Meteor.publish("rooms", function() {
		return Rooms.find({});
	});
}
