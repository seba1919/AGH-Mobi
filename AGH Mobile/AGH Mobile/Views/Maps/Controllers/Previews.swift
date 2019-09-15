//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

#if canImport(SwiftUI)
#if DEBUG
import SwiftUI

struct MapsViewControllerPreviews : PreviewProvider, UIViewControllerRepresentable {
    
    // MARK: - PreviewProvider
    
    static var previews: some View {
        return Group {
            MapsViewControllerPreviews()
                .previewDevice("iPhone XS Max")
                .previewDisplayName("iPhone XS Max")
            MapsViewControllerPreviews()
                .previewDevice("iPhone 7 Plus")
                .previewDisplayName("iPhone 7 Plus")
            MapsViewControllerPreviews()
            .previewDevice("iPhone 7")
            .previewDisplayName("iPhone 7")
            MapsViewControllerPreviews()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
    
    // MARK: - UIViewControllerRepresentable
    
    typealias UIViewControllerType = MapsViewController
    
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<MapsViewControllerPreviews>
        ) -> MapsViewController {
        MapsViewController()
    }
    
    func updateUIViewController(_ uiViewController: MapsViewController,
                                context: UIViewControllerRepresentableContext<MapsViewControllerPreviews>) {
        
    }
}
#endif
#endif
