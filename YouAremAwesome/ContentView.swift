//
//  ContentView.swift
//  YouAremAwesome
//
//  Created by HERNANDEZ-CALIX, KAMILA on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    var body: some View {
        
        VStack {
            Spacer()
        
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
           
            Spacer()
            
            Button("Show Message") {
              let messages = ["You Are Awesome",
                            "You are great",
                             "You are Fantastic!",
                             "Fabulous? That you!",
                            "You make Me Smile",
                "When A Genius guy Needs Help, they call you!" ]
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber == messages.count{
                    messageNumber = 0
                }
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                print (imageNumber)
                
            }
            }
        
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .padding()
        }
    }
#Preview {
    ContentView()
}

