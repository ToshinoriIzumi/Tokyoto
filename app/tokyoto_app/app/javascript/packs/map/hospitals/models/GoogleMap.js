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

    #make_makers() {
        this.makers = this.model_list.map((data) => { 
            const position =  {
                lat: parseFloat(data.latitude),
                lng: parseFloat(data.longitude)
            }
            return new google.maps.Marker({
                position: position,
                map: this.map
            });
        });
    }

    #make_info_windows() {
        this.info_windows = this.model_list.map((data) => {
            let content = '<div class="name">' + data.name + '</div>';
            if (typeof data.url !== 'undefined') {
                content += '<div class="url"><a href="' + data.url + '" target="_blank">ホームページはこちら</a></div>';
            }
            
            if (typeof data.phone_number !== 'undefined') {
                content += '<div>' + data.phone_number + '</div>'
            }
            return new google.maps.InfoWindow({
                content: content
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