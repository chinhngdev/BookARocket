//
//  NetworkInterceptorProvider.swift.swift
//  BookARocket
//
//  Created by Chinh on 4/25/25.
//

import Foundation
import Apollo
import ApolloAPI

final class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
    
}
