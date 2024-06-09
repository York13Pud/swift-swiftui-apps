//

import SwiftUI

struct AlarmsView: View {
    
    let title: String
    @State private var alarms = [Int]()
    
    // This function is used to remove a row:
    func removeRows(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Set the background colour and ignore safe area:
                backgroundColour
                    .ignoresSafeArea()
                
                
                
                // Put the main content of the view here:
                List {
                    Section {
                        HStack {
                            Text("No Alarm")
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Button("SET UP") {
                            }
                            .padding(EdgeInsets(top: 8, leading: 11, bottom: 8, trailing: 11))
                            .background(Color.gray.opacity(0.3), in: Capsule())
                            .fontWeight(.bold)
                            .foregroundStyle(.accent)
                        }
                    } header: {
                        Label("Sleep | Wake Up", systemImage: "bed.double.fill")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                    }
                    
                    Section {
                        
                        ForEach(alarms, id: \.self) { alarm in
//                            WorldClockLocationView(location: location.location, time: location.time, timezone: location.timezone)
                        }
                        .onDelete(perform: removeRows)
                        .onMove { alarms.move(fromOffsets: $0, toOffset: $1) }
                        .listRowSeparatorTint(.gray)
                    } header: {
                        Text("Other")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
                .listStyle(.plain)
            }
            
            // Sets the title of the view
            .navigationTitle(title)
            
            // Check to see if the locations array is empty:
            .overlay() {
                if alarms.isEmpty {
                    ContentUnavailableView {
                        // No title
                    } description: {
                        Text("No Alarms")
                            .font(.system(size: 28).weight(.light))
                    }
                }
            }
            
            // Specify any buttons that need to be added to the navigation bar:
            .toolbar {
                if !alarms.isEmpty {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
//                        locations.append(zoneOne)
//                        locations.append(zoneTwo)
                    }
                }
            }
        }
    }
}


#Preview {
    AlarmsView(title: "Alarms Preview")
       .environment(\.colorScheme, .dark) // Added to force dark mode in preview window.
}
