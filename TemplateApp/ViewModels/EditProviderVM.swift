//
//  EditProviderVM.swift
//  TemplateApp
//
//  Created by Meghan Granit on 3/12/24.
//

import Foundation
class EditProviderVM: ObservableObject {
    //let userModel = UserService.shared
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var address: String = ""
    @Published var city: String = ""
    @Published var state: String = "RI"
    @Published var zip: String = ""

    
    @Published var statesArr: [StateInfo] = [StateInfo(abbr: "AL", name: "Alabama"), StateInfo(abbr: "AK", name: "Alaska"), StateInfo(abbr: "AZ", name: "Arizona"), StateInfo(abbr: "AR", name: "Arkansas"), StateInfo(abbr: "CA", name: "California"), StateInfo(abbr: "CO", name: "Colorado"), StateInfo(abbr: "CT", name: "Connecticut"), StateInfo(abbr: "DE", name: "Delaware"), StateInfo(abbr: "FL", name: "Florida"), StateInfo(abbr: "GA", name: "Georgia"), StateInfo(abbr: "HI", name: "Hawaii"), StateInfo(abbr: "ID", name: "Idaho"), StateInfo(abbr: "IL", name: "Illinois"), StateInfo(abbr: "IN", name: "Indiana"), StateInfo(abbr: "IA", name: "Iowa"), StateInfo(abbr: "KS", name: "Kansas"), StateInfo(abbr: "KY", name: "Kentucky"), StateInfo(abbr: "LA", name: "Louisiana"), StateInfo(abbr: "ME", name: "Maine"), StateInfo(abbr: "MD", name: "Maryland"), StateInfo(abbr: "MA", name: "Massachusetts"), StateInfo(abbr: "MI", name: "Michigan"), StateInfo(abbr: "MN", name: "Minnesota"), StateInfo(abbr: "MS", name: "Mississippi"), StateInfo(abbr: "MO", name: "Missouri"), StateInfo(abbr: "MT", name: "Montana"), StateInfo(abbr: "NE", name: "Nebraska"), StateInfo(abbr: "NV", name: "Nevada"), StateInfo(abbr: "NH", name: "New Hampshire"), StateInfo(abbr: "NJ", name: "New Jersey"), StateInfo(abbr: "NM", name: "New Mexico"), StateInfo(abbr: "NY", name: "New York"), StateInfo(abbr: "NC", name: "North Carolina"), StateInfo(abbr: "ND", name: "North Dakota"), StateInfo(abbr: "OH", name: "Ohio"), StateInfo(abbr: "OK", name: "Oklahoma"), StateInfo(abbr: "OR", name: "Oregon"), StateInfo(abbr: "PA", name: "Pennsylvania"), StateInfo(abbr: "RI", name: "Rhode Island"), StateInfo(abbr: "SC", name: "South Carolina"), StateInfo(abbr: "SD", name: "South Dakota"), StateInfo(abbr: "TN", name: "Tennessee"), StateInfo(abbr: "TX", name: "Texas"), StateInfo(abbr: "UT", name: "Utah"), StateInfo(abbr: "VT", name: "Vermont"), StateInfo(abbr: "VA", name: "Virginia"), StateInfo(abbr: "WA", name: "Washington"), StateInfo(abbr: "WV", name: "West Virginia"), StateInfo(abbr: "WI", name: "Wisconsin"), StateInfo(abbr: "WY", name: "Wyoming")]
    
    init() {
        /*
         firstName = userModel.currentPatient?.patient_name.first ?? ""
         lastName = userModel.currentPatient?.patient_name.last ?? ""
         address = userModel.currentPatient?.address.address_1 ?? ""
         city = userModel.currentPatient?.address.city ?? ""
         state = userModel.currentPatient?.address.state ?? ""
         zip = userModel.currentPatient?.address.zip ?? ""

         */
    }
}
