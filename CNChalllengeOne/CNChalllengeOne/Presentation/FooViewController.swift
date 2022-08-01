//
//  FooViewController.swift
//  CNChalllengeOne
//
//  Created by Guglielmo Deletis on 01/08/22.
//

import UIKit

class FooViewController: UIViewController {
    private var foo:Foo
    // we want VC to be istantiated with custom init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    /*
     The init function accepts a Foo, that actually just loads and stores Item or ComicBook item
     To display items into a TableView, I can expands CNItemFoo & CNComicBookFoo with functions to init custom UITableViewCell or
     inject another dependency that performs this kind of operations
     */
    init(foo: Foo) {
        self.foo = foo
        // pretend there is a FooViewController.xib file
        super.init(nibName: "FooViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // start loading
        foo.delegate = self
        foo.fetchItems()
    }
}

extension FooViewController: FooDelegate {
    func didStartLoading() {
        // show loading
    }
    
    func didCompleteLoading(items: [FetchableItem]) {
        // hide loading
        // update UI (tableView.reload)
    }
    
    func didFailLoading(withError error: Error?) {
        // hide loading
        // show error
    }
}
