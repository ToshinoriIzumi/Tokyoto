import axios from "axios";
import { KOCOTTO_URL } from "../const";

document.addEventListener('turbolinks:load', () => {
    const searchButton = document.getElementById('change-condition-button');
    if (searchButton !== null) {
        searchButton.addEventListener('click', (event) => {
            event.preventDefault();
            const params = {
                support_id: document.getElementById('support_id').value,
                city_id: document.getElementById('city').value,
                public_assistance: document.getElementById('public_assistance').value,
                children_counts: document.getElementById('children_counts').value
            }

            axios.get(
                `${KOCOTTO_URL}/conditions_supports`, {
                    params: params
                }
            ).then((res) => {
                const conditionsSupportIds = res.data;
                const conditionsSupportElements = document.getElementsByClassName('conditions-supports');
                for( let i = 0; i < conditionsSupportElements.length; i++) {
                    const element = conditionsSupportElements[i];
                    if (conditionsSupportIds.indexOf(parseInt(element.id)) !== -1) {
                        element.hidden = false;
                    } else {
                        element.hidden = true;
                    }
                }
                const conditionsSupportIdCountElement = document.getElementById('conditions-supports-count');
                conditionsSupportIdCountElement.textContent = res.data.length
            });
        })
    }
});
