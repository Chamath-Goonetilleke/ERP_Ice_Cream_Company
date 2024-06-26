let selectedIngredients = [];
const getIng = (ingList) => {
    selectedIngredients = [...ingList];
};
let tableSuppliersInstance;
let ingredientList = ajaxGetRequest("/ingredient/getAllIngredients", "GET");
window.addEventListener("load", function () {

    getTransferList(ingredientList, [], getIng, 'add');
    reloadSupTable();
});

document.getElementById("supplierAddForm").onsubmit = function (event) {
    event.preventDefault();
    const ingList = [];
    selectedIngredients.forEach((ing) => {
        const i = {...ing};
        delete i.suppliers;
        ingList.push(i);
    });
    const supplier = {
        regNo: document.getElementById("regNo").value,
        supplierName: document.getElementById("supplierName").value,
        contactPersonName: document.getElementById("contactPersonName").value,
        contactNo: document.getElementById("contactNo").value,
        email: document.getElementById("email").value,
        address: document.getElementById("address").value,
        note: document.getElementById("note").value,
        joinDate: new Date(document.getElementById("joinDate").value),
        supplierStatus: document.getElementById("supplierStatus").value,
        ingredients: ingList,
    };
    let response = ajaxRequestBody("/supplier/addNewSupplier", "POST", supplier);
    if (response.status === 200) {
        swal.fire({
            title: response.responseText,
            icon: "success",
        });
        $("#modalSupplierAdd").modal("hide");
        reloadSupTable();
    } else {
        swal.fire({
            title: "Something Went Wrong",
            text: response.responseText,
            icon: "error",
        });
    }
};

document.getElementById("supplierEditForm").onsubmit = function (event) {
    event.preventDefault();
    const ingList = [];
    selectedIngredients.forEach((ing) => {
        const i = {...ing};
        delete i.suppliers;
        ingList.push(i);
    });
    const supplier = {
        regNo: document.getElementById("edit-regNo").value,
        supplierName: document.getElementById("edit-supplierName").value,
        contactPersonName: document.getElementById("edit-contactPersonName").value,
        contactNo: document.getElementById("edit-contactNo").value,
        email: document.getElementById("edit-email").value,
        address: document.getElementById("edit-address").value,
        note: document.getElementById("edit-note").value,
        joinDate: new Date(document.getElementById("edit-joinDate").value),
        supplierStatus: document.getElementById("edit-supplierStatus").value,
        ingredients: ingList,
    };
    let response = ajaxRequestBody("/supplier/updateSupplier", "PUT", supplier);
    if (response.status === 200) {
        swal.fire({
            title: response.responseText,
            icon: "success",
        });
        $("#modalSupplierEdit").modal("hide");
        reloadSupTable();
    } else {
        swal.fire({
            title: "Something Went Wrong",
            text: response.responseText,
            icon: "error",
        });
    }
};

const reloadSupTable = function () {
    const suppliers = ajaxGetRequest("/supplier/getAllSuppliers");
    let getPrivilege = ajaxGetRequest("/privilege/byloggedusermodule/SUPPLIER");

    const displayProperty = [
        {dataType: "text", propertyName: "regNo"},
        {
            dataType: "text",
            propertyName: "supplierName",
        },
        {dataType: "text", propertyName: "joinDate"},
        {
            dataType: "List",
            propertyName: getIngredients,
        },
        {dataType: "text", propertyName: "supplierStatus"},
    ];

    if (tableSuppliersInstance) {
        tableSuppliersInstance.destroy();
    }
    $("#tableSupplier tbody").empty();
    tableDataBinder(
        tableSupplier,
        suppliers,
        displayProperty,
        true,
        generateSupDropDown,
        getPrivilege
    );

    tableSuppliersInstance = $("#tableSupplier").dataTable();
};
const generateSupDropDown = (element) => {
    const dropdownMenu = document.createElement("ul");
    dropdownMenu.className = "dropdown-menu";

    const buttonList = [
        {name: "View", action: viewSupplierData, icon: "fa-solid fa-eye me-2"},
        {
            name: "Edit",
            action: editSupplier,
            icon: "fa-solid fa-edit me-2",
        },
        {name: "Delete", action: null, icon: "fa-solid fa-trash me-2"},
    ];

    buttonList.forEach((button) => {
        const buttonElement = document.createElement("button");
        buttonElement.className = "dropdown-item btn";
        buttonElement.innerHTML = `<i class="${button.icon}"></i>${button.name}`;
        buttonElement.onclick = function () {
            button.action(element);
        };
        const liElement = document.createElement("li");
        liElement.appendChild(buttonElement);
        dropdownMenu.appendChild(liElement);
    });
    return dropdownMenu;
};

const getIngredients = function (ob) {
    return ob.ingredients;
};

const viewSupplierData = (supplier) => {
    const supplierModal = new bootstrap.Modal(
        document.getElementById("supplierModal")
    );

    bindSupplierData(supplier);
    supplierModal.show();
};

const editSupplier = (supplier) => {
    let excludedList = ingredientList.filter(i => !supplier.ingredients.some(si => si.ingredientCode === i.ingredientCode));
    getTransferList(excludedList, supplier.ingredients, getIng, 'edit');

    document.getElementById("edit-regNo").value = supplier.regNo;
    document.getElementById("edit-supplierName").value = supplier.supplierName;
    document.getElementById("edit-contactPersonName").value = supplier.contactPersonName;
    document.getElementById("edit-contactNo").value = supplier.contactNo;
    document.getElementById("edit-email").value = supplier.email;
    document.getElementById("edit-address").value = supplier.address;
    document.getElementById("edit-note").value = supplier.note;
    document.getElementById("edit-joinDate").value = new Date(supplier.joinDate).toLocaleDateString();
    document.getElementById("edit-supplierStatus").value = supplier.supplierStatus;
    $("#modalSupplierEdit").modal('show');
};

function bindSupplierData(data) {
    let ingredientsHtml = "";
    if (data.ingredients && data.ingredients.length > 0) {
        ingredientsHtml = `<div class="mb-3">
            <ul>`;
        data.ingredients.forEach((ingredient) => {
            ingredientsHtml += `<li>${ingredient.ingredientName} (${ingredient.ingredientCode})</li>`;
        });
        ingredientsHtml += `</ul>
        </div>`;
    }
    const supplierDetailsDiv = document.getElementById("supplierDetails");
    supplierDetailsDiv.innerHTML = `

<div class="mb-3">
                <h5><strong>Supplier Details</strong></h5>
                <hr>
            </div>
            <div class="mb-2">
                <strong>Registration Number:</strong> ${data.regNo}
            </div>
            <div class="mb-2">
                <strong>Supplier Name:</strong> ${data.supplierName}
            </div>
            <div class="mb-2">
                <strong>Join Date:</strong> ${new Date(
        data.joinDate
    ).toLocaleDateString()}
            </div>
            <div class="mb-4">
                <strong>Status:</strong> ${data.supplierStatus}
            </div>
            
            <div class="mb-3">
                <h5><strong>Contact Details</strong></h5>
                <hr>
            </div>
            <div class="mb-2">
                <strong>Contact Person:</strong> ${data.contactPersonName}
            </div>
            <div class="mb-2">
                <strong>Contact Number:</strong> ${data.contactNo}
            </div>
            <div class="mb-2">
                <strong>Email:</strong> ${data.email}
            </div>
            <div class="mb-3">
                <strong>Address:</strong> ${data.address}
            </div>
            <div class="mb-4">
                <strong>Note:</strong> ${data.note ? data.note : "N/A"}
            </div>
            <div class="mb-3">
                <h5><strong>Supplier Ingredients</strong></h5>
                <hr>
            </div>
            ${ingredientsHtml}
        `;
}
