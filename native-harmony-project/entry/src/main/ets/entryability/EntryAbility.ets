import { window } from '@kit.ArkUI';
import { UniEntryAbility } from '@dcloudio/uni-app-x-runtime';
import { initUniModules } from '../uni_modules/index.generated';
import BuildProfile from 'BuildProfile';

const APP_ID = '__UNI__35453D1';

initUniModules();

export default class EntryAbility extends UniEntryAbility {
  onImport(path: string): Promise<void | Object> {
    return import(path);
  }

  constructor() {
    super(APP_ID, {
      debug: BuildProfile.DEBUG
    });
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    super.onWindowStageCreate(windowStage, false);

    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        return;
      }
    });
  }
}
