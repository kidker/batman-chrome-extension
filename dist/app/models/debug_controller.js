// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Batbelt.DebugController = (function(_super) {
    __extends(DebugController, _super);

    function DebugController() {
      _ref = DebugController.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    DebugController.resourceName = 'debug_controller';

    DebugController.persist(Batbelt.Storage);

    DebugController.encode('name', 'action', 'path', 'current');

    return DebugController;

  })(Batman.Model);

}).call(this);
