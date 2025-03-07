// JavaScript file: myjs.js
$(document).ready(function() {
    $("#add-cat-form").on('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        console.log("in js");
        let form = new FormData(this);

        // AJAX request to server
        $.ajax({
            url: "CatServlet", // The URL of your servlet
            type: "POST", // The request method
            data: form, // The form data
            processData: false, // Don't process the data
            contentType: false, // Don't set content type

            success: function(data) {
				console.log("Response from server: ", data);
                // Check the response from the servlet
                if (data.trim() === 'done') {
                    const newCategory = $('input[name="category"]').val(); // Get the new category name
                    $('#category-list').append(`<li>${newCategory}</li>`); // Append it to the category list
                    $('input[name="category"]').val(''); // Clear the input
                    $('textarea[name="category_des"]').val(''); // Clear the textarea
                    swal("Good job!", "Added successfully", "success");
                } else if (data.trim() === 'empty') {
                    swal("Error!", "Empty field not allowed", "error");
                } else if (data.trim() === 'exist') {
                    swal("Error!", "Category already exists", "error");
                } else {
                    swal("Error!", "Something went wrong! Try again", "error");
                }
            },
            error: function() {
                swal("Error!", "Oops! Something went wrong! Try again", "error");
            }
        });
    });
});




function doLike(pid, uid) {
    // Data to send to the servlet
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };

    // Make AJAX request to LikedServlet
    $.ajax({
        url: "LikedServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            // Find the like counter for the specific post
            let likeCounter = $(".like-counter[data-post='" + pid + "']");
            let likeIcon = $("#thumbs-" + pid);
            // Split the response to get the status and updated like count
            let responseParts = data.trim().split(":");
            let status = responseParts[0];
            let updatedCount = parseInt(responseParts[1]);

            // Update the like counter with the new count
            likeCounter.html(updatedCount);
			if (status === 'success') {
			                // If the like operation was successful, set the icon to filled
			                likeIcon.removeClass('fa-thumbs-o-up').addClass('fa-thumbs-up');
			}
			if (status === 'already_reacted') {
			                // If the post was already liked, ensure the icon is filled
			                likeIcon.removeClass('fa-thumbs-up').addClass('fa-thumbs-o-up');
			} 
            // Log the result (optional)
            console.log("Status: " + status + ", New Like Count: " + updatedCount);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log("Error:", errorThrown);
        }
    });
}


