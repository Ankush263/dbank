import { dbank } from "../../declarations/dbank"

window.addEventListener("load", async () => {
  update()
})

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault()
  // console.log(topupAmount)

  const button = event.target.querySelector("#submit-btn")

  const topupAmount = parseFloat(document.getElementById("input-amount").value)
  const withdrawlAmount = parseFloat(document.getElementById("withdrawal-amount").value)

  button.setAttribute("disabled", true)

  if(document.getElementById("input-amount").value.length != 0){
    await dbank.topUp(topupAmount)
  }
  if(document.getElementById("withdrawal-amount").value.length != 0){
    await dbank.withdraw(withdrawlAmount)
  }

  update()

  document.getElementById("input-amount").value = ""
  document.getElementById("withdrawal-amount").value = ""
  button.removeAttribute("disabled")
})

async function update() {
  const currentAmount = await dbank.checkBalance()
  document.getElementById("value").innerText = currentAmount.toFixed(2)
}