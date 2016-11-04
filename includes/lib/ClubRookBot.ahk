class ClubRookBot {
  TITLE := ""
  EXIT_PAGE := ""
  detector := ""

  __new(theDetector) {
    this.TITLE := "FANTASICA IMAGES/ClubRookPage/title.png"
    this.EXIT_PAGE := "FANTASICA IMAGES/ClubRookPage/back.png"
    this.detector := theDetector
  }

  isClubRookPage() {
    if (this.detector.detect(this.TITLE)) {
      return true
    }
    else {
      return false
    }
  }

  mainPage() {
    if (this.detector.detect(this.EXIT_PAGE)) {
      clickAt(this.detector.foundPoint[1], this.detector.foundPoint[2])
    }
  }

  play() {
    if (this.isClubRookPage()) {
      this.mainPage()
    }
  }
}
