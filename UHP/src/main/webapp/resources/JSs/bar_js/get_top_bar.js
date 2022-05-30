/**
 * 
 */
window.onload=get_top_bar();
		function get_top_bar(){
			$.ajax({ 
			type: 'get' , 
			url: 'top_bar' , 
			success: function(data) { 
				$("#top_bar").html(data); 
				} 
			}); 
		}
	