// Assignments are embedded in rooms.
Rooms = new Meteor.Collection("rooms");

Meteor.publish("rooms", function() {
	return Rooms.find({});
});
