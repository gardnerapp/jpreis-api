import { Controller } from "@hotwired/stimulus"
import { FetchRequest } from '@rails/request.js'

export default class extends Controller {

    static targets = ["address", "username", "password", "authToken", "error"]

    async login() {

        const address = this.addressTarget.value
        const username = this.usernameTarget.value
        const password = this.passwordTarget.value


        const request = new FetchRequest('post', '/api/v1/bluewave/login', {
            body: JSON.stringify({address: address, username: username, password: password})
        })

        const response = await request.perform()
        if(response.ok){
            const body = await response.text
            const parsed = JSON.parse(body)
            this.authTokenTarget.value = parsed.auth_token
        }else{
            this.errorTarget.textContent = "Oops Something Went Wrong! Pleaser review the " +
                "console/rails logs for more details"
            console.log(response)
        }

    }
}