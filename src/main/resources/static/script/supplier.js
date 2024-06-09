window.addEventListener('load', function () {

    let getPrivilege = ajaxGetRequest("/privilege/byloggedusermodule/SUPPLIER")
    // supFormValidation();
    reloadSupTable();
    // reloadSupForm();
    // fillDataIntoTable6();
});

const supplierFormRefill = () =>{
    return "Refil";
}

const reloadSupTable = function () {

    suppliers = ajaxGetRequest('/supplier/list');
    let getPrivilege = ajaxGetRequest("/privilege/byloggedusermodule/SUPPLIER")



    const displayProperty = [
        {dataType:"text", propertyName:"regno"},
        {dataType:"text", propertyName:"suppliername"},
        {dataType:"text", propertyName:"contactno"},
        {dataType:"function", propertyName:getIngredients},
        {dataType:"function", propertyName:getSupStatus},
        {dataType:"function", propertyName:getAddedUser}

    ]

    fillDataIntoTable6(tableSupplier, suppliers, displayProperty,supplierFormRefill,
        deleteSupplier,
        printSupplier,
        true,getPrivilege);


    $('#tableSupplier').dataTable();
}

const getSupStatus = function (subOb) {
    return subOb.supplierstatus_id.name;
}

const getIngredients = function (subOb) {
    return 'ingredients';
}

const getAddedUser = function (subOb) {
    return 'AddedUser';
}

// const refillSupplierFormFields = function (subOb) {
//
//     $('#modalSupplier').modal('show');
//
//     supplier = JSON.parse(JSON.stringify(subOb));
//     oldSupplier = JSON.parse(JSON.stringify(subOb));
//
//     console.log(supplier);
//     console.log(oldSupplier);
//
//     inputName.value = subOb.name;
//
//     generateDropdownData(selectStatus, 'Choose a Status', supplierStatuses, 'name',);
//
// }

const deleteSupplier = function () {

}

const viewSupplier = function () {

}

const printSupplier = function () {

}
const supFormValidation = function () {

}
// ME
// const reloadSupForm = function () {
//
//     supplier = {};
//     supplier.ingredients = [];
//
//     supplierStatuses = ajaxGetRequest('/supplierstatus/findall');
//     generateDropdownData(selectStatus, "Choose the Supplier's Status", supplierStatuses, 'name', 'Active');
//
//     ingredients = ajaxGetRequest('/ingredient/list');
//     generateDropdownData(selectIngredient, "", ingredients, 'name');
//
// }

// me only below line
// const addSelectedIngredient = function () {

    // let selectedIngredient = JSON.parse(selectIngredient.value);

    // supplier.ingredients.push(selectedIngredient);
    // generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');

    // let extIndex = ingredients.map(ingredient => ingredient.name).indexOf(selectedIngredient.name);
    // if (extIndex != -1) {
    //     ingredients.splice(extIndex, 1);
    // }
    // generateDropdownData(selectIngredient, '', ingredients, 'name');


//     me
//     let selectedIngredient = "";
//
//     if (selectIngredient.value != "") {
//
//         selectedIngredient = JSON.parse(selectIngredient.value);
//
//         supplier.ingredients.push(selectedIngredient);
//         generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');
//
//         let extIndex = ingredients.map(ingredient => ingredient.name).indexOf(selectedIngredient.name);
//         if (extIndex != -1) {
//             ingredients.splice(extIndex, 1);
//         }
//         generateDropdownData(selectIngredient, '', ingredients, 'name');
//     }
// }

const removeSelectedIngredient = function () {

    // let selectedIngredient = JSON.parse(selectSelectedIngredients.value);

    let selectedIngredient = '';

    if (selectSelectedIngredients.value != "") {

        selectedIngredient = JSON.parse(selectSelectedIngredients.value);

        ingredients.push(selectedIngredient);
        generateDropdownData(selectIngredient, '', ingredients, 'name');

        let extIndex = supplier.ingredients.map(ingredient => ingredient.name).indexOf(selectedIngredient.name);
        if (extIndex != -1) {
            supplier.ingredients.splice(extIndex, 1);
        }
        generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');
    }
}

const addAllIngredients = function () {

    for (const ingredient of ingredients) {
        supplier.ingredients.push(ingredient);
    }

    generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');

    ingredients = [];
    generateDropdownData(selectIngredient, '', ingredients, 'name');

}

const removeAllIngredients = function () {

    for (const ingredient of supplier.ingredients) {
        ingredients.push(ingredient);
    }

    generateDropdownData(selectIngredient, '', ingredients, 'name');

    supplier.ingredients = [];

    generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');

    // let selectedIngredient = JSON.parse(selectSelectedIngredients.value);

    // ingredients.push(selectedIngredient);
    // generateDropdownData(selectIngredient, '', ingredients, 'name');

    // let extIndex = supplier.ingredients.map(ingredient => ingredient.name).indexOf(selectedIngredient.name);
    // if (extIndex != -1) {
    //     supplier.ingredients.splice(extIndex, 1);
    // }
    // generateDropdownData(selectSelectedIngredients, '', supplier.ingredients, 'name');  

}

