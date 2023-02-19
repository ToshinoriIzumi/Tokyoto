import BirthFormModel from "./birth_form_model";

document.addEventListener('turbolinks:load', () => {
    const formModel = new BirthFormModel();
    const birth_plus_button = document.getElementById('child-birth-input-plus');
    if (birth_plus_button !== null) {
        birth_plus_button.addEventListener('click', () => {
            formModel.addElement();
            return;
        });
    }
    
    const birth_minus_button = document.getElementById('child-birth-input-minus');
    if (birth_minus_button !== null) {
        birth_minus_button.addEventListener('click', () => {
            formModel.deleteElement();
            return;
        });
    }
});
