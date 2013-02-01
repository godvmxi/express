/***
 * Excerpted from "Agile Web Development with Rails, 3rd Ed.",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
***/
InputValidator = Class.create();
Object.extend(InputValidator.prototype, {
  form: "form",
  initialize: function (options) {
    Object.extend(this,options);
    var temp = $(this.form).action.split("/").slice(0,-1);
    temp.push("validate");
    this.validateAction = temp.join("/");
    $A($(this.form).getElementsByTagName("input")).each((function(e) {
      if (e.type == "text") {
        var validator = this.validatorForElement(e);
        if (validator) {
          Event.observe(e, "blur", validator.bind(this));
        }
      }
    }).bind(this));
  },
  validatorForElement: function(e) {
    return function() {
      //codecite Ajax.Request
      new Ajax.Request(this.validateAction, {
        method: 'get',
        parameters: e.name + "=" + e.value,
        onSuccess: (function(req) {
          this.reportValidation(e, req.responseText);
        }).bind(this),
        onFailure: function(req) {alert(req.responseText)},
        onException: function(t,e) {alert(e);}
      }); 
      //codecite Ajax.Request
    }    
  },
  removeOldValidation: function (el) {
    var sib = el.nextSibling;
    if (sib && Element.hasClassName(sib, "errorExplanation")) {
      Element.remove(sib);
    }
  },
  reportValidation: function(el, resp) {
    this.removeOldValidation(el);
    if (resp && (/\S/).test(resp)) {
      new Insertion.After(el, "<span class='errorExplanation'>" + resp + "</span>");
    }
  }
});