@Component
export struct Mine {
  build() {
    Stack() {
      // 底层：全屏背景图
      Image($r('app.media.mineBg'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column() {
        Swiper() {
          Image($r('app.media.fig1'))
          Image($r('app.media.fig2'))
          Image($r('app.media.fig3'))
        }
        .width('100%')
        .height('200')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
  }
}