// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Batbelt.DashboardController = (function(_super) {
    __extends(DashboardController, _super);

    function DashboardController() {
      _ref = DashboardController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    DashboardController.prototype.routingKey = 'dashboard';

    DashboardController.prototype.show = function(params) {
      var dash;

      this.set('dashboard', dash = new Batbelt.Dashboard);
      Batbelt.AppController.load(this.errorHandler(function(controllers) {
        return dash.set('controllers', controllers);
      }));
      Batbelt.AppModel.load(this.errorHandler(function(models) {
        return dash.set('models', models);
      }));
      return Batbelt.AppView.load(this.errorHandler(function(views) {
        return dash.set('views', views);
      }));
    };

    return DashboardController;

  })(Batman.Controller);

}).call(this);
