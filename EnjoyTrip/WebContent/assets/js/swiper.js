window.addEventListener("load", function() {
	new Swiper('.swiper-container', {
		slidesPerView : 3,
		slidesPerGroup : 1,
		autoplay : {
			delay : 3500,
			disableOnInteraction : false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'fraction',
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});

	new Swiper('.swiper-container2', {
		slidesPerView : 4,
		slidesPerGroup : 1,
		autoplay : {
			delay : 3500,
			disableOnInteraction : false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'fraction',
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next.swiper2_next',
			prevEl : '.swiper-button-prev.swiper2_prev',
		},
	});

	new Swiper('.swiper-container3', {
		slidesPerView : 4,
		slidesPerGroup : 1,
		autoplay : {
			delay : 3500,
			disableOnInteraction : false,
		},
		pagination : {
			el : '.swiper-pagination',
			type : 'fraction',
			clickable : true,
		},
		navigation : {
			nextEl : '.swiper-button-next.swiper2_next',
			prevEl : '.swiper-button-prev.swiper2_prev',
		},
	});
});
