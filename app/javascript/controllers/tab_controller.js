import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['bar']

  connect() {
    const side = document.querySelector(".dashboard-container");
    const sideIndex = parseInt(side.dataset.index);
    const bars = this.barTargets;
    const currentTab = bars[sideIndex];
    currentTab.classList.add("tab-active");
  }
}
