Meteor.methods({
	getAccessToken: function() {
		try {
			return Meteor.user().services.google.accessToken;
		} catch (e) {
			return null;
		}
	},

	getEmail: function() {
		try {
			return Meteor.user().services.google.email;
		} catch (e) {
			return null;
		}
	},
	
	isAdmin: function() {
		this.unblock();

		try {
			var result_data = HTTP.get("https://www.googleapis.com/admin/directory/v1/groups", {
				headers: {
					"Authorization": "Bearer " + Meteor.call("getAccessToken")
				},
				params: {
					userKey: Meteor.call("getEmail")
				}
			}).data;

			for (var i = 0; i < result_data.groups.length; i++)
				if (result_data.groups[i].email == "TechnologyStaff@wl.k12.in.us")
					return true;

			return false;
		} catch (e) {
			return false;
		}
	},

	render: function(template) {
		return Handlebars.templates["adminMainButtons"]({
			isAdmin: Meteor.call("isAdmin")
		});
	}
});
