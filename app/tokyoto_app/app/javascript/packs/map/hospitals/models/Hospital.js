import Ajax from "./Ajax";
import { KOCOTTO_URL } from "./../../../../packs/const";

class Hospital {
    constructor(id, name, latitude, longitude, url, phone_number) {
        this.id = id;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
        this.url = url;
        this.phone_number = phone_number;
    }

    static async search_by(city_id) {
        const res = await Ajax.get(
            `${KOCOTTO_URL}/hospitals/search`,
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
                response_data['longitude'],
                response_data['url'],
                response_data['phone_number']
            );
        });
    }
}

export default Hospital;