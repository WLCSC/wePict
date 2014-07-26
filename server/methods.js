Meteor.methods({
	getAccessToken: function() {
		try {
			return Meteor.user().services.google.accessToken;
		} catch (e) {
			return null;
		}
	},
	
	isAdmin: function() {
		this.unblock();

		try {
			var result_data = HTTP.get("https://www.googleapis.com/admin/directory/v1/groups", {
				headers: {
					"Authorization": "Bearer " + Meteor.call('getAccessToken')
				},
				params: {
					domain: "wl.k12.in.us",
					customer: "my_customer"
				}
			}).data;

			console.log(result_data);

			for (var i = 0; i < result_data.groups.length; i++)
				if (result_data.groups[i].email == "TechnologyStaff@wl.k12.in.us")
					return true;

			return false;
		} catch (e) {
			console.log(e);
			return false;
		}
	}
});
