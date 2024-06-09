window.addEventListener('load', function () {

    // Call the function when the page loads
    addShowClass();

});



// Function to add 'show' class to offcanvas on large screens
    function addShowClass() {
        var offcanvasElement = document.getElementById("offcanvasScrolling");
        if (window.matchMedia("(min-width: 768px)").matches) {
          offcanvasElement.classList.add("show");
        } else {
          offcanvasElement.classList.remove("show");
          console.log(window);

        }
      }
  

      // Listen for window resize events and update the 'show' class
      window.addEventListener("resize", addShowClass);

    function toggleHoverLock(clickedItem) {
        // Toggle the 'locked' class on the clicked item
        clickedItem.classList.add('activeSideIcon');

        // Remove 'locked' class from all other items
        const sideItems = document.querySelectorAll('.sideItem');
        sideItems.forEach(function(item) {
            if (item !== clickedItem) {
                console.log(item)
                item.classList.remove('activeSideIcon');
                console.log("New")
            }
        });
    }
