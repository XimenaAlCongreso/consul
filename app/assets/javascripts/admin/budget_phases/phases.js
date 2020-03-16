(function() {
  "use strict";
  App.AdminBudgetPhases = {
    initialize: function() {
      App.AdminBudgetPhases.toggleEnable();
    },
    toggleEnable: function() {
      var check_boxes = $(".admin #budget-phases-table [name='phase[enabled]']");
      $(check_boxes).on({
        change: function() {
          $.ajax({ url: this.dataset.url, type: "PATCH" });
        }
      });
    },
  };
}).call(this);
