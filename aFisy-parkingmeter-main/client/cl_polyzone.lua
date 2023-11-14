local ParkingMeters = {
    -1940238623,
    2108567945,
}

exports['qb-target']:AddTargetModel(ParkingMeters, {
    options = {
        {
        type = "client",
        event = "afisy-parkingmeter:client:payParking",
        icon = "fas fa-parking",
        label = "Pay parking ($5)",
        },
        { 	
            type = "client",
            event = "afisy-parkingmeter:client:checkParking",
            icon = "fas fa-parking",
            label = "View payments (Police)",
            job = "police",
        },
    },
    distance = 2.5,
})