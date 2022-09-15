class GoogleMap {
    constructor(center, zoom, element, model_list) {
        this.center = center;
        this.zoom = zoom;
        this.element = element;
        this.model_list = model_list;
        this.makers = [];
        this.info_windows = [];
    }
    
    build() {
        this.#make_base_map();
        this.#make_makers();
        this.#make_info_windows();
    }

    #make_base_map() {
        this.map = new google.maps.Map(
            this.element,
            {
                center: this.center,
                zoom: this.zoom
            }
        );
    }

    async #make_makers() {
        await this.model_list.then((model) => {
            this.makers = model.map((data) => { 
                const position =  {
                    lat: parseFloat(data.latitude),
                    lng: parseFloat(data.longitude)
                }
                return new google.maps.Marker({
                    position: position,
                    map: this.map
                });
            });
        });
    }

    async #make_info_windows() {
        await this.model_list.then((model) => {
            this.info_windows = model.map((data) => {
                return new google.maps.InfoWindow({
                    content: '<div>' + data.name + '</div>'
                });
            });
        });

        for (let i = 0; i < this.makers.length; i++) {
            this.makers[i].addListener('click', () => {
                this.info_windows[i].open(this.map, this.makers[i]);
            });
        }
    }
}

export default GoogleMap