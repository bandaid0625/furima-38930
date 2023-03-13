function calculation () {
  const price = document.getElementById("item-price");
  if (!price){ return false;}
  price.addEventListener("input", () => {
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.floor(price.value * 0.1);
    const sum = document.getElementById("profit");
    sum.innerHTML = Math.floor(price.value - Math.floor(price.value * 0.1));
  });
};

window.addEventListener('load', calculation)