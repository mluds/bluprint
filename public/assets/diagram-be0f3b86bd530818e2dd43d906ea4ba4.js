$(document).ready(function() {
  
  var graph = new joint.dia.Graph;

  var paper = new joint.dia.Paper({
      el: $('#paper'),
      width: 800,
      height: 480,
      gridSize: 1,
      model: graph
  });

  var erd = joint.shapes.erd;

  var element = function(elm, x, y, label) {
      var cell = new elm({ position: { x: x, y: y }, attrs: { text: { text: label }}});
      graph.addCell(cell);
      return cell;
  };

  var link = function(elm1, elm2) {
      var myLink = new erd.Line({ source: { id: elm1.id }, target: { id: elm2.id }});
      graph.addCell(myLink);
      return myLink;
  };

  $('#entity').click(function() {
    element(erd.Entity, 0, 0, "New Entity");
  });

  $('#relationship').click(function() {
    element(erd.Relationship, 0, 0, "New Relationship");
  });
  
  $('#attribute').click(function() {
    element(erd.Normal, 0, 0, "New Attribute");
  });
});
