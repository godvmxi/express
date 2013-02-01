/***
 * Excerpted from "Agile Web Development with Rails, 3rd Ed.",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material, 
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose. 
 * Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
***/
Droppables.add("pending_todos", {
  accept:'completed_todo', 
  hoverclass:'hover', 
  onDrop:function(element){
    new Ajax.Request('/user/todo_pending/236', {
      asynchronous:true, 
      evalScripts:true, 
      parameters:'todo=' + encodeURIComponent(element.id.split('_').last())
    });
  }
});
