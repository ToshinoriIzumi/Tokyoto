import GoogleMapController from "../controllers/GoogleMapController";
import { GOOGLE_MAP_API_KEY } from "../config/const";

class GoogleMapView {
    static handle() {
        const script = document.createElement('script');
        script.src = 'https://maps.googleapis.com/maps/api/js?key=' + GOOGLE_MAP_API_KEY + '&callback=initMap';
        
        window.initMap = function() {
            const google_map_controller = new GoogleMapController(
                { lat: 35.7073, lng: 139.6638 },
                12,
                "map",
            )
            google_map_controller.build(
                document.getElementById('city_city_id').value
            );
        }
        if (document.head.contains(script)) {
            document.head.removeChild(script);
        }
        document.head.appendChild(script);
    }
}

export default GoogleMapView
