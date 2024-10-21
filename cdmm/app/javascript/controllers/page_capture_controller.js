import { Controller } from "@hotwired/stimulus"
import html2canvas from "html2canvas";

// Connects to data-controller="page-capture"
export default class extends Controller {
  static targets = [ 'table' ];

  connect() {
  }

  capture() {
    window.scrollTo(0, 0);
    html2canvas(this.tableTarget).then(function (canvas) {
      const screenshot = canvas.toDataURL("image/png");
      const downloadLink = document.createElement('a');
      downloadLink.download = 'canvas_image.png';
      downloadLink.href = screenshot;
      downloadLink.click();
    });
  }
}
