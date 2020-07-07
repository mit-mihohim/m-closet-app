$(function() {
  $("#item_tag_list").on("keyup", function () {
    let input = $("#item_tag_list").val();
    console.log(input);
    $.ajax({
      type: "GET",
      url: "/tags",
      data: {keyword: input},
      dataType: "json"
    })
  });
});