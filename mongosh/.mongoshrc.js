() => {
  // Support for colors
  // NPM install chalk where mongosh can find it
  // (or set NODE_PATH to where the global modules are installed)
  const chalk = require("chalk");

  _prompt = () => {
    try {
      db.getMongo();
    } catch {
      return chalk.blue("\uf701") + " →  ";
    }
    const dbName = db.getName();
    const serverBuildInfo = db.serverBuildInfo();
    const readPref = db.getMongo().getReadPrefMode();
    const atlas = /mongodb.net/.test(db.getMongo()._uri);
    const rpTagSet = db.getMongo().getReadPrefTagSet();
    const analyticsNode = rpTagSet
      ? rpTagSet.findIndex(({ nodeType }) => nodeType === "ANALYTICS") >= 0
      : false;
    const localhost = /localhost|127\.0\.0\.1/.test(db.getMongo()._uri);
    //const isSecondary = !!db.hello().secondary;
    let hasPrimary;
    try {
      hasPrimary = !!rs.status().members.find(({ state }) => state === 1);
    } catch {
      // Fails when not started as replica set
      hasPrimary = true;
    }
    const leaf = "\ue7a4";
    const laptop = "\uf109";
    const ship = "\uf2cd";

    let serverInfo = "";
    if (serverBuildInfo.dataLake) {
      serverInfo += chalk.green(ship) + " ";
    } else if (serverBuildInfo.modules.includes("enterprise")) {
      serverInfo += `${atlas ? chalk.green("\uf0c2") : "Enterprise"} `;
    } else if (localhost) {
      serverInfo += chalk.blue(laptop) + " ";
    }

    return `${serverInfo}${hasPrimary ? "₁" : "₂"} \uf831 ${readPref} ${
      analyticsNode ? chalk.cyan("\uf080 ") : ""
    } \ue706 ${dbName} → `;
  };

  boringPrompt = () => {
    prompt = undefined;
  };
  prettyPrompt = () => {
    prompt = _prompt;
  };
  prettyPrompt();
};
