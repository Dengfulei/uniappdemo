import { openUniApp } from '@dcloudio/uni-app-x-runtime';

const APP_ID = '__UNI__35453D1';

@Entry
@Component
struct Index {
  private launched: boolean = false;

  aboutToAppear(): void {
    if (this.launched) {
      return;
    }
    this.launched = true;

    openUniApp(APP_ID, {
      animationType: 'none'
    });
  }

  build() {

    Column()
      .width('100%')
      .height('100%')
  }
}
