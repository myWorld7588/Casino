//
//  InfoView.swift
//  Casino
//
//  Created by Jake Choi on 12/6/22.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    
                    FormRowView(firstItem: "Platforms", secondItem: "Iphone, Ipad, Mac")
                    
                    FormRowView(firstItem: "Developer", secondItem: "myWorld7588")
                    
                    FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
                    
                    FormRowView(firstItem: "Music", secondItem: "Dan Leowitz")
                    
                    FormRowView(firstItem: "Website", secondItem: "github.com/myWorld7588")
                    FormRowView(firstItem: "Copyright", secondItem: "@ 2022 All rights reserved.")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        
        .padding(.top, 40)
        .overlay(
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                // ACTION
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 20)
                .accentColor(Color.secondary), alignment: .topTrailing)
    }
}


struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem).foregroundColor(Color.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewDevice("iPhone 14 pro")
    }
}
