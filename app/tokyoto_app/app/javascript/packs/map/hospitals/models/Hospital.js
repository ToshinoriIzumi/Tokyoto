import Ajax from "./Ajax";
import { HOSPITAL_API_URL } from "./../config/const";

class Hospital {
    constructor(id, name, latitude, longitude, center) {
        this.id = id;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.center = center;
    }

    static async search_by(city_id) {
        const res = await Ajax.get(
            `${HOSPITAL_API_URL}/hospitals/search`,
            {city_id: city_id}
        );
        return { 
            'hospitals': this.#build(res.data['hospitals']),
            'center': res.data['center']
        };
    }

    static #build(data) {
        return data.map((response_data) => {
            return new Hospital(
                response_data['id'],
                response_data['name'],
                response_data['latitude'],
                response_data['longitude']
            );
        });
    }
}

export default Hospital;