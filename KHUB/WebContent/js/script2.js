// USED FOR DEMO2
function menuCollapse(){
	if($(window).width() < 769) {
      	$('#nav').hide();
	    $('#menu').show();
    } else {
      	$('#nav').show();
      	$('#menu').hide();
    }
}
$(document).ready(function(){
	/*$('a[href*=#]').click(function(){
	    $('html, body').animate({
	        scrollTop: $( $.attr(this, 'href') ).offset().top -80
	    }, 500);
	    return false;*/
	    
	    
	    
	    function OpenModal() {
            $("#divModal").dialog({
                autoOpen: false, modal: true, title: 'FeedBack', width: 'auto', height: 'auto' , position:'absolute',
                
            }).dialog('open');
            return false;
            
        }
	    
	});
	
	menuCollapse();	
	$(window).on('resize', function(){menuCollapse();});
	$('#menu').click(function(){$('#nav').slideToggle();});

	$('.carousel-slide').sliderArrow({
		next_slides : 3000
	});
