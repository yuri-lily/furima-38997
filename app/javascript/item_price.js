function calc () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
   tax = Math.floor( inputValue * 0.1 );
   addTaxDom.innerHTML = tax;
   const inputProfit = document.getElementById("profit");
   profit = Math.floor(inputValue - tax);
   inputProfit.innerHTML = profit;
});
};

window.addEventListener('load', calc);