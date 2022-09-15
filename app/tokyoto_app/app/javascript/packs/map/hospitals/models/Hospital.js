import Ajax from "./Ajax";

class Hospital {
    constructor(id, name, latitude, longitude) {
        this.id = id;
        this.name = name;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    static async search_by(city_id) {
        const res = await Ajax.get(
            'http://localhost:3000/hospitals/search',
            {city_id: city_id}
        );
        return this.#build(res.data);
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