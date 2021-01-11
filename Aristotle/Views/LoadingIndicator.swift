//
//  LoadingIndicator.swift
//  Aristotle
//
//  Created by Sayak Khatua on 11/01/21.
//

import SwiftUI

struct LoadingIndicator: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView

    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<LoadingIndicator>) -> LoadingIndicator.UIViewType {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ view: LoadingIndicator.UIViewType, context: UIViewRepresentableContext<LoadingIndicator>) {
        view.startAnimating()
    }
    
}
