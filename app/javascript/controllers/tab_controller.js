import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['bar']

  connect() {
    const side = document.querySelector(".dashboard-container")
    const sideIndex = parseInt(side.dataset.index)
    console.log(sideIndex)

    const bars = this.barTargets
    console.log(bars)
    const currentTab = bars[sideIndex]
    currentTab.classList.add("tab-active")

  }
}
