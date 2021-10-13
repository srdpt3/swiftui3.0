//
//  ShazamRecognizer.swift
//  MusicRecognization
//
//  Created by Dustin yang on 10/8/21.
//

import SwiftUI
import ShazamKit
import AVKit


class ShazamRecognizer: NSObject,ObservableObject,SHSessionDelegate {
    
    @Published var session = SHSession()
    
    // Audio Engine....
    @Published var audioEngine = AVAudioEngine()
    
    // Error....
    @Published var errorMsg = ""
    @Published var showError = false
    
    // Recording Status...
    @Published var isRecording = false
    
    // FOund Track...
    @Published var matchedTrack: Track!
    
    override init() {
        super.init()
        // Setting Delegate...
        session.delegate = self
    }
    
    func session(_ session: SHSession, didFind match: SHMatch) {
        
        // Match Found....
        if let firstItem = match.mediaItems.first{
            
            DispatchQueue.main.async {
                
                self.matchedTrack = Track(title: firstItem.title ?? "",
                                          artist: firstItem.artist ?? "",
                                          artwork: firstItem.artworkURL ?? URL(string: "")!
                                          , genres: firstItem.genres,
                                          appleMusicURL: firstItem.appleMusicURL ?? URL(string: "")!)
                
                self.stopRecording()
            }
        }
    }
    
    func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        
        // No match...
        DispatchQueue.main.async {
            
            self.errorMsg = error?.localizedDescription ?? "음악을 찾지 못했습니다."
            self.showError.toggle()
            // stopping Audio recording....
            self.stopRecording()
        }
    }
    
    func stopRecording(){
        audioEngine.stop()
        withAnimation{
            isRecording = false
        }
    }
    
    // Fetch Music....
    func listnenMusic(){
        
        let audioSession = AVAudioSession.sharedInstance()
        
        // checking fro permission....
        audioSession.requestRecordPermission { status in
            
            if status{
                self.recordAudio()
            }
            else{
                self.errorMsg = "제발 마이크 허용하기"
                self.showError.toggle()
            }
        }
    }
    
    func recordAudio(){
        
        // checking if already recording...
        // then stopping it....
        if audioEngine.isRunning{
            self.stopRecording()
            return
        }
        
        // recording audio....
        // Firts create a node...
        // Then Listnen to it....
        let inputNode = audioEngine.inputNode
        // Format.....
        let format = inputNode.outputFormat(forBus: .zero)
        
        // removing tap if already installed....
        inputNode.removeTap(onBus: .zero)
        
        // Installing tap....
        inputNode.installTap(onBus: .zero, bufferSize: 1024, format: format) { buffer, time in
//            print("recording... \(time)")

            // It will Listnen to music continously....
            // Starting Shazam Session...
            self.session.matchStreamingBuffer(buffer, at: time)
        }
        
        // starting Audio Service...
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
            print("Started")
            withAnimation{
                self.isRecording = true
            }
        }
        catch{
            self.errorMsg = error.localizedDescription
            self.showError.toggle()
        }
    }
    
    
    
    
}
