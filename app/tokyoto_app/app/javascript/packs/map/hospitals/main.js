import GoogleMapView from "./views/GoogleMapView";

export function main() {
    window.addEventListener('load', () => {
        document.getElementById('search-button').addEventListener('click', (event) => {
            event.preventDefault();
            GoogleMapView.handle();
        })
    })
}
