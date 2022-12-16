//
//  SharedRequests.swift
//  HousePlantClassification
//
//  Created by Burak Emre gündeş on 12.12.2022.
//

import Foundation


struct AuthPair: Codable {
    let deviceId: Int
    let authString: String
}

struct NetworkingConstants {
    
    /*#if DEBUG
    static let carlinURL = "https://carlin-dev.rentcarla.com/"
    static let secureCarlinURL =  "https://carlin-dev.rentcarla.com/s/"
    static let eventsUrl = "https://yeoium3i79.execute-api.eu-west-1.amazonaws.com/default/event-producer-http"
    #else
    static let carlinURL = "https://carlin.rentcarla.com/"
    static let secureCarlinURL = "https://carlin.rentcarla.com/s/"
    static let eventsUrl = "https://akzhdplyec.execute-api.eu-west-1.amazonaws.com/default/event-producer-prod"
    #endif*/
    
    static let PASURL = "http://localhost:5050/"

    
    static var authHeader: [String : String]? {
        let authHeader = ["Authorization": "Bearer",
                          "Content-Type": "application/json"]
        return authHeader
    }
    
    static let jsonHeader = ["Content-Type": "application/json"]
    
    
    static let rawRequestList = ["insuranceQuote/","searchPlaces/","makePrecheckoutModifications/","saveSocialIdentifierInfo/","updateCardInfoPermission/","getUsableCreditAmount","declineAlternative","supportWithPayment","support"]
}




struct GetDailies : CodableReturningRequest, ErrorLoggableRequest{
    typealias ResponseType = Either<DailyResponse, DASError>
    
    var data: RequestData {
    let path = NetworkingConstants.PASURL + "api/v1/dailies"
    return RequestData(path: path, method: .get, params: nil, headers: NetworkingConstants.authHeader)
    }
}


