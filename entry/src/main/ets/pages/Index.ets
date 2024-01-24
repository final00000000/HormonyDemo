import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State msg: string = '模仿Hello World'

  build() {
    Column() {
      /*文字*/
      Text(this.msg)
        .fontSize(24)
        .height(50)
        .margin({ top: 10, bottom: 10 })
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Black)
        .fontWeight(FontWeight.Bold)
      /*输入框*/
      TextInput({ placeholder: "请输入数字" })
        .type(InputType.Number)
        .borderColor(Color.Yellow)
        .fontColor(Color.Green)
        .height(50)
        .margin(24)
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Start)
      Text($r('app.string.Login_Activity'))
        .fontSize(14)
        .margin({ top: 10, bottom: 10 })
        .padding(5)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          console.warn("测试=>点击事件")
          router.pushUrl({
            url: "pages/LoginActivity"
          })
        })
    }.backgroundColor(Color.Pink).width('100%') /*.height(200)*/
  }
}