class BirthFormModel {
    constructor() {
        this.birth_form_element = document.getElementById('children_birth_form');
        this.count = document.getElementsByClassName('children-birth-form').length - 1; //要素数なので要素番号は要素 - 1
    }

    addElement() {
        this.count++;
        const div = document.createElement('div');
        div.setAttribute('id', `birth_${this.count}`);
    
        const label = document.createElement('label');
        label.textContent = `第${this.count + 1}子`;
        div.appendChild(label);

        const newForm = document.createElement('input');
        newForm.setAttribute('type', 'date');
        newForm.setAttribute('name', 'profile_form[births][]');
        newForm.setAttribute('class', 'children-birth-form block w-full px-5 py-3 text-base text-neutral-600 placeholder-gray-300 transition duration-500 ease-in-out transform border border-transparent rounded-lg bg-gray-50 focus:border-transparent focus:ring-2 focus:ring-blue-400 focus:ring-offset-2 focus:ring-offset-gray-300 border-gray-500');
        newForm.setAttribute('id', `birth_form_${this.count}`);
        div.appendChild(newForm);
    
        this.birth_form_element.appendChild(div);
    }

    deleteElement() {
        if (this.count <= 0) return;
        const birthForms = document.getElementsByClassName('children-birth-form')
        const lastFormIndex = birthForms.length - 1;
        this.birth_form_element.removeChild(document.getElementById(`birth_${lastFormIndex}`));
        this.count--;
    }
}

export default BirthFormModel;