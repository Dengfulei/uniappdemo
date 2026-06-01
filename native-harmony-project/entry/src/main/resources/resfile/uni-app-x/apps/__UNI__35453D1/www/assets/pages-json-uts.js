const PagesIndexIndex = () => import("./pages/index/index.js");
const PagesLoginLogin = () => import("./pages/login/login.js");
__definePage("pages/index/index", PagesIndexIndex);
__definePage("pages/login/login", PagesLoginLogin);
