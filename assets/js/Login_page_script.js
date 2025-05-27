const passwordInput = document.getElementById('password');
const loginForm = document.getElementById('loginForm');

passwordInput.addEventListener('input', () => {
    const password = passwordInput.value;
    const passwordCriteria = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/;

    if (!passwordCriteria.test(password)) {
        passwordInput.setCustomValidity('Password must be 8-15 characters long, include at least 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character.');
    } else {
        passwordInput.setCustomValidity('');
    }
});

function togglePasswordVisibility() {
    const passwordField = document.getElementById('password');
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
    } else {
        passwordField.type = 'password';
    }
}

loginForm.addEventListener('submit', (event) => {
    if (!passwordInput.checkValidity()) {
        event.preventDefault();
        alert(passwordInput.validationMessage);
    }
});
