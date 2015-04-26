// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require bootbox

myCustomConfirmBox = function(message, callback) {
	var options;
	options = [{
		'label': 'Yes, Definitely',
		'class': 'btn-danger',
		'callback': function() {
			if (typeof callback === 'function') {
				return callback();
			}
		}
	}, {
		'label': 'Opss! No',
		'class': 'btn-success'
	}];
	return bootbox.dialog(message, options);
};

$.rails.allowAction = function(element) {
	var answer, callback, message;
	message = element.data("confirm");
	if (!message) {
		return true;
	}
	answer = false;
	callback = void 0;
	if ($.rails.fire(element, "confirm")) {
		myCustomConfirmBox(message, function() {
			var oldAllowAction;
			callback = $.rails.fire(element, "confirm:complete", [answer]);
			if (callback) {
				oldAllowAction = $.rails.allowAction;
				$.rails.allowAction = function() {
					return true;
				};
				element.trigger("click");
				return $.rails.allowAction = oldAllowAction;
			}
		});
	}
	return false;
};
