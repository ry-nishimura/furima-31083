const pay = () => {
  Payjp.setPublicKey("pk_test_9b0f6b93ae704bc07ce48109");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_purchase_info[number]"),
      exp_month: formData.get("order_purchase_info[exp_month]"),
      exp_year: `20${formData.get("order_purchase_info[exp_year]")}`,
      cvc: formData.get("order_purchase_info[cvc]"),
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);