$(document).ready(function(){
  $('.bxslider').bxSlider({
    auto: true,           // 自動スライド
    mode: 'fade',         // 切り替えをフェードに
    speed: 1500,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 5000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
    slideWidth: 640,      // 各スライドの幅
    infiniteLoop: true,   // スライドをループさせる
    autoHover: true       //ホバーした時にスライドを止める
  });
});
