//Browser Load Event
window.addEventListener('load', ()=>{
    let userPrivilege = ajaxGetRequest("/privilege/bylogedusermodule/ITEM");


    // itemFormRefresh();

    itemTableRefresh();

});


//Define function for add item
const buttonUpdateItem = () =>{
    console.log("Submit");
    console.log(item);

    //Check form errors
    let errors = checkFormError();
    if(errors===''){
        let userConfirm = confirm("Are you sure to submit following item details \n" + "item name : " + item.itemname + "\n Item Sale Price : " + item.salesprice);

        if(userConfirm){
            let  postServiceResponse = ajaxRequestBody("/item", "POST",item);
            if (postServiceResponse === "OK"){
                alert("Save Successfully..!")
                formItem.reset();
                itemFormRefresh();
            }
            else {
                alert("Failed to submit..!\n" + errors);
            }
        }
    }else{
        alert("form has following error..\n" + errors);
    }
}




//Define function for item Table Refresh
const itemTableRefresh = () =>{

    //Create Array for store all items
    products = ajaxGetRequest("/product/findall");

    const columns = [{dataType:"function", propertyName:getItemName},{dataType:"function", propertyName:getSalesPrice},{dataType:"function", propertyName:getPackageType},{dataType:"function", propertyName:getAddedUser},{dataType:"function", propertyName:getStatus}];

    let userPrivilege = ajaxGetRequest("/privilege/bylogedusermodule/PRODUCT");



    //Call data fill function
    fillDataIntoTable6(
        tableProduct,
        products,
        columns,
        refillItemForm,
        deleteItem,
        printItem,
        true,
        userPrivilege
    );

    //Add data table
    $("#tableProduct").dataTable();

    //Disable Delete Button



}

const getItemName = (ob) =>{
    return ob.productname;

}
const getSalesPrice = (ob) =>{
    return "Rs. " + ob.salesprice;

}
const getPackageType = (ob) =>{
    return ob.packagetype_id.name;

}
const getAddedUser = (ob) =>{
    let user = ajaxGetRequest("/user/byid/"+ob.delete_user);
    return user.username;

}
const getStatus = (ob) =>{
    return ob.productstatus_id.name;
}

const deleteItem = (ob) =>{

}

const printItem = (ob) =>{

}

const refillItemForm = (ob) =>{

}



