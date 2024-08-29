import { Controller } from "stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static targets = ["messages", "input", "form"]

  connect() {
    this.chatroomId = this.data.get("chatroomId")
    this.subscription = consumer.subscriptions.create(
      { channel: "ChatroomChannel", chatroom_id: this.chatroomId },
      {
        received: this.receive.bind(this)
      }
    )
  }

  disconnect() {
    this.subscription.unsubscribe()
  }

  receive(data) {
    const messageElement = document.createElement("div")
    messageElement.innerHTML = `<p><strong>${data.user}:</strong> ${data.message}</p>`
    this.messagesTarget.appendChild(messageElement)
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
  }

  sendMessage(event) {
    event.preventDefault()
    const message = this.inputTarget.value
    if (message.trim() === "") return

    this.subscription.perform("speak", { message: message })
    this.inputTarget.value = ""
  }
}
