const data = {
    format: "json",
    addressdetails: 1,
    q: "22 rue mouneyra bordeaux",
    limit: 1
};

const url = new URL("https://nominatim.openstreetmap.org");
Object.keys(data).forEach(key => url.searchParams.append(key, data[key]));

fetch(url, {
    method: "GET"
})
.then(response => response.json())
.then(data => {
    console.log(data);
})
.catch(error => {
    console.error('Error:', error);
});
