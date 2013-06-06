// Generated by CoffeeScript 1.6.3
var _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Batbelt.AppModelsController = (function(_super) {
  __extends(AppModelsController, _super);

  function AppModelsController() {
    _ref = AppModelsController.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  AppModelsController.prototype.routingKey = 'app_models';

  AppModelsController.prototype.index = function() {
    var _this = this;
    return Batbelt.AppModel.load(this.errorHandler(function(models) {
      return _this.set('models', models);
    }));
  };

  AppModelsController.prototype.show = function(params) {
    var _this = this;
    return Batbelt.AppModel.find(params.id, this.errorHandler(function(model) {
      return _this.set('model', model);
    }));
  };

  return AppModelsController;

})(Batman.Controller);
