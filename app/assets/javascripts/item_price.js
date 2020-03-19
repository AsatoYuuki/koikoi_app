// $(document).on('turbolinks:load',function() {
//   $('#item_price').on('keyup', function() {
//     console.log("こん")
//     let getPrice = $(this).val();
//     let commission = getPrice / 10;
//     let profit = getPrice - commission;
//     $('p#commision').text(commission);
//     $('p#profit').text(profit);
//     if($.type(getPrice) != "number"){
//       return;
//     };
//   })
// });

$(function(){
  $("#item_price").on("keyup", function(){
    var core = $(this).val();
    console.log(core)
    if (core > 299) {
      var truth = Math.floor(core / 10);
      var money = core - truth ;
      $(".zeikin_text").text("¥" + truth);
      $(".price_text").text("¥" + money);
    }
    else {
      $(".zeikin_text").text("-");
      $(".price_text").text("-");
    }
  });
  // if($.type(core) != "number"){
  //   return;
  // };

});