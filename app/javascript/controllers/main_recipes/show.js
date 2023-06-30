const publicToggle = document.getElementById('flexSwitchCheckDefault');
const form = document.getElementById('toggle-btn-form')

publicToggle.addEventListener('change', function() {
	form.submit()
});