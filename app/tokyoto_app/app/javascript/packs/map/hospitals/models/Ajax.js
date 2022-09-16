import axios from "axios";

class Ajax {
    constructor() {
        this.data = [];
    }

    static async get(url, params) {
        await axios.get(
            url, {
                params: params
            }
        ).then((res) => {
            this.data = res;
        });
        return this.data
    }
}

export default Ajax;