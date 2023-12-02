document.addEventListener("DOMContentLoaded", function() {
    //Get the modal
    var modal = document.getElementById('signupModal');

    //Get the close button
    var closeBtn = document.getElementsByClassName('close-btn')[0];

    //when the user clicks on the close button, close the modal
    closeBtn.onclick = function(){
        modal.style.display = 'none';
    }

    // If user clicks outside of the modal, close it
    window.onclick = function(event){
        if(event.target == modal){
            modal.style.display = 'none';
        }
    }

    // Function to show the modal, can be called from anywhere
    function showSignupModal(){
        modal.style.display = 'block';
    }
    
    //Automatically show the modal when user visits the page 
    showSignupModal();
});
