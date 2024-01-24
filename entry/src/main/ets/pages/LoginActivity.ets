import promptAction from '@ohos.promptAction';
import router from '@ohos.router';
import inputMethod from '@ohos.inputMethod';

@Entry
@Component
struct LoginActivity {
  @State isCheck: boolean = false;
  private account: String = ''
  private psw: String = ''

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon'))
          .width(40)
          .height(40)
          .margin(10)
        Text($r('app.string.Login_Title'))
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
      }.align(Alignment.Center).margin(40)

      TextInput({ placeholder: "请输入账号" })
        .fontSize(14)
        .fontColor($r('app.color.Color_000000'))
        .margin({ left: 24, right: 24 })
        .type(InputType.Normal)
        .maxLength(16)
        .onChange((values: String) => {
          this.account = values
          console.log("测试Account：" + values.toString())
        })
      TextInput({ placeholder: "请输入密码" })
        .fontSize(14)
        .id("tv_input_psw")
        .fontColor($r('app.color.Color_000000'))
        .margin({ top: 24, left: 24, right: 24 })
        .type(InputType.Password)
        .maxLength(16)
        .onChange((values: String) => {
          this.psw = values
          console.log("测试psw：" + values.toString())
        })
      Row() {
        Image($r('app.media.icon_bind_unchecked'))
          .width(20).height(20)
        Text("我已阅读并同意").margin({ left: 5 })
        Text("《隐私政策》")
          .fontColor(Color.Blue)
          .fontSize(14)
        Text("和")
        Text("《服务协议》")
          .fontColor(Color.Blue)
          .fontSize(14)
      }.margin(24).align(Alignment.Center)

      Text("登录")
        .fontSize(16)
        .height(55)
        .width('100%')
        .margin(32)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Black)
        .onClick(() => {
          let inputMethodController = inputMethod.getController();
          inputMethodController.hideSoftKeyboard((err) => {
            if (err === undefined) {
              console.info('测试：Succeeded in hiding softKeyboard.');
            } else {
              console.error('测试：Failed to hideSoftKeyboard: ' + JSON.stringify(err));
            }
          })
          if (this.account == '' || this.account.length > 12) {
            this.account = ''
            promptAction.showToast({ message: "账号最大输入16位，请重新输入" })
            return
          }
          if (this.psw == '' || this.psw.length > 12) {
            this.psw = ''
            promptAction.showToast({ message: "密码最大输入16位，请重新输入" })
            return
          }

          if (this.account != '' && this.account == "admin" && this.psw != '' && this.psw == "admin123") {
            promptAction.showToast({ message: "登陆成功" })
            console.info("测试登录：" + this.account.toString() + "  Psw：" + this.psw.toString())
            router.pushUrl({
              url: "pages/MainActivity"
            }).then(() => {

            })
          } else {
            promptAction.showToast({ message: "账号或密码错误，请重新输入" })
          }

        })
    }.width('100%').backgroundColor($r('app.color.Color_F5F5F6')).height('100%')

  }
}

class verifyAccountPsw {
  jumpToMain(Account: String, Psw: String) {

  }
}