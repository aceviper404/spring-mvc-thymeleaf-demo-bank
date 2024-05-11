const transactType = document.querySelector("#transact-type");

const paymentCard = document.querySelector(".payment-card");
const transferCard = document.querySelector(".transfer-card");
const depositCard = document.querySelector(".deposit-card");
const withdrawCard = document.querySelector(".withdraw-card");

transactType.addEventListener("change", ()=>{
    //check for transaction type and display form
    switch(transactType.value){
        case "payment":
            paymentCard.style.display = "block";
            transferCard.style.display = "none";
            depositCard.style.display = "none";
            withdrawCard.style.display = "none";
            break;
        case "transfer":
            paymentCard.style.display = "none";
            transferCard.style.display = "block";
            depositCard.style.display = "none";
            withdrawCard.style.display = "none";
            break;
        case "deposit":
            paymentCard.style.display = "none";
            transferCard.style.display = "none";
            depositCard.style.display = "block";
            withdrawCard.style.display = "none";
            break;
        case "withdraw":
            paymentCard.style.display = "none";
            transferCard.style.display = "none";
            depositCard.style.display = "none";
            withdrawCard.style.display = "block";
            break;
    }
})