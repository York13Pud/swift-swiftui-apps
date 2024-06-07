//

import SwiftUI

struct AlarmsView: View {
    
    let title: String
    @State private var locations = [WorldClock]()
    
    // This function is used to remove a row:
    func removeRows(at offsets: IndexSet) {
        locations.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Set the background colour and ignore safe area:
                backgroundColour
                    .ignoresSafeArea()
                
                // Put the main content of the view here:
                List {
                    ForEach(locations, id: \.id) { location in
                        WorldClockLocationView(location: location.location, time: location.time, timezone: location.timezone)
                    }
                    .onDelete(perform: removeRows)
                    .onMove { locations.move(fromOffsets: $0, toOffset: $1) }
                    .listRowSeparatorTint(.gray)
                }
                .listStyle(.plain)
            }
            
            // Sets the title of the view
            .navigationTitle(title)
            
            // Check to see if the locations array is empty:
            .overlay() {
                if locations.isEmpty {
                    ContentUnavailableView {
                        // No title
                    } description: {
                        Text("No World Clocks")
                            .font(.system(size: 28).weight(.light))
                    }
                }
            }
            
            // Specify any buttons that need to be added to the navigation bar:
            .toolbar {
                if !locations.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        locations.append(zoneOne)
                        locations.append(zoneTwo)
                    }
                }
            }
        }
    }
}


#Preview {
    WorldClockView(title: "Alarms Preview")
       .environment(\.colorScheme, .dark) // Added to force dark mode in preview window.
}
