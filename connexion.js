document.getElementById('loginForm').addEventListener('submit', function(event) {
    let pseudo = document.getElementById('pseudo').value;
    let password = document.getElementById('password').value;

    if (!pseudo || !password) {
        event.preventDefault(); // Empêche la soumission du formulaire
        alert('Veuillez remplir tous les champs.');
    }
});