/***
 * Excerpted from "Agile Web Development with Rails, 3rd Ed.",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
***/
// Modifies Prototype so that Ajax requests ask permission to go cross-site.
// Useful for pages that are run from the local filesystem.
CrossSite = {
  wrap: function(original) {
    return function() {
      try {
       netscape.security.PrivilegeManager.enablePrivilege("UniversalBrowserRead");
      } catch (e) {
        //alert("caught " + e);
      }
      original.apply(this, arguments);
    }
  }
}
Ajax.Request.prototype.initialize = CrossSite.wrap(Ajax.Request.prototype.initialize);
Ajax.Request.prototype.onStateChange = CrossSite.wrap(Ajax.Request.prototype.onStateChange);
Ajax.Updater.prototype.initialize = CrossSite.wrap(Ajax.Updater.prototype.initialize);