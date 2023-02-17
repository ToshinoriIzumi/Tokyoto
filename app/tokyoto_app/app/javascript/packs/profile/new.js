import BirthFormModel from "./birth_form_model";

document.addEventListener('turbolinks:load', () => {
    const formModel = new BirthFormModel();
    document.getElementById('child-birth-input-plus').addEventListener('click', () => {
        formModel.addElement();
        return;
    });
    document.getElementById('child-birth-input-minus').addEventListener('click', () => {
        formModel.deleteElement();
        return;
    });
});