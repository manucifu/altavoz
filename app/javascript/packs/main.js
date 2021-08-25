var lastScrollTop = 0;
var downScroll = false;
var upScroll = false;

checkScroll = function () {
    let animatableElements = $('.js-animatable:not(.isVisible)');

    let windowHeight = window.outerHeight;
    let scrollTop = $('html').scrollTop();

	var st = window.pageYOffset || document.documentElement.scrollTop; 
	if (st > lastScrollTop){
		upScroll = false;
		downScroll = true;
	} else {
	   upScroll = true;
	   downScroll = false;
	}

	lastScrollTop = st <= 0 ? 0 : st;

    // Show normal animatable elements
    for (let i = 0; i < animatableElements.length; i++) {
        let positionFromTop = animatableElements[i].getBoundingClientRect().top;
        let delay = 400;
        if ((positionFromTop + 150) - windowHeight <= 0) {
            setTimeout(function () {
                $(animatableElements[i]).addClass('isVisible');
            }, i * 200 + delay);
        }
    }
}

searchVideo = function() {
    let videoUrl = $("input[name='video_url']").val();
    let videoId = getVideoId(videoUrl);

    let url = 'https://www.googleapis.com/youtube/v3/videos?id=' + videoId
    + '&key=AIzaSyBwVwZqnr5n7fmHXaZlqSyBTi_Smtre4dQ&part=snippet,contentDetails,statistics,status';

    $.ajax({
        type: 'GET',
        url: url,
        success(res) {
            console.log('ID: ' + res.items[0].id);
            console.log('TITULO: ' + res.items[0].snippet.title);
            console.log('FECHA_PUBLICACIÓN: ' + res.items[0].snippet.publishedAt);
            console.log('FOTO: ' + res.items[0].snippet.thumbnails.high.url);
            console.log('VISUALIZACIONES: ' + res.items[0].statistics.viewCount);

            let $videoInfo = $('#video-info');
            
            $videoInfo.find("img[name='img']").attr('src', res.items[0].snippet.thumbnails.high.url);
            $videoInfo.find("div[name='created_at']").html('FECHA SUBIDA: ' + res.items[0].snippet.publishedAt)
            $videoInfo.find("div[name='views']").html('REPRODUCCIONES: ' + res.items[0].statistics.viewCount)
            $videoInfo.find("div[name='title']").html(res.items[0].snippet.title)

            $videoInfo.addClass('show');
        },
        error(err) {
            console.log(err);
        }
    })
}

getVideoId = function(url) {
    let video_id = url.split('v=')[1];
    let ampersandPosition = video_id.indexOf('&');
    if(ampersandPosition != -1) {
        video_id = video_id.substring(0, ampersandPosition);
    }

    return video_id;
}



init = function () {
    console.log('HOLA');
    checkScroll();
};

binds = function () {
    $('.js-checkVideoData').on('click', this.searchVideo);
    $(window).on('scroll', this.checkScroll);
};

$(document).ready(function () {
    init();
    binds();
});
