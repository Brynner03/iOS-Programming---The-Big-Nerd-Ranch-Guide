// 
//  Copyright © 2020 Big Nerd Ranch
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!

    var photoDescription: String?
    
    func update(displaying image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }

    override var isAccessibilityElement: Bool {
        get {
            return true
        }
        set {
            //no op
        }
    }

    override var accessibilityLabel: String? {
        get {
            return photoDescription
        }
        set {
            // Ignore attempts to set
        }
    }

    override var accessibilityTraits: UIAccessibilityTraits {
        get {
            return super.accessibilityTraits.union([.image, .button])
        }
        set {
            // Ignore attempts to set
        }
    }
    
}
