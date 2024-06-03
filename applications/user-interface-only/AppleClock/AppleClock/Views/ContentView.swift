//

import SwiftUI

struct ContentView: View {
    @State var tabIndex: Int = 0
    
    var titleText: String {
        switch tabIndex {
            case 0:
                "World Clock"
            case 1:
                "Alarms"
            case 2:
                "Stopwatch"
            case 3:
                "Timers"
            default:
                ""
        }
    }
    
    var body: some View {
        TabView (selection: $tabIndex) {
            Group {
                // Tab 0
                WorldClockView(title: titleText).tabItem {
                    Label("World Clock", systemImage: "globe")
                }.tag(0)
                
                // Tab 1
                Text("Testing").tabItem {
                    Label("Alarms", systemImage: "alarm")
                }.tag(1)
                
                // Tab 2
                Text("Second Tab").tabItem {
                    Label("Stopwatch", systemImage: "stopwatch")
                }.tag(2)
                
                // Tab 3
                Text("Timers").tabItem {
                    Label("Timer", systemImage: "timer")
                }.tag(3)
                
                // End of tabs
            }
        }
    }
}


#Preview {
    ContentView()
        .environment(\.colorScheme, .dark)
}
