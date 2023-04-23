function priceCalculation() {
  const priceInput = document.getElementById("item-price");
  const commissionOutput = document.getElementById("add-tax-price");
  const profitOutput = document.getElementById("profit");
  
  priceInput.addEventListener("input", function() {
    const price = priceInput.value;
    console.log(price);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;
    commissionOutput.innerHTML = tax;
    profitOutput.innerHTML = profit;
  });
}

window.addEventListener("load", priceCalculation);