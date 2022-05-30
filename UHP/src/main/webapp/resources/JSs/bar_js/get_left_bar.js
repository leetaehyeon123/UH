/**
 * 
 */
window.onload=get_left_bar();
		function get_left_bar(){
			$.ajax({ 
			type: 'get' , 
			url: 'left_bar' , 
			success: function(data) { 
				$("#left_bar").html(data); 
				} 
			}); 
		}