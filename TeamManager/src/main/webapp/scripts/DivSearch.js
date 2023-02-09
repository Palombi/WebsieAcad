      function search(){
			// get search bar element
			const searchInput = document.getElementById("myInput");
			
			// store name elements in array-like object
			const namesFromDOM = document.getElementsByClassName("card");
			
			// listen for user events
			//searchInput.addEventListener("keyup", (event) => 
			searchInput.addEventListener("keyup", (e) =>{
			    // get user search input converted to lowercase
		    const searchQuery = searchInput.value.toLowerCase();
		    
		    for (const nameElement of namesFromDOM) {
		        // store name text and convert to lowercase
		        let name2 = nameElement.innerText.toLowerCase();
		        
		        // compare current name to search input
		        if (name2.includes(searchQuery)) {
		            // found name matching search, display it
		            nameElement.parentElement.style.display = "";
		        } else {
		            // no match, don't display name
		            nameElement.parentElement.style.display = "none";
		        }
		    }
		});
        } 