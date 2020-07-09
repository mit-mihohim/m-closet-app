$(function() {
  function addTag(tag) {
    let html = `
                <div class="tags-field">
                  <p class="tags-field__name">${tag.name}</p>
                  <div class="tag-search-add tags-field__btn tags-field__btn--add" data-tag-id="${tag.id}" data-tag-name="${tag.name}">Add</div>
                </div>
                `;
                $("#tags-search-result").append(html);
  }

  function addNoTag() {
    let html = `
                <div class="tags-field">
                  <p class="tags-field__name">該当タグはありません。上記から追加して下さい</p>
                </div>
                `;
                $("#tags-search-result").append(html);
  }

  function addDeleteTag(name, id) {
    let html = `
          <div class="tags-field"id="${id}">
            <p class="tags-field__name">${name}</p>
            <div class="tag-search-remove tags-field__btn tags-field__btn--remove js-remove-btn" data-tag-id="${id}" data-tag-name="${name}">Delete</div>
          </div>
          `;
          $("#tags-selected").append(html);
  }

  function addSelectedTags(tagId) {
    let html = `<input value="${tagId}" name="item[tag_list]" type= "hidden", id="item_tag_list${tagId}" />`;
    $(`#${tagId}`).append(html);
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
      } else if (input.length == 0) {
        return false;
      } else {
        addNoTag();
      }
    })
    .fail(function() {
      alert("通信エラーです。ページをリロードして下さい");
    });
  });
  $(document).on("click", ".tags-field__btn--add", function() {
    const tagName = $(this).attr("data-tag-name");
    const tagId = $(this).attr("data-tag-id");
    $(this)
      .parent()
      .remove();
    addDeleteTag(tagName, tagId);
    addSelectedTags(tagId);
  });
  $(document).on("click", ".tags-field__btn--remove", function () {
    $(this)
      .parent()
      .remove();
  });
});