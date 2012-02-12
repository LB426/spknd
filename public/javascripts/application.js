jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {
	$("#post_razdel").attr("disabled","disabled");
	$("#post_section_id").attr("disabled","disabled");
	$("#post_sub_section_id").attr("disabled","disabled");
	
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
	
	$("#post_category_id").change(function() {
		var category_id = $("option:selected", this).val();
		if (category_id == '0'){
		  $("#post_section_id").attr("disabled","disabled");
		  $("#post_sub_section_id").attr("disabled","disabled");
		}else{
			$("#post_section_id").empty();
			$("#post_section_id").prepend( $('<option value="0">выберите раздел</option>'));
			$("#post_section_id :first").attr("selected", "selected");
			$("#post_section_id").attr("disabled","");
			$.getJSON('/api/getsections/' + category_id, function(data) {
				$.each(data, function(i,item){
					$("#post_section_id").append( '<option value="'+ item.product_section.id + '">' + item.product_section.section + '</option>' );
				});
			});
		}
		return false;
	});
	
	$("#post_section_id").change(function() {
		var section_id = $("option:selected", this).val();
		if (section_id == '0'){
		  $("#post_sub_section_id").attr("disabled","disabled");
		}else{
			$("#post_sub_section_id").empty();
			$("#post_sub_section_id").prepend( $('<option value="0">выберите подраздел</option>'));
			$("#post_sub_section_id :first").attr("selected", "selected");
			$("#post_sub_section_id").attr("disabled","");
			$.getJSON('/api/getsubsections/' + section_id, function(data) {
				$.each(data, function(i,item){
					$("#post_sub_section_id").append( '<option value="'+ item.product_sub_section.id + '">' + item.product_sub_section.subsection + '</option>' );
				});
			});
		}
		return false;
	});	
	
})
