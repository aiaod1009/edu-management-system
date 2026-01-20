@Component
export struct Mine {
  build() {
    Column() {
      Text('Mine')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}