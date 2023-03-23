import GoogleMapView from "./views/GoogleMapView";

export function main() {
    window.addEventListener('turbolinks:load', () => {
        const element = document.getElementById('search-button');
        if (element !== null) {
            document.getElementById('search-button').addEventListener('click', (event) => {
                event.preventDefault();
                GoogleMapView.handle();
            })
        }
    })
}
