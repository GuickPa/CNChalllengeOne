//
//  CNItemFoo.swift
//  CNChalllengeOne
//
//  Created by Guglielmo Deletis on 01/08/22.
//

import Foundation

class CNItemFoo: Foo {
    weak private var _delegate: FooDelegate?
    weak var delegate: FooDelegate? {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    private var networkManager:NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.networkManager.delegate = self
    }
}

extension CNItemFoo {
    func fetchItems(){
        guard let url = URL(string: "some url") else {
            self.delegate?.didFailLoading(withError: nil)
            return
        }
        self.networkManager.httpGetRequest(withUrl: url)
    }
    
    func saveItemsFromData(data: Data) {
        // converts data into item list and save them into DB
        // should implements some checks to avoid duplicates error, deleted items, etc.
        let items:[Item] = []
        // message to delegate
        DispatchQueue.main.async {
            self.delegate?.didCompleteLoading(items: items)
        }
    }
    
    func onLoadingError(error: Error?) {
        DispatchQueue.main.async {
            self.delegate?.didFailLoading(withError: error)
        }
    }
}

extension CNItemFoo: NetworkManagerDelegate {
    func didStartLoading(forUrl url: URL) {
        DispatchQueue.main.async {
            self.delegate?.didStartLoading()
        }
    }
    
    func didCompleteLoading(forUrl url: URL, withData data: Data?) {
        guard let data = data else { return }
        self.saveItemsFromData(data: data)
    }
    
    func didFailLoading(forUrl url: URL, withError error: Error?) {
        self.onLoadingError(error: error)
    }
}
