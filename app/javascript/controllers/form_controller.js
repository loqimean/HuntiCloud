import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    fileFieldSelector: String,
    pictureContainerSelector: String
  }

  handlePictureUpload(e) {
    const [file] = e.target.files;

    this.pictureContainer.style.backgroundSize = 'cover';
    this.pictureContainer.style.backgroundPosition = 'center';
    this.pictureContainer.style.backgroundImage = `url(${URL.createObjectURL(file)}`;
  }

  get fileField() {
    return this.element.querySelector(this.fileFieldSelectorValue)
  }

  get pictureContainer() {
    return this.element.querySelector(this.pictureContainerSelectorValue)
  }
}
