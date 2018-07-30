var Config = require('config.json')
var Car_Shop = require('vehicle_shop.json');

mp.events.addCommand("carShop", (player, carShop) => {
    if(!carShop || carShop == "") return player.outputChatBox("No CarShop selected.");
    if(carShop != "Boat" && carShop != "CarPoor" && carShop != "Helicopter") return player.outputChatBox("CarShop not exist...");
    mp.events.call("showVehicleShop", player, carShop);
});

mp.events.add({
    "showVehicleShop": (player, type) => {
        data = Config.CarShop[type];
        vehClass = Config.CarShop[type].Class
        vehData = [];
        for(var i =0; i < vehClass.length; i++) {
            vehData[ i ] = Car_Shop[ vehClass[i] ];
        }
        player.dimension = Math.random() * 10000;
        player.position = new mp.Vector3(data.Marker.x, data.Marker.y, data.Marker.z);

        player.call("showVehicleShop", [ JSON.stringify(vehData), JSON.stringify(data), type]);
    },
    "exitVehicleShop": (player) => {
        player.dimension = 0;
    },
    "buyVehicleShop": (player, type, vehicle) => {
        vehicle = JSON.parse(vehicle);
        if(vehicle.price < player.money) {
            player.money -= vehicle.price;
            randomPos = Config.CarShop[type].Park;
            randomPos = randomPos[Math.floor(Math.random() * Object.keys(randomPos).length)];
            vehicleBought = mp.vehicles.new(vehicle.model, new mp.Vector3(randomPos.x, randomPos.y, randomPos.z,), {
                numberPlate: "Civil",
                dimension: 0,
                heading: randomPos.rz,
                engine: false
            });
            vehicleBought.owner = player.name;
            player.dimension = 0;
            player.call("exitVehicleShop")
            player.call("ShowShardMessage", ["~g~Success!", "Your vehicle is waiting for you at the waypoint on your minimap!"])
            player.call("setWaypoint", [randomPos.x, randomPos.y])
        } else { player.notify("You don't have enough money for this"); }
    }
});

for(var key in Config.CarShop) {
    if(typeof Config.CarShop[key].Position == "undefined") continue;
    carshop = Config.CarShop[key];
    marker = mp.markers.new(1, new mp.Vector3(carshop.Marker.x, carshop.Marker.y, carshop.Marker.z -1), 3, {
        color: [15,0,255, 125],
        dimension: Config.defaultDimension
    });
    marker.carShop = true;
    marker.carShopType = key;
    blip = mp.blips.new(carshop.Blip, new mp.Vector3(carshop.Marker.x, carshop.Marker.y, carshop.Marker.z ), {
        dimension: Config.defaultDimension,
        color: 4,
        name: carshop.Name
    });
    Labels.createLabelOffline("Press ~b~Y~w~ to enter in the ~p~Shop", new mp.Vector3(carshop.Marker.x, carshop.Marker.y, carshop.Marker.z ), Config.defaultDimension);
    
}