@Entry
@Component
export struct Home {
  build() {
    Stack() {
      // 底层：全屏背景图
      Image($r('app.media.mineBg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

        Column() {
          // 1. 轮播图部分
          Swiper() {
            Image($r('app.media.fig1'))
            Image($r('app.media.fig2'))
            Image($r('app.media.fig3'))
            Image($r('app.media.fig4'))
          }
          .borderRadius(16) // 圆角
          .width('100%')
          .height('200')
          .autoPlay(true)
          .interval(3000)// 间隔
          .vertical(false) // 垂直滚动
          .loop(true) // 循环

          //  2.宫格部分

        }
        .width('100%')
        .height('100%')
        .padding({
          top: 10,
          left: 15,
          right: 15
        })
        // .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
      }


  }
}