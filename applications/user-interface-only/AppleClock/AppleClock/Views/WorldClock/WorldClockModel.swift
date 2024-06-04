//

import Foundation

struct WorldClock: Identifiable {
    let id: UUID = UUID()
    var location: String
    var time: String
    var timezone: String
}

// Two sample records that can be usedL
let zoneOne = WorldClock(location: "London", time: "01:30", timezone: "+0")
let zoneTwo = WorldClock(location: "Paris", time: "02:30", timezone: "+1")
