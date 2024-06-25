//
//  ContentView.swift
//  PaynelaBNPL
//
//  Created by Meghan Granit on 4/3/24.
//

import SwiftUI
import UserNotifications
import CoreLocation
/*
class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS: \(success)")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Location based notification"
        content.subtitle = "Subtitle field"
        content.sound = .default
        content.badge = 0
        
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
       
        
        let coordinates = CLLocationCoordinate2D(
            latitude: 39.750576, longitude: -74.256797
        )
        
        let regionIdentifier = "MUCampus"
        
        let region = CLCircularRegion(
            center: coordinates,
            radius: 20, //meters
            identifier: regionIdentifier
        )
        
        region.notifyOnEntry = true
        region.notifyOnExit = false
        
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        //remove pending notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        //remove notifications from users notification center
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
*/
struct ContentView: View {
    @State var locationViewModel = LocationManagerViewModel()
    @StateObject private var viewModel = ContentVM()
    
    var body: some View {
        LoginView()
        /*
            .task {
                try? await viewModel.requestUserAuthorization()
                await viewModel.monitorRegion()
                try? await viewModel.startCurrentLocationUpdates()
                
            }

        */
        /*
            .task {
                try? await locationViewModel.requestUserAuthorization()
                NotificationService.shared.requestAuthorization()
                NotificationService.shared.scheduleNotification(userID: viewModel.storedUserID)
            }
*/
    }
}

#Preview {
    ContentView()
}
