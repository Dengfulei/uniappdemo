const __uniConfig = {"pages":[],"globalStyle":{"navigationBarTextStyle":"black","navigationBarTitleText":"uni-app-x demo","navigationBarBackgroundColor":"#f6f1e8","backgroundColor":"#f6f1e8"},"appname":"uniappdemo","compilerVersion":"5.07","entryPagePath":"pages/index/index","entryPageQuery":"","realEntryPagePath":"","themeConfig":{}};
__uniConfig.getTabBarConfig = () =>  {return undefined};
__uniConfig.tabBar = __uniConfig.getTabBarConfig();
const __uniRoutes = [{"path":"pages/index/index","meta":{"isQuit":true,"isEntry":true,"navigationBarTitleText":"精选商品","navigationBarBackgroundColor":"#f6f1e8","navigationBarTextStyle":"black"}},{"path":"pages/login/login","meta":{"navigationBarTitleText":"登录","navigationBarBackgroundColor":"#ead9bd","navigationBarTextStyle":"black"}}].map(uniRoute=>(uniRoute.meta.route=uniRoute.path,__uniConfig.pages.push(uniRoute.path),uniRoute.path='/'+uniRoute.path,uniRoute)).concat(typeof __uniSystemRoutes !== 'undefined' ? __uniSystemRoutes : []);

