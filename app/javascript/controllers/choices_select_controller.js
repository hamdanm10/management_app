import { Controller } from "@hotwired/stimulus";
import Choices from "choices.js";

// Connects to data-controller="choices-select"
export default class extends Controller {
  connect() {
    this.instances = [];

    this.element.querySelectorAll("select.choices-select").forEach((select) => {
      if (select.dataset.choicesInitialized === "true") return;

      const instance = new Choices(select, {
        allowHTML: true,
        classNames: {
          containerOuter: ["choices", "mb-0", "p-0"],
          containerInner: [
            "block",
            "w-full",
            "p-2",
            "text-gray-700",
            "border",
            "border-gray-300",
            "rounded-lg",
            "bg-white",
            "text-sm",
            "focus:ring-blue-500",
            "focus:border-blue-500",
          ],
          list: ["max-h-50", "overflow-y-auto"],
          listDropdown: ["choices__list--dropdown", "max-h-96"],
          listSingle: ["p-0"],
        },
        itemSelectText: "",
      });

      select.dataset.choicesInitialized = "true";
      this.instances.push(instance);
    });
  }

  disconnect() {
    this.instances?.forEach((instance) => instance.destroy());
  }
}
