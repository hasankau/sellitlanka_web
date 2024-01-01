/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {


    $.ajax({
        data: "",
        method: 'POST',
        url: "browse",
        beforeSend: function(xhr) {
            $('#postdetails').html("<img src='img/spiffygif_46x46(1).gif' />");
        },
        success: function(data) {
            json = eval(data);
            limitItem = json.length;
            makePosts();
        }
    });
});
function search() {
    alert($('#searform').serialize());
    $.ajax({
        data: $('#searform').serialize(),
        method: 'POST',
        url: "browse",
        beforeSend: function(xhr) {
            $('#postdetails').html("<img src='img/spiffygif_46x46(1).gif' />");
            wall.fitWidth();
        },
        success: function(data) {
            json = eval(data);
            limitItem = json.length;
            if (json === undefined || json === null || json.length !== 0) {
                makePosts();
            } else {
                $('#freewall').html("<h2 style='color: #454545'>Sorry, No Results Found For Your Query</h2>");
            }
        },
        error: function(textStatus, errorThrown) {
            alert(textStatus + " " + errorThrown);
        }
    });
}

