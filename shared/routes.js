Router.configure({
	layoutTemplate: "main",
	loadingTemplate: "loading"
});

Router.map(function() {
	this.route("welcome", {path: "/"});
	this.route("loginButton", {path: "/login"});
});
