import { Controller } from "@hotwired/stimulus"

export default class extends Controller{

    static targets=["dataContent"]
    static classes=["none"]

    connect(){
        this.dataContentTarget.classList.add(this.noneClass)
    }

    dataClicked(){
        this.dataContentTarget.classList.toggle(this.noneClass)
    }
}