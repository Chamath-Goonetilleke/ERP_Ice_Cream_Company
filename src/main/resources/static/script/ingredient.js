// ingredient.js

document.getElementById('ingredientForm').onsubmit = function(event) {
    event.preventDefault();

    const ingredient = {
        ingredientCode: document.getElementById('ingredientCode').value,
        ingredientName: document.getElementById('ingredientName').value,
        note: document.getElementById('note').value,
        quantity: parseInt(document.getElementById('quantity').value, 10),
        unitType: document.getElementById('unitType').value,
        rop: parseInt(document.getElementById('rop').value, 10),
        roq: parseInt(document.getElementById('roq').value, 10),
        ingredientStatus: document.getElementById('ingredientStatus').value
    };

    console.log(ingredient);
};
const addNewIngredient = () => {
    console.log("Button clicked");
    // let ingredient = {
    //     ingredientCode: "ING1234568",
    //     ingredientName: "Tomato Paste",
    //     note: "Organic and fresh",
    //     quantity: 50,
    //     unitType: "KG",
    //     rop: 10,
    //     roq: 20,
    //     ingredientStatus: "InStock"
    // };
    //alert("Check");
    let postServiceRequestResponse = ajaxRequestBody("/ingredient/addNewIngredient", "POST", ingredient);
    Swal.fire({
        title: "Save Successfully ..! ",
        html: postServiceRequestResponse,
        icon: "success"
    });
};

console.log("ingredient.js loaded");
