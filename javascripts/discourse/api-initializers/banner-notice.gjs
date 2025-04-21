import { addGlobalNotice } from "discourse/components/global-notice";
import { apiInitializer } from "discourse/lib/api";

export default apiInitializer((api) => {
  const router = api.container.lookup("service:router");

  router.on("routeDidChange", () => {
    if (router.currentRouteName === "login") {
      const notice =
        "SSO has been disabled. Please set up your local login password using the 'Forgot Password' option.";

      addGlobalNotice(notice, "critical-deprecation", {
        dismissable: true,
        dismissDuration: moment.duration(1, "day"),
        level: "normal",
      });
    }
  });
});
