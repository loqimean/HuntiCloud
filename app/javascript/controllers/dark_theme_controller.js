import { Controller } from "@hotwired/stimulus";
import { getCookie, setCookie } from "custom/cookies";

export default class extends Controller {
  static targets = ['sun', 'moon'];

  connect(e) {
    this.themeCookieName = 'dark_theme';
    this.isDarkThemeByCookie = getCookie(this.themeCookieName);

    if (this.isDarkThemeByCookie === undefined) {
      setCookie(this.themeCookieName, this.isDarkTheme);
    }
  }

  toggleTheme(e) {
    document.documentElement.classList.toggle('dark');
    this.sunTarget.classList.toggle('hidden');
    this.moonTarget.classList.toggle('hidden');

    setCookie(this.themeCookieName, this.isDarkTheme);
  }

  get currentThemeByCoockie() {
    getCookie(this.themeCookieName);
  }

  get isDarkTheme() {
    return [...document.documentElement.classList].includes('dark');
  }
}
