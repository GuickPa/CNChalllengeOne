//
//  NetworkManager.swift
//  CNChalllengeOne
//
//  Created by Guglielmo Deletis on 01/08/22.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func didStartLoading(forUrl url:URL)
    func didCompleteLoading(forUrl url:URL, withData data: Data?)
    func didFailLoading(forUrl url:URL, withError error: Error?)
}

protocol NetworkManager {
    var delegate: NetworkManagerDelegate? { get set }
    
    func httpGetRequest(withUrl url:URL)
}

class CNNetworkManager: NetworkManager {
    weak private var _delegate: NetworkManagerDelegate?
    weak var delegate: NetworkManagerDelegate? {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    private var url:URL?
    
    func httpGetRequest(withUrl url:URL) {
        self.url = url
        //message to delegate
        self.delegate?.didStartLoading(forUrl: url)
        // start url request
        // ...
        // callback for successful loading
        let resultData:Data = Data()
        self.delegate?.didCompleteLoading(forUrl: self.url!, withData: resultData)
        // callback for error
        self.delegate?.didFailLoading(forUrl: self.url!, withError: nil)
    }
}
