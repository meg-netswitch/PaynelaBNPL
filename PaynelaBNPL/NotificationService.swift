//
//  NotificationService.swift
//  PaynelaBNPL
//
//  Created by Meghan Granit on 4/3/24.
//

import Foundation
import UserNotifications
import CoreLocation

class NotificationService {
    static let shared = NotificationService()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("SUCCESS: \(success)")
                NotificationService.shared.scheduleNotification(userID: UserService.shared.currentUserID){ result in
                    if result {
                        print(result)
                    } else {
                        print("error")
                    }
                }
            }
        }
    }
    
    func scheduleNotification(userID: Int, completionHandler: @escaping (Bool) -> Void) {
        cancelNotification()
        guard userID != 0 else {
            print("no user id found for notifications")
            return
        }
        print("USERID for notifications: \(userID)")
        print("getting locations...")
        getLocations() { result, coordinates, provider  in
            if result {
                print("completed getting locations.")
                print(coordinates)
                let content = UNMutableNotificationContent()
                content.title = "You arrived at \(provider.first_name) \(provider.last_name)'s office."
                content.subtitle = ""
                content.sound = .default
                content.badge = 0
                
                //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
               
                /*
                let coordinates = CLLocationCoordinate2D(
                    latitude: 39.750576, longitude: -74.256797
                )
                */
                
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
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }
        
    }
    
    func cancelNotification() {
        //remove pending notifications
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        //remove notifications from users notification center
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
    
    func getLocations(completionHandler: @escaping (Bool, CLLocationCoordinate2D, Provider) -> Void) {
        UserService.shared.findProvider(provider_id: 123) { result, provider  in
            if result {
                Task {
                    let address: Address = provider!.address
                    await self.convertAddress(address: address) { result, coordinates  in
                        if result {
                            print(coordinates)
                            completionHandler(true, coordinates, provider!)
                        } else {
                            print(coordinates)
                            completionHandler(false, coordinates, provider!)
                        }
                    }
                    /*let coordinates = CLLocationCoordinate2D(
                        latitude: 39.750576, longitude: -74.256797
                    )*/
                }
                
            } else {
                let coordinates = CLLocationCoordinate2D(latitude: 0, longitude: 0)
               completionHandler(false, coordinates, provider!)
            }
        }
        
    }
    
    func convertAddress(address: Address, completionHandler: @escaping (Bool, CLLocationCoordinate2D) -> Void ) async {
        var location: CLLocation?
        let geocoder = CLGeocoder()
        print("\(address.address_1) \(address.address_2) \(address.city) \(address.state) \(address.zip)")
        

        do {
            let addressString = "\(address.address_1) \(address.address_2) \(address.city) \(address.state) \(address.zip)"
            let placemarks = try await geocoder.geocodeAddressString(addressString)
            
            if placemarks.count > 0 {
                location = placemarks.first?.location
                if let loc = location {
                    print (loc.coordinate.latitude)
                    print (loc.coordinate.longitude)
                    completionHandler(true, CLLocationCoordinate2D(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude))
                }
                else {
                    completionHandler(false, CLLocationCoordinate2D(latitude: 0, longitude: 0))
                }

            } else {
                completionHandler(false, CLLocationCoordinate2D(latitude: 0, longitude: 0))
            }
        }
        catch  {
            print("Error getting coordinates from address")
            completionHandler(false, CLLocationCoordinate2D(latitude: 0, longitude: 0))
        }
         
    }
}
