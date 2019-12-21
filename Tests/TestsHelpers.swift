//
//  Created by Jérôme Alves on 20/12/2019.
//  Copyright © 2019 TwentyLayout. All rights reserved.
//

@_exported import Foundation
@_exported import UIKit
@_exported import XCTest
@_exported @testable import TwentyLayout

final class DetailView: UIView {
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    init() {
        super.init(frame: .zero)
        addSubviews(titleLabel, subtitleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class ContainerView: UIView {
    var container: UIView { return self }
    let image = UIImageView()
    let detail = DetailView()
    init() {
        super.init(frame: .zero)
        addSubviews(image, detail)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct Result {
    let views: ContainerView
    let constraints: [NSLayoutConstraint]
}

func makeConstraints(_ make: (ContainerView) -> Void) -> Result {
    let views = ContainerView()
    let layout = Layout {
        make(views)
    }
    return Result(
        views: views,
        constraints: layout.constraints.map { $0.makeNSLayoutConstraint() }
    )
}

func XCTAssertEqual(_ lhs: AnyObject?, _ rhs: AnyObject, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(lhs === rhs, file: file, line: line)
}