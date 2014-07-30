UI.registerHelper("setTitle", function(title) {
	check(title, String);
	
	document.title = title;
});

UI.registerHelper("render", function(file) {
	if (Session.get("render_" + file)) {
		return new Spacebars.SafeString(Session.get("render_" + file));
	} else {
		Meteor.call("render", file, function(error, result) {
			Session.set("render_" + file, error ? "" : result);
		});
	}
});
