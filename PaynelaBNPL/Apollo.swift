//
//  Apollo.swift
//  PaynelaBNPL
//
//  Created by Meghan Granit on 3/26/24.
//

import Foundation
import Apollo

class Network {
   static let shared = Network()

    
    private(set) lazy var apolloClient: ApolloClient = {
        let url = URL(string: "https://h4d3rx75vfejtmgih2bnp6ewya.appsync-api.us-east-2.amazonaws.com/graphql")!

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["x-api-key": "da2-dygs23ujtfer7f276227o6vrxi"] // Add your headers here

        let client = URLSessionClient(sessionConfiguration: configuration)
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        return ApolloClient(networkTransport: networkTransport, store: store)
        
    }()
}
