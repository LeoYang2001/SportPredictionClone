import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AVPlayerViewController {
            let controller = AVPlayerViewController()
            
            // Load the resource
            let fileUrl = Bundle.main.url(forResource: "videoBg", withExtension: "mp4")!
            let player = AVPlayer(url: fileUrl)
            
            // Set the player to loop the video
            player.actionAtItemEnd = .none
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { _ in
                player.seek(to: .zero)
                player.play()
            }
            
            controller.player = player
            controller.videoGravity = .resizeAspectFill
            
            // Start playing the video
            player.play()
            
            // Set the frame to match screen bounds
            controller.view.frame = UIScreen.main.bounds
            
            return controller
        }


    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            PlayerView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.themeColor(1))
            .edgesIgnoringSafeArea(.all)

        
    }
}

