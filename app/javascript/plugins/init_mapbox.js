import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

  // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.background = `#4ED191 url('${marker.image_url}')`;
    element.style.backgroundSize = '85%';
    element.style.backgroundPosition= 'center';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.borderRadius = '8px 8px 0 0';
    element.style.padding = '10px 0';
    element.style.width = '40px';
    element.style.height = '30px';
    element.data = marker.features;
    element.addEventListener("click", (e) => {
      fetch(`/users/${marker.user_id}/garages/${marker.id}/card.js`)
        .then(response => response.text())
        .then(text => eval(text))
    });
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const filterMarkers = () => {
  const checkboxes = document.querySelectorAll(".checkbox");
  const markerElements = document.querySelectorAll(".marker");
  const garageCards = document.querySelectorAll(".index-card");

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener('change', (event) => {
      if(checkbox.checked) {
        markerElements.forEach((markerElement) =>  {
          if(!(markerElement.data.includes(checkbox.id))) {
            markerElement.classList.add('hide');
          }})
      } else {
        markerElements.forEach((markerElement) =>  {
          if(!(markerElement.data.includes(checkbox.id))) {
            markerElement.classList.remove('hide');
          }
        });
      };
    });
  });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/deprezedouard/cjzb94xsi091p1co0m2e7j0uo'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));
  }
  filterMarkers();
};

export { initMapbox };
