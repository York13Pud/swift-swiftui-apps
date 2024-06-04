//

import SwiftUI

struct WorldClockView: View {
       
    let title: String
    @State private var locations = [WorldClock]()
       
    var body: some View {
        
        NavigationStack {
            ZStack {
                // Set the background colour and ignore safe area:
                backgroundColour
                .ignoresSafeArea()
                
                // Put the main content of the view here:
                List {
                    ForEach(locations, id: \.id) { location in
                        HStack(alignment: .lastTextBaseline) {
                            VStack(alignment: .leading) {
                                Text("Today, \(location.timezone)HRS")
                                    .font(.system(size: 21))
                                    .foregroundStyle(.gray)
                                Text(location.location)
                                    .font(.largeTitle)
                            }
                            // Set the text to scale down when text is too long to fit on one line
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text(location.time)
                                    .fontWeight(.light)
                                    .font(.system(size: 56))
                            }
                        }
                        .padding([.top, .bottom], 15)
                        
                        // Align the text so that it is inline with the edit button and navbar title:
                        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        
                    }
                    .listStyle(.plain)
                }
                
                // Sets the title of the view
                .navigationTitle(title)
                
                // Specify any buttons that need to be added to the navigation bar:
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Edit") {
                            // Add edit function code here
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("", systemImage: "plus") {
                            // Add add function code here
                        }
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
