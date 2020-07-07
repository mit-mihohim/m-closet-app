$(function() {
  function addTag(tag) {
    let html = `
                <div class="tags-field">
                  <div class="tag-search-add" data-tag-id="${tag.id}" data-tag-name="${tag.name}">${tag.name}</div>
                </div>
                `;
                $("#tags-search-result").append(html);
  }
  $("#item_tag_list").on("keyup", function () {
    let input = $("#item_tag_list").val();
    $.ajax({
      type: "GET",
      url: "/tags",
      data: {keyword: input},
      dataType: "json"
    })
    .done(function(tags) {
      $("#tags-search-result").empty();
      if (tags.length !== 0) {
        tags.forEach(function(tag) {
          addTag(tag);
        });
      } else {
        addCreateTag();
      }
    })
    .fail(function() {
    })
  });
});