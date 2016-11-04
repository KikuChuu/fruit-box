class AppPlayerBot {
  FANTASICA := ""
  APP_DRAWER := ""
  ALL_APPS_TITLE := ""
  RECENTLY_PLAYED_TITLE := ""
  detector := ""

  __new(theDetector) {
    this.FANTASICA := "FANTASICA IMAGES/AppPlayer/fantasica.png"
    this.APP_DRAWER := "FANTASICA IMAGES/AppPlayer/app_drawer.png"
    this.ALL_APPS_TITLE := "FANTASICA IMAGES/AppPlayer/all_apps.png"
    this.RECENTLY_PLAYED_TITLE := "FANTASICA IMAGES/AppPlayer/recently_played.png"
    this.detector := theDetector
  }

  isHomeScreen() {
    if (this.detector.detect(this.RECENTLY_PLAYED_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isInstalledAppsScreen() {
    if (this.detector.detect(this.ALL_APPS_TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  isFantasicaRecentlyPlayed() {
    if (this.isHomeScreen()) {
      if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
        return true
      }
      else {
        return false
      }
    }
    else {
      return false
    }
  }

  isFantasicaInstalled() {
    if (this.isInstalledAppsScreen()) {
      if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
        return true
      }
      else {
        return false
      }
    }
  }
  else {
    return false
  }

  installedApps() {
    if (this.detector.detect(this.APP_DRAWER)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  startFantasica() {
    if (this.detector.detect(this.FANTASICA, 0, 0, 150)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isHomeScreen()) {
      if (this.isFantasicaRecentlyPlayed()) {
        this.startFantasica()
      }
      else {
        this.installedApps()
      }
    }
    else if (this.isInstalledAppsScreen()) {
      if (this.isFantasicaInstalled()) {
        this.startFantasica()
      }
      else {
        MsgBox % "Fantasica is not yet installed. Verify that it's properly installed and start it once."
        ExitApp ; Exit program on failure
      }
    }
  }
}
