//
//  Foo.swift
//  CNChalllengeOne
//
//  Created by Guglielmo Deletis on 01/08/22.
//

import Foundation

/*
 Foo became a protocol with delegate for action.
 Foo will perform async actions, like fetching from remote and save data into DB
 Delegate will be warn when actions started, completed or failed
 */

protocol FooDelegate: AnyObject {
    func didStartLoading()
    func didCompleteLoading(items: [FetchableItem])
    func didFailLoading(withError error: Error?)
}

protocol Foo {
    var delegate: FooDelegate? { get set }
    
    func fetchItems()
    func saveItemsFromData(data: Data)
    func onLoadingError(error: Error?)
}
