//
//  URLSession+synchronousDataTask.swift
//  Connection
//
//  Created by Nikolay Khramchenko on 1/13/17.
//  Copyright © 2017 nx. All rights reserved.
//

extension URLSession {
    
    func synchronousDataTask(with request: URLRequest) -> Data! {
        let semaphore = DispatchSemaphore(value: 0);
        var responseData: Data?;
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            responseData = data;
            semaphore.signal();
            }.resume();
        _ = semaphore.wait(timeout: .distantFuture);
        if (responseData == nil) {
            return nil;
        }
        return responseData;
    }
    
}
