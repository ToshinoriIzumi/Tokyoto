window.addEventListener('turbolinks:load', () => {
    document.getElementById('child-age-input-plus').addEventListener('click', () => {
        alert('plus');
        return;
    });
    document.getElementById('child-age-input-minus').addEventListener('click', () => {
        alert('minus');
        return;
    });
});

class AgeFormObject
{
    
}