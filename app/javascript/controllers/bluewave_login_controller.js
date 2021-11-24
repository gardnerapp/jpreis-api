import { Controller } from "@hotwired/stimulus"


export default class extends Controller {

    static targets = ["address", "username","password", "authToken"]

    // 2. Make API call to targets
    /// 3. append authtoken to box valjue 

    login(){
        const address = this.addressTarget.value
        const userName = this.userNameTarget.value
        const password = this.passwordTarget.value
    }
}