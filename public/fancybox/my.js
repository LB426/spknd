$(document).ready(function() {

	$("a[rel=example_group]").fancybox({
		'onStart'			: function(){  },
		'transitionIn'		: 'none',
		'transitionOut'		: 'none',
		'titlePosition' 	: 'over',
		'titleFormat'		: function(title, currentArray, currentIndex, currentOpts) {
			return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
		}
	});

});

function changerel(value) { 
	/*alert('changerel')*/
	for ( i=0; i < document.links.length; i++ ){
		if (document.links[i].id == value) {
			/*alert(document.links[i].rel)*/
			document.links[i].rel = "example_group"
		}else{
			document.links[i].rel = "no_example_group"
		}
	}
}

