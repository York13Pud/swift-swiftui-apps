//

import SwiftUI

struct WorldClockLocationView: View {
    // Check to see if the view is in editMode:
    @Environment(\.editMode) private var editMode
    
    // Define required constants:
    let location: String
    let time: String
    let timezone: String
    
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text("Today, \(timezone)HRS")
                    .font(.system(size: 21))
                    .foregroundStyle(.gray)
                Text(location)
                    .font(.largeTitle)
            }
            // Set the text to scale down when text is too long to fit on one line
            .minimumScaleFactor(0.01)
            .lineLimit(1)
            
            Spacer()
            
            if editMode?.wrappedValue.isEditing == false {
                VStack(alignment: .trailing) {
                    Text(time)
                        .fontWeight(.light)
                        .font(.system(size: 56))
                }
            } else {
                
            }
        }
        .padding([.top, .bottom], 15)
        .frame(minHeight: 100)
    
        // Align the text so that it is inline with the edit button and navbar title:
        .listRowInsets(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

#Preview {
    WorldClockLocationView(location: "Lodon", time: "12:34", timezone: "+0")
        .environment(\.colorScheme, .dark) // Added to force dark mode in preview window.
}
