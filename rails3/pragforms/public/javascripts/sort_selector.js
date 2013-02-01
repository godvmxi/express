/***
 * Excerpted from "Agile Web Development with Rails, 3rd Ed.",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
***/
var SortSelector = Class.create();
Object.extend(SortSelector.prototype, {
  form: 'form',
  field: 'form_sort',
  selectorClass: 'sortSelector',
  initialize: function(opts) {
    Object.extend(this, opts);
    $$('.' + this.selectorClass).each((function(item) {
      text = item.innerHTML;
      item.innerHTML = "";
      item.appendChild(this.makeLink(text));
    }).bind(this));
  },
  makeLink: function(text) {
    var s = document.createElement("a");
    s.href = "javascript:void(0)";
    s.onclick = (function() {
      this.updateForm(text);
    }).bind(this);
    s.innerHTML = text;
    return s;
  },
  updateForm: function(text) {
    var h = $(this.field);
    if (!h) {
      h = document.createElement("input");
      h.id = this.field;
      h.type = 'hidden';
      $(this.form).appendChild(h);
      h.value = [text,"ASC"].join();
      return h.value;
    }
    var last = h.value.split(",");
    if (last[0] == text) {
      h.value = [text, (last[1] == 'ASC') ? 'DESC' : 'ASC'].join();
    } else {
      h.value = [text, "ASC"].join()
    }
    return h.value;
  }
})