@Entry
@Component
struct Index {
  @State message: string = '鸿蒙';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
        .fontColor(Color.Red)
Column() {

  Image($r('app.media.startIcon'))
    .width(100)

  Text('文本组件')
}
    }
    .height('100%')
    .width('100%')
  }
}