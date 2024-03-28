window.onload = function() {
    let mainContent = document.querySelector('main');
    if (mainContent) {
        mainContent.style.opacity = 0;
        setTimeout(function() {
            mainContent.style.transition = 'opacity 2s';
            mainContent.style.opacity = 1;
        }, 300);
    }
}