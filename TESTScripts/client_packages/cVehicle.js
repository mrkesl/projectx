const timeBarLib = require('/lib/timerbars');
const NativeUI = require('/lib/nativeui');
const Menu = NativeUI.Menu;
const UIMenuItem = NativeUI.UIMenuItem;
const UIMenuListItem = NativeUI.UIMenuListItem;
const UIMenuCheckboxItem = NativeUI.UIMenuCheckboxItem;
const UIMenuSliderItem = NativeUI.UIMenuSliderItem;
const BadgeStyle = NativeUI.BadgeStyle;
const Point = NativeUI.Point;
const ItemsCollection = NativeUI.ItemsCollection;
const Color = NativeUI.Color;
const ListItem = NativeUI.ListItem;

// CAR SHOP
var cam = null;
var type = null;
var carShopType, carShopData, carShopPos;
function carShopMenu() {   
    data = carShopData; 
    type = carShopType;
    if(data.length == 1) return carShopClassMenu(0);
    ui = new Menu(type, "", new Point(50, 50));  
    for(var i = 0; i < data.length; i++) {
        item = new UIMenuItem(
            data[i].name
        );
        ui.AddItem(item);
    }
    let closing = true;
    ui.IndexChange.on( (index) => {
        mp.players.local.vehicleShop.model = data[index][Object.keys(data[index])[1]].hash;
    });
    ui.ItemSelect.on( (item, index) => {
        closing = false;
        ui.Close();
        ui = null;
        carShopClassMenu(index);
    });
    ui.MenuClose.on( () => {
        if(closing) {
            ui = null;
            exitCarShop();  
        }
    });
}
function carShopClassMenu(id) {
    data = carShopData[id];
    ui = new Menu(data.name, "", new Point(50, 50));
    for(var key in data) {
        if(key == "name") continue;
        item = new UIMenuItem(
            data[key].name,
            ". ~g~Tip:~w~ Those vehicle are temporary and will disapear at each restart!"
        );
        item.SetRightLabel("~g~$" + data[key].price);
        ui.AddItem(item);
    }  
    ui.IndexChange.on( (index) => {
        mp.players.local.vehicleShop.model = data[Object.keys(data)[index+1]].hash;
        mp.players.local.vehicleShop.price = data[Object.keys(data)[index+1]].price;
    });
    ui.ItemSelect.on( (item) => {
        mp.events.callRemote("buyVehicleShop", carShopType, JSON.stringify({"model": mp.players.local.vehicleShop.model, "price": mp.players.local.vehicleShop.price}));
    });
    ui.MenuClose.on( () => {
        if(carShopData && carShopData.length > 1) { 
            return carShopMenu();
        } else if(carShopData) {
            ui = null;
            exitCarShop();
        }
    });
}

function exitCarShop() {    
    carShopData = null;
    carShopType = null;
    carShopPos = null;
    mp.players.local.vehicleShop.destroy();
    delete mp.players.local.vehicleShop;
    if(ui) ui.Close();
    cam.setActive(false);
    mp.game.cam.renderScriptCams(false, true, 0, true, true);
    cam.destroy();
    cam = null; 
    mp.events.callRemote("exitVehicleShop");
}


mp.events.add({
    "setWaypoint": (x, y) => {
        mp.game.ui.setNewWaypoint(x, y);
    },
    "showVehicleShop": (cars, carPos, type) => {
        cars = JSON.parse(cars);
        pos = JSON.parse(carPos);

        carShopType = type;
        carShopData = cars;
        carShopPos = pos;

        player = mp.players.local; 
        player.vehicleShop = mp.vehicles.new(cars[0][Object.keys(cars[0])[1]].hash, new mp.Vector3(pos.Position.x, pos.Position.y, pos.Position.z), {
            numberPlate: "SHOP",
            dimension: player.dimension,
            heading: pos.Position.rz,
            engine: true
        });

        cam = mp.cameras.new("Camera", {x:pos.Position.x-5, y: pos.Position.y-5, z: pos.Position.z+2}, {x: 0, y: 0, z: pos.Position.rz}, 50);
        cam.setActive(true);
        cam.pointAt(player.vehicleShop.handle, 0,0,0, true) ;
        mp.game.cam.renderScriptCams(true, false, 0, true, false);
        carShopMenu()   
    },
    "exitVehicleShop": () => {
        exitCarShop();
    }
})