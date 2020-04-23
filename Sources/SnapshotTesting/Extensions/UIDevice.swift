//
//  UIDevice.swift
//  SnapshotTestingTests_iOS
//
//  Created by Ashok Uradnicek on 24/04/2020.
//

import UIKit

extension UIDevice {

  static var identifier: String = {
    var systemInfo = utsname()
    uname(&systemInfo)
    let mirror = Mirror(reflecting: systemInfo.machine)

    let identifier = mirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    return identifier
  }()
}
