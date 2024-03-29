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
    let appModel = AppService.shared
    
    private(set) lazy var apolloClient: ApolloClient = {
        let url = URL(string: "\(appModel.graphqlURL)")!

        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["x-api-key": "\(appModel.graphql_xapikey)"] // Add your headers here

        let client = URLSessionClient(sessionConfiguration: configuration)
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = DefaultInterceptorProvider(client: client, store: store)
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)

        return ApolloClient(networkTransport: networkTransport, store: store)
        
    }()
}
