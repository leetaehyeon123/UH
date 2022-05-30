/**
 * 
 */
var on=0;
		
		function get_search_bar(thiss){
			if($("#search_combo").val()=="board"){
				var str=$("#search_input").val();
				$.ajax({ 
					type: 'get' , 
					url: 'search_bar?search_str='+str , 
					success: function(data) {
						on=1;
						$("#search_bar").html(data); 
						$("#search_bar").css("display","block");
						} 
					});
			}
		}
		
		$('html').click(function(e) { 
			if((!$(e.target).hasClass("search_bar"))&&$("#search_bar").css("display")=="block"&&(!$(e.target).hasClass("search_input"))) { 
				$("#search_bar").css("display","none");
				} 
			if(on==1&&$("#search_bar").css("display")=="none"&&$(e.target).hasClass("search_input")&&$("#search_combo").val()=="board") { 
				$("#search_bar").css("display","block");
				} 
			
		});
		
	/*	콤보박스를 게시판으로 했을때에는 검색창에서 엔터를 눌르면 서브밋이 발동되지 않게하는 메서드*/
		function isBoard(){
			if($("#search_combo").val()=="board"){
				return false;
			}
			return true;
		}
		
