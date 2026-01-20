@Component
export struct Home {
  build() {
    Column() {
      Text('Home')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}