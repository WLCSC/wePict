Meteor.methods({
	isAdmin: function() {
		this.unblock();

		try {
			var result_data = HTTP.get("https://www.googleapis.com/admin/directory/v1/groups", {
				params: {
					domain: "wl.k12.in.us",
					customer: "my_customer"
				}
			}).data;

			for (var i = 0; i < result_data.groups.length; i++)
				if (result_data.groups[i].email == "TechnologyStaff@wl.k12.in.us")
					return true;

			return false;
		} catch (e) {
			return false;
		}
	}
});
