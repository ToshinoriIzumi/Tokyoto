import Hospital from "../models/Hospital";
import GoogleMap from "../models/GoogleMap";

class GoogleMapController {
    constructor(center, zoom, map_id) {
        this.center = center;
        this.zoom  = zoom;
        this.map_id = map_id;
    }

    build(city_id) {
        const map = document.getElementById(this.map_id); 
        const hospitals = Hospital.search_by(city_id);
        const google_map = new GoogleMap(
            this.center,
            this.zoom,
            map,
            hospitals
        );
        google_map.build();
    }
}

export default GoogleMapController