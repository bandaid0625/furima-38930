function calculation () {
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.round(price.value * 0.1);
    const sum = document.getElementById("profit");
    sum.innerHTML = Math.round(price.value - Math.round(price.value * 0.1));
  });
};

window.addEventListener('load', calculation)