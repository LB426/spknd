jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
	$("#post_razdel").attr("disabled","disabled");
	$("#post_category").change(function() {
		var category = $("option:selected", this).val();
		if (category == '0') {
			$("#post_razdel").empty();
			$("#post_razdel").prepend( $('<option value="0">выберите раздел</option>'));
			$("#post_razdel").attr("disabled","disabled");
		}else{
			if (category == '1') {
				if ($("#form_nedw").css("display") == "none") {
				$("#form_nedw").slideToggle("slow");}
			} else {
				if ($("#form_nedw").css("display") == "block") {
				$("#form_nedw").slideToggle("slow");}
				$("#form_nedw").css("display","none");
			}
			
			$("#post_razdel").empty();
			$("#post_razdel").prepend( $('<option value="0">выберите раздел</option>'));
			$("#post_razdel").attr("disabled","");
			$("#post_razdel :first").attr("selected", "selected");
			$.getJSON('/posts/new/' + category, function(data) {
				$.each(data, function(i,item){
					$("#post_razdel").append( '<option value="'+ item.catandrazd.razd_id + '">' + item.catandrazd.razdel + '</option>' );
				});
			});
		}
		return false;
	});
})
