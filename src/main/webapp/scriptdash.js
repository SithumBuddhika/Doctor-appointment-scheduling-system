function updvalidateForm(event) {
    let errorMessage = '';
	const sform = document.getElementById('updform');
	const today = new Date();
    // Get values
    const date = new Date(document.getElementById('date').value);
    const startTime = document.getElementById('startTime').value;
    const endTime = document.getElementById('endTime').value;
    const breakTime = document.getElementById('breakTime').value;
	

		// Normalize the current date (today) to only date without time
	    const todayNormalized = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	    const shiftDate = new Date(date);
	    
	    // Clear previous error messages
	    document.getElementById('errorMessage').textContent = '';

	    // Check if the selected date is not in the past
	    if (shiftDate < todayNormalized) {
	        errorMessage += 'Shift date cannot be a past date. | ';
	    }

    // 2. End Time Validation
    if (endTime <= startTime) {
        errorMessage += 'End time must be after the start time. ';
    }

    // 3. Break Time Validation
    if (breakTime) {
        if (breakTime <= startTime || breakTime >= endTime) {
           errorMessage += 'Break time must be between start time and end time. ';
        }
     }

	 // 5. Required Fields Validation
	 const form = document.getElementById('updform');
	 for (const element of form.elements) {
	     if (element.required && !element.value) {
	         errorMessage += `${element.name} is required. `;
	     }
	 }

    // Display error or submit form manually if there are no errors
    if (errorMessage) {
        event.preventDefault(); // Prevent form submission
        document.getElementById('errorMessage').textContent = errorMessage;
    } else {
        // Manually submit the form if no errors
        sform.submit();
    }
}





