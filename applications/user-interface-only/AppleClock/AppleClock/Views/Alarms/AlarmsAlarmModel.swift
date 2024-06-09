//

import Foundation

struct Alarm: Identifiable {
    let id: UUID = UUID()
    var time: String
    var repeatOn: [Int]
    var label: String
    var sound: String
    var snooze: Bool
}

// Sample data:
let alarmOne   = Alarm(time: "06:00", repeatOn: [1,2,3,4,5,6,7], label: "Alarm One", sound: "Radial", snooze: true)
let alarmTwo   = Alarm(time: "06:10", repeatOn: [1,2,3,4,5,6,7], label: "Alarm Two", sound: "Radial", snooze: true)
let alarmThree = Alarm(time: "06:20", repeatOn: [1,2,3,4,5,6,7], label: "Alarm Three", sound: "Radial", snooze: true)
let alarmFour  = Alarm(time: "06:30", repeatOn: [1,2,3,4,5,6,7], label: "Alarm Four", sound: "Radial", snooze: true)
let alarmFive  = Alarm(time: "06:40", repeatOn: [1,2,3,4,5,6,7], label: "Alarm Five", sound: "Radial", snooze: true)
