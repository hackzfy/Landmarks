/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view displaying information about a hike, including an elevation graph.
 */

import SwiftUI


// 动画过渡
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        // 非对称动画
        AnyTransition.asymmetric(
            // 出现：右边缘 + 透明度
            insertion: .move(edge: .trailing).combined(with: .opacity),
            // 消失： 缩放 + 透明度
            removal: .scale.combined(with: .opacity))
    }
}


struct HikeView: View {
    var hike: Hike
    // State 表示可以被 SwiftUI 读写的属性
    @State private var showDetail = true
    
    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        // SwiftUI 读写 showDetail 属性
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                // transition is about how the view appears and removed from the container.
                // animation is about the process of the changing graphic
                    .transition(.moveAndFade)
            }
        }
    }
}

struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
