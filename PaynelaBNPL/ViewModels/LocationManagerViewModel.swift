//
//  LocationManagerViewModel.swift
//  PaynelaBNPL
//
//  Created by Meghan Granit on 4/3/24.
//

import Foundation
import CoreLocation
import UserNotifications

@Observable
class LocationManagerViewModel: NSObject, CLLocationManagerDelegate {
    var location: CLLocation? = nil
    var isInMUCampus = false
    var shouldShowGoodByeSheet = false
    private let regionIdentifier = "MUCampus"
    
    
    
    private let locationManager = CLLocationManager()
    private var monitor: CLMonitor? // we need a new object here
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestUserAuthorization() async throws {
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func startCurrentLocationUpdates() async throws {
        for try await locationUpdate in CLLocationUpdate.liveUpdates() {
            guard let location = locationUpdate.location else { return }
            
            self.location = location
        }
    }
    
    func monitorRegion() async {
        print("monitorRegion")
        if monitor == nil {
            monitor = await CLMonitor("MonitorID")
        }
        
        // MU campus 40.27885378050961, -74.0061539865208
        await monitor?.add(CLMonitor.CircularGeographicCondition(center: CLLocationCoordinate2D(latitude: 40.27885378050961, longitude: -74.0061539865208), radius: 20), identifier: regionIdentifier, assuming: .unsatisfied)
        
        Task {            guard let monitor else { return }
            for try await event in await monitor.events {
                    switch event.state {
                    case .satisfied: // you will receive the callback here when user ENTER any of the registered regions.
                        enterRegion()
                    case .unknown, .unsatisfied: // you will receive the callback here when user EXIT any of the registered regions.
                        exitRegion()
                    default:
                        print("No Location Registered")
                    }
            }
        }
    }
    
    func enterRegion() {
        isInMUCampus = true
        print("didEnterRegion run")
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
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }
    
    func exitRegion() {
        shouldShowGoodByeSheet = true
        isInMUCampus = false
        print("didExitRegion run")
        cancelNotification()
    }
    
    func cancelNotification() {
        //remove pending notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        //remove notifications from users notification center
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

