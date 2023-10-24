const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
const mainImage = document.querySelector('.slides img');
const thumbnailImages = document.querySelectorAll('.preview img');
let currentIdx = 0; //현재 슬라이드 index
const slideCount = slideImg.length; // 슬라이드 개수
const prev = document.querySelector('.prev'); //이전 버튼
const next = document.querySelector('.next'); //다음 버튼
const slideWidth = 620; //한개의 슬라이드 넓이
const slideMargin = 100; //슬라이드간의 margin 값

//전체 슬라이드 컨테이너 넓이 설정

slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';

 
function moveSlide(num) {
  slides.style.left = -num * 620 + 'px';
  currentIdx = num;

// 이동 후, 현재 슬라이드에 해당하는 썸네일 이미지 활성화
  
  thumbnailImages.forEach((thumbnailImage, idx) => {
    if (idx === currentIdx) {
      thumbnailImage.classList.add('active');
    } else {
      thumbnailImage.classList.remove('active');
    }
  });
}

prev.addEventListener('click', function () {
  if (currentIdx !== 0) {
    moveSlide(currentIdx - 1);
  }

});

next.addEventListener('click', function () {
  if (currentIdx !== slideCount - 1) {
    moveSlide(currentIdx + 1);
  }
});

// 썸네일, 메인이미지



// 초기 활성화된 썸네일 이미지 설정
thumbnailImages[0].classList.add('active');

thumbnailImages.forEach((thumbnailImage, idx) => {
  thumbnailImage.addEventListener('mouseenter', () => {
    mainImage.src = thumbnailImage.src;
    moveSlide(idx);
  });
});


