import Hospital from "../models/Hospital";
import GoogleMap from "../models/GoogleMap";

class GoogleMapController {
    constructor(zoom, map_id) {
        this.zoom  = zoom;
        this.map_id = map_id;
    }

    build(city_id) {
        const map = document.getElementById(this.map_id);
        Hospital.search_by(city_id)
        .then((res) => {
            const center = res.center;
            const google_map = new GoogleMap(
                {
                    lat: center.latitude,
                    lng: center.longitude
                },
                this.zoom,
                map,
                res.hospitals
            );
            google_map.build();
        })
        .catch((err) => {
            console.log(err);
        }) 
    }
}

export default GoogleMapController