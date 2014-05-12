$(document).ready(function(){
	$("#tagcloud a").tagcloud();
	   
	$('#tagForm').submit(function() {
	  $("#tagcloud a").tagcloud({
      size: {
        start: parseInt($('#minFont').val()), 
        end: parseInt($('#maxFont').val()), 
        unit: $('#unit').val()
      }, 
      color: {
        start: "#"+$('#startColour').val(), 
        end: "#"+$('#endColour').val()
      }
    })
  return false;
  })
})
   
