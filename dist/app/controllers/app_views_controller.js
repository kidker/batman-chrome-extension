// Generated by CoffeeScript 1.6.3
var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Batbelt.AppViewsController = (function(_super) {
  __extends(AppViewsController, _super);

  function AppViewsController() {
    _ref = AppViewsController.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  AppViewsController.prototype.routingKey = 'app_views';

  AppViewsController.prototype.index = function() {
    return Batbelt.AppView.load(this.errorHandler(function(views) {
      return this.set('views', views);
    }));
  };

  AppViewsController.prototype.show = function(params) {
    return Batbelt.AppView.find(params.id, this.errorHandler(function(view) {
      return this.set('view', view);
    }));
  };

  return AppViewsController;

})(Batman.Controller);