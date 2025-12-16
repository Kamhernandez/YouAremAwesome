//
//  ContentView.swift
//  YouAremAwesome
//
//  Created by HERNANDEZ-CALIX, KAMILA on 11/4/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastmessageNumber = -1 //las message number will never be -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImage = 10 //image labeled image0-image9
    let numberOfSound = 6 // sounds labeled sound0-sound5
    
    var body: some View {
        
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
        
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            
            Spacer()
            
            Button(String("Show Message")) {
                let messages = ["You are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great!",
                                "You are Fantastics!",
                                "Fabulous? That's You!",
                                "You make me Smile!"]
                
                var messageNumber: Int
                repeat{
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastmessageNumber
                message = messages [messageNumber]
                lastmessageNumber = messageNumber
                
                var imageNumber: Int
                repeat{
                    imageNumber = Int.random(in: 0...(numberOfImage-1))
                }while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
              
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSound-1)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                
                let soundName = "sound\(soundNumber)"
                guard let soundFile = NSDataAsset (name: soundName) else{
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do{
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }catch{
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
                }
                messageNumber = Int.random(in: 0...messages.count-1)
                while messageNumber == lastmessageNumber {
                    messageNumber = Int.random(in: 0...messages.count-1)
                    
                }
                message = messages[messageNumber]
                lastmessageNumber = messageNumber
                
                imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}
#Preview {
    ContentView()
}
