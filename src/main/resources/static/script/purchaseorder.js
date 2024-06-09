window.addEventListener('load', function () {

    loggedUserPrivileges = getRequest('/privilege/byloggedusermodule/PURCHASEORDER');
    console.log(loggedUserPrivileges);
    reloadPurOrderTable();
    purOrderFormValidation();
    reloadPurOrderForm();

});

const reloadPurOrderTable = function () {

    // employees = [];
    // $.ajax('/employee/list', {
    //     async: false,
    //     contentType: 'application/json',
    //     success: function(data) {
    //         console.log('success'+ data);
    //         employees = data;
    //     },
    //     error: function(errorMsg) {
    //         console.log('errors'+ errorMsg);
    //         employees = [];
    //     }
    // });

    // employees = getRequest('/employee/list');

    // empProperties = [                       // create an array props. that should be in the table
    //     { propName: 'empno', propType: 'string' },
    //     { propName: 'fullname', propType: 'string' },
    //     { propName: getEmpDesignation, propType: 'object' },
    //     { propName: 'nic', propType: 'string' },
    //     { propName: 'primarycontactno', propType: 'string' },
    //     { propName: 'email', propType: 'string' },
    //     { propName: getEmpStatus, propType: 'object' }
    // ];

    // // generateTableData function defined in common.js
    // generateTableData(empTable, employees, empProperties, true, loggedUserPrivileges);

    // $('#empTable').dataTable();

    // hide delete button for already delete rows -> there are two conditions
    // 1. empStatus=delete,   2. should have privileges for delete op.
    // employees.forEach(element => {
    //     if (element.employeestatus_id == "Deleted") {
    //         if (loggedUserPrivileges.delete) {
    //             divActions.children[1].classList.add('d-none');
    //         }
    //     }
    // });
}

const purOrderFormValidation = function () {

    inputDate.addEventListener('change', function () {
        inputTextValidation(inputDate, '^.*$', 'purOrder', 'date');
    });

    inputTotal.addEventListener('keyup', function () {
        inputTextValidation(inputTotal, '^.*$', 'purOrder', 'total');
    });

    textareaNote.addEventListener('keyup', function () {
        inputTextValidation(textareaNote, '^.*$', 'purOrder', 'notes');
    });

    selectStatus.addEventListener('change', function () {
        DynamicSelectValidation(selectStatus, 'purOrder', 'purchaseorderstatus_id');
    });

    selectSupplier.addEventListener('change', function () {
        DynamicSelectValidation(selectSupplier, 'purOrder', 'supplier_id');
    });

    selectIngredient.addEventListener('change', function () {
        DynamicSelectValidation(selectIngredient, 'pOrderHasIngredient', 'ingredient_id');
    });

    inputUnitPrice.addEventListener('keyup', function () {
        inputTextValidation(inputUnitPrice, '^.*$', 'pOrderHasIngredient', 'unitprice');
    });

    inputQuantity.addEventListener('keyup', function () {
        inputTextValidation(inputQuantity, '^.*$', 'pOrderHasIngredient', 'qty');
    });

    inputLinePrice.addEventListener('keyup', function () {
        inputTextValidation(inputLinePrice, '^.*$', 'pOrderHasIngredient', 'lineprice');
    });

}

const reloadPurOrderForm = function () {        // empty all form field values
    purOrder = new Object();              // create employee global object

    purOrder.purchaseOrderHasIngredientList = new Array();


    suppliers = getRequest('/supplier/list');
    purOrderStatuses = getRequest('/purchaseorderstatus/list');

    generateDropdownData(selectSupplier, 'Choose a Designation', suppliers, 'name');
    generateDropdownData(selectStatus, 'Choose a Designation', purOrderStatuses, 'name');

    reloadPurOrderIngredientFormAndTable();

}

const reloadPurOrderIngredientFormAndTable = function () {

    pOrderHasIngredient = new Object();

    let propertiesli = [
        { propName: getIngredientName, propType: 'object' },
        { propName: getUnitPrice, propType: 'object' },
        { propName: getQantity, propType: 'object' },
        { propName: getLinePrice, propType: 'object' }
    ];

    ingredients = getRequest('/ingredient/findall');
    generateDropdownData(selectIngredient, 'Choose a Designation', ingredients, 'name');

    generateInnerTableData(purOrderInnerTable, purOrder.purchaseOrderHasIngredientList, propertiesli, true, refillInnerForm, deleteInnerForm);

    selectIngredient.value = '';
    inputUnitPrice.value = '';
    inputQuantity.value = '';
    inputLinePrice.value = '';

    selectIngredient.classList.remove('is-valid');
    selectIngredient.classList.remove('is-invalid');

    inputUnitPrice.classList.remove('is-valid');
    inputUnitPrice.classList.remove('is-invalid');

    inputQuantity.classList.remove('is-valid');
    inputQuantity.classList.remove('is-invalid');

    inputLinePrice.classList.remove('is-valid');
    inputLinePrice.classList.remove('is-invalid');

}

const getIngredientName = function (innerOb) {
    return innerOb.ingredient_id.name; 
}

const getUnitPrice = function (innerOb) {
    return parseFloat(innerOb.unitprice).toFixed(2);
}

const getQantity = function (innerOb) {
    return parseFloat(innerOb.qty).toFixed(3);
}

const getLinePrice = function (innerOb) {
    return parseFloat(innerOb.lineprice).toFixed(2);
}

const refillInnerForm = function (innerOb) {

}

const deleteInnerForm = function (innerOb) {

    let userConfirm = confirm("Are you sure you want to remove order item? \n" + "Ingredient Name: " + innerOb.ingredient_id.name);
    if (userConfirm) {
        let extIndex = purOrder.purchaseOrderHasIngredientList.map(poIngredient => poIngredient.ingredient_id.id).indexOf(innerOb.ingredient_id.id);

        if (extIndex != -1) {
            purOrder.purchaseOrderHasIngredientList.splice(extIndex, 1);
            alert("Ingredient removed successfully");
            reloadPurOrderIngredientFormAndTable();
        }
    }

}

const addPurOrderIngredient = function () {

    purOrder.purchaseOrderHasIngredientList.push(pOrderHasIngredient);
    reloadPurOrderIngredientFormAndTable();

}

// const getformSubmitErrors = function () {         // get form element null errors
//     // only for Required fields
//     let formSubmitErrors = '';

//     if (employee.fullname == null) {
//         formSubmitErrors = formSubmitErrors + '| Full Name';
//         inputFullName.classList.remove('is-valid');
//         inputFullName.classList.add('is-invalid');
//     }

//     if (employee.callingname == null) {
//         formSubmitErrors = formSubmitErrors + '| Calling Name';
//         inputCallingName.classList.remove('is-valid');
//         inputCallingName.classList.add('is-invalid');
//     }

//     if (employee.nic == null) {
//         formSubmitErrors = formSubmitErrors + '| NIC';
//         inputNic.classList.remove('is-valid');
//         inputNic.classList.add('is-invalid');
//     }

//     if (employee.birthdate == null) {
//         formSubmitErrors = formSubmitErrors + '| Birthdate';
//         inputBirthDate.classList.remove('is-valid');
//         inputBirthDate.classList.add('is-invalid');
//     }

//     if (employee.email == null) {
//         formSubmitErrors = formSubmitErrors + '| Email';
//         inputEmail.classList.remove('is-valid');
//         inputEmail.classList.add('is-invalid');
//     }

//     if (employee.primarycontactno == null) {
//         formSubmitErrors = formSubmitErrors + '| Mobile Number';
//         inputPrimaryContactNo.classList.remove('is-valid');
//         inputPrimaryContactNo.classList.add('is-invalid');
//     }

//     if (employee.address == null) {
//         formSubmitErrors = formSubmitErrors + '| Address';
//         textareaAddress.classList.remove('is-valid');
//         textareaAddress.classList.add('is-invalid');
//     }

//     if (employee.employeestatus_id == null) {
//         formSubmitErrors = formSubmitErrors + '| Status';
//         selectStatus.classList.remove('is-valid');
//         selectStatus.classList.add('is-invalid');
//     }

//     if (employee.designation_id == null) {
//         formSubmitErrors = formSubmitErrors + '| Designation';
//         selectDesignation.classList.remove('is-valid');
//         selectDesignation.classList.add('is-invalid');
//     }

//     if (employee.maritalstatus == null) {
//         formSubmitErrors = formSubmitErrors + '| Marital Status';
//         selectMaritalStatus.classList.remove('is-valid');
//         selectMaritalStatus.classList.add('is-invalid');
//     }
//     return formSubmitErrors;
// }

// const addEmployee = function () {

//     let formSubmitErrors = getformSubmitErrors();
//     // console.log(employee);
//     if (formSubmitErrors == '') {

//         $.confirm({
//             icon: 'fa-solid fa-triangle-exclamation',
//             title: 'Add Employee',
//             content: '<b>Are you sure you want to Add this employee?</b>',
//             type: 'blue',
//             theme: 'material',
//             columnClass: 'medium',             // width
//             buttons: {
//                 confirm: {
//                     btnClass: 'btn-blue',
//                     action: function () {
//                         // send the employee ob. to backend through 'DELETE' method.
//                         //          return "200" or "Exception(error)"  to this postResponse variable
//                         let postResponse = bodyRequest('/employee', 'POST', employee);
//                         if (postResponse == '200') {
//                             // triggers when employee saved in DB
//                             $.alert({
//                                 title: false,
//                                 content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-check" style="color: #1fb141"></i> The employee has been succesfully Added!</span>',
//                                 type: 'green',
//                                 buttons: { ok: { btnClass: 'btn-green' } }
//                             });
//                             reloadPurOrderTable();
//                             reloadEmployeeForm();
//                             $('#modalEmployee').modal('hide');
//                         } else {
//                             // triggers when employee did not saved in DB (backend will return an exception)
//                             $.alert({
//                                 title: false,
//                                 content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Failed to add the employee!</span> <br>Error: ' + postResponse,
//                                 type: 'red',
//                                 columnClass: 'medium',
//                                 buttons: { ok: { btnClass: 'btn-red' } }
//                             });
//                         }
//                     }
//                 },
//                 cancel: {
//                 }
//             }
//         });

//         // let confirmMessage = confirm('Employee Details :- \n' + 'Full Name - ' + employee.fullname + '\n' + 'Email - ' + employee.email + '\n' + '\n' + 'Are you sure you want to add this employee');
//         // if (confirmMessage) {

//         //     let postResponse = bodyRequest('/employee', 'POST', employee);

//         //     if (postResponse == '200') {
//         //         // if (new RegExp('^[0-9]{7}$').test(postResponse)) {
//         //         alert('Saved successfully');
//         //         reloadPurOrderTable();
//         //         reloadEmployeeForm();
//         //         $('#modalEmployee').modal('hide');
//         //     } else {
//         //         alert('Not saved \n Following errors are occured. \n' + postResponse);
//         //     }
//         // }
//     } else {
//         // triggers when fields has invalid values
//         $.alert({
//             title: false,
//             content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Invalid or empty values are found in the following fields: <br></span> <br>' + formSubmitErrors + ' |',
//             columnClass: 'medium',
//             type: 'red',
//             buttons: { ok: { btnClass: 'btn-red' } }
//         });
//     }
// }

// const refillEmployeeFormFields = function (selectedRowOb) {

//     $('#modalEmployee').modal('show');

//     employee = JSON.parse(JSON.stringify(selectedRowOb));
//     oldEmployee = JSON.parse(JSON.stringify(selectedRowOb));

//     console.log('employee ' + employee);
//     console.log('oldEmployee ' + oldEmployee);


//     // set values into employee form fields.  (Required)
//     inputFullName.value = employee.fullname;
//     inputCallingName.value = employee.callingname;
//     inputNic.value = employee.nic;
//     inputBirthDate.value = employee.birthdate;
//     inputEmail.value = employee.email;
//     inputPrimaryContactNo.value = employee.primarycontactno;
//     textareaAddress.value = employee.address;
//     selectMaritalStatus.value = employee.maritalstatus;

//     // set values into employee form fields.  (Optional)
//     if (employee.secondarycontactno == null) {
//         inputSecondaryContactNo.value = '';
//     } else {
//         inputSecondaryContactNo.value = employee.secondarycontactno;
//     }

//     if (employee.description == null) {
//         textareaNote.value = '';
//     } else {
//         textareaNote.value = employee.description;

//     }

//     // set values into employee form fields.  (Radio)
//     if (employee.gender == 'Male') {
//         radioMale.checked = true;
//     } else {
//         radioFemale.checked = true;
//     }

//     // set values into employee form fields.  (Dynamic)

//     generateDropdownData(selectStatus, 'Choose a Designation', employeeStatuses, 'name', employee.employeestatus_id.name);
//     generateDropdownData(selectDesignation, "Choose the Employee's Status", designations, 'name', employee.designation_id.name);

//     // disable buttons (according to privileges)
//     btnEmpAdd.disabled = true;
//     $('#btnEmpAdd').css('display', 'none');

//     if (loggedUserPrivileges.update) {
//         btnEmpUpdate.disabled = false;
//         $('#btnEmpUpdate').css('display', 'inline');
//     } else {
//         btnEmpUpdate.disabled = true;
//         $('#btnEmpUpdate').css('display', 'none');
//     }

// }

// const getUpdates = function () {

//     let updates = '';

//     if (employee.nic != oldEmployee.nic) {
//         updates = updates + '<span style="padding:20px"></span>NIC: ' + employee.nic + '<br>';
//     }
//     if (employee.email != oldEmployee.email) {
//         updates = updates + '<span style="padding:20px"></span>Email: ' + employee.email + '<br>';
//     }
//     if (employee.fullname != oldEmployee.fullname) {
//         updates = updates + '<span style="padding:20px"></span>Full Name: ' + employee.fullname + '<br>';
//     }
//     if (employee.birthdate != oldEmployee.birthdate) {
//         updates = updates + '<span style="padding:20px"></span>Birth Date: ' + employee.birthdate + '<br>';
//     }
//     if (employee.primarycontactno != oldEmployee.primarycontactno) {
//         updates = updates + '<span style="padding:20px"></span>Mobile Number: ' + employee.primarycontactno + '<br>';
//     }
//     if (employee.secondarycontactno != oldEmployee.secondarycontactno) {
//         updates = updates + '<span style="padding:20px"></span>Land Number: ' + employee.secondarycontactno + '<br>';
//     }
//     if (employee.address != oldEmployee.address) {
//         updates = updates + '<span style="padding:20px"></span>Address: ' + employee.address + '<br>';
//     }
//     if (employee.maritalstatus != oldEmployee.maritalstatus) {
//         updates = updates + '<span style="padding:20px"></span>Marital Status: ' + employee.maritalstatus + '<br>';
//     }
//     if (employee.gender != oldEmployee.gender) {
//         updates = updates + '<span style="padding:20px"></span>Gender: ' + employee.gender + '<br>';
//     }
//     if (employee.description != oldEmployee.description) {
//         updates = updates + '<span style="padding:20px"></span>Notes: ' + employee.description + '<br>';
//     }
//     if (employee.employeestatus_id.name != oldEmployee.employeestatus_id.name) {
//         updates = updates + '<span style="padding:20px"></span>Employee\'s Status: ' + employee.employeestatus_id.name + '<br>';
//     }
//     if (employee.designation_id.name != oldEmployee.designation_id.name) {
//         updates = updates + '<span style="padding:20px"></span>Designation: ' + employee.designation_id.name + '<br>';
//     }

//     return updates;
// }

// // function() -> when modal update button clicked
// //        - check if fields has invalid/empty value   -   getformSubmitErrors()
// //        - check if fields has updates               -   getUpdates()
// const updateEmployee = function () {

//     // console.log('Update button');

//     let formSubmitErrors = getformSubmitErrors();
//     if (formSubmitErrors == '') {
//         // console.log(employee);

//         let updates = getUpdates();
//         if (updates != '') {
//             // console.log(employee);

//             $.confirm({
//                 icon: 'fa-solid fa-triangle-exclamation',
//                 title: 'Update Employee',
//                 content: '<b>Are you sure you want to make these changes for this employee?</b> <br>' + updates,
//                 type: 'orange',
//                 theme: 'material',
//                 columnClass: 'medium',             // width
//                 buttons: {
//                     confirm: {
//                         btnClass: 'btn-orange',
//                         action: function () {
//                             // send the employee ob. to backend through 'PUT' method.
//                             //          return "200" or "Exception(error)"  to this putResponse variable
//                             let putResponse = bodyRequest('/employee', 'PUT', employee);
//                             if (putResponse == '200') {
//                                 // triggers when updates are saved in DB
//                                 $.alert({
//                                     title: false,
//                                     content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-check" style="color: #1fb141"></i> Changes to the employee were applied successfully!</span>',
//                                     type: 'green',
//                                     buttons: { ok: { btnClass: 'btn-green' } }
//                                 });
//                                 reloadPurOrderTable();
//                                 reloadEmployeeForm();
//                                 $('#modalEmployee').modal('hide');
//                             } else {
//                                 // triggers when updates did not saved in DB (backend will return an exception)
//                                 $.alert({
//                                     title: false,
//                                     content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Changes to the employee failed to apply!</span> <br>Error: ' + putResponse,
//                                     columnClass: 'medium',
//                                     type: 'red',
//                                     buttons: { ok: { btnClass: 'btn-red' } }
//                                 });
//                             }
//                         }
//                     },
//                     cancel: {
//                     }
//                 }
//             });

//             // let confirmMessage = confirm('Are you sure you want to do this update? \n \n' + updates + '\n');
//             // if (confirmMessage) {

//             //     let putResponse = bodyRequest('/employee', 'PUT', employee);

//             //     if (putResponse == '200') {
//             //         // if (new RegExp('^[0-9]{7}$').test(backendResponse)) {
//             //         alert('updated successfully');
//             //         reloadPurOrderTable();
//             //         reloadEmployeeForm();
//             //         $('#modalEmployee').modal('hide');
//             //         divActions.className = 'd-none';
//             //     } else {
//             //         alert('Not updated \n Following errors are occured. \n' + putResponse);
//             //     }
//             // }
//         } else {
//             // triggers when there's no updates
//             $.alert({
//                 title: false,
//                 content: 'No changes have been applied to the employee.',
//                 type: 'blue',
//             });
//         }

//     } else {
//         // triggers when fields has invalid values
//         $.alert({
//             title: false,
//             content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Invalid or empty values are found in the following fields: <br></span> <br>' + formSubmitErrors + ' |',
//             columnClass: 'medium',
//             type: 'red',
//             buttons: { ok: { btnClass: 'btn-red' } }
//         });
//     }
// }

// // function() -> when table row delete button clicked
// // "selectedRowOb"  ->      common.js will give a single emp. ob. relevant to the selected row/radio
// const deleteEmployee = function (selectedRowOb) {

//     // console.log('delete button ' + selectedRowOb);

//     $.confirm({
//         icon: 'fa-solid fa-triangle-exclamation',
//         title: 'Delete Employee',
//         content: '<b>Are you sure you want to delete this employee?</b>',
//         type: 'red',
//         theme: 'material',
//         columnClass: 'medium',             // width
//         buttons: {
//             confirm: {
//                 btnClass: 'btn-red',
//                 action: function () {
//                     // send the employee ob. to backend through 'DELETE' method.
//                     //          return "200" or "Exception(error)"  to this deleteResponse variable
//                     let deleteResponse = bodyRequest('/employee', 'DELETE', selectedRowOb);
//                     if (deleteResponse == '200') {
//                         // triggers when updates are saved in DB
//                         $.alert({
//                             title: false,
//                             content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-check" style="color: #1fb141"></i> The employee has been succesfully deleted!</span>',
//                             type: 'green',
//                             buttons: { ok: { btnClass: 'btn-green' } }
//                         });
//                         reloadPurOrderTable();
//                         reloadEmployeeForm();
//                         divActions.className = 'd-none';
//                     } else {
//                         // triggers when updates did not saved in DB (backend will return an exception)
//                         $.alert({
//                             title: false,
//                             content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Failed to delete the employee.</span> <br>Error: ' + deleteResponse,
//                             type: 'red',
//                             buttons: { ok: { btnClass: 'btn-red' } }
//                         });
//                     }
//                 }
//             },
//             cancel: {
//             }
//         }
//     });

//     // const confirmMessage = confirm('Are you sure, you want to delete this employee \n' + selectedRowOb.fullname);

//     // if (confirmMessage) {
//     //     let deleteResponse = bodyRequest('/employee', 'DELETE', selectedRowOb);

//     //     if (deleteResponse == '200') {
//     //         alert('Successfully Deleted');
//     //         reloadPurOrderTable();
//     //         reloadEmployeeForm();
//     //         divActions.className = 'd-none';
//     //     } else {
//     //         alert('Delete unsuccessful \n Following errors are occured \n' + deleteResponse);
//     //     }
//     // }
// }

// const viewEmployee = function (selectedRowOb) {

//     // console.log(selectedRowOb);
//     tdFullName.innerHTML = selectedRowOb.fullname;
//     tdCallingName.innerHTML = selectedRowOb.callingname;
//     tdNIC.innerHTML = selectedRowOb.nic;
//     tdBirthdate.innerHTML = selectedRowOb.birthdate;
//     tdGender.innerHTML = selectedRowOb.gender;
//     tdEmail.innerHTML = selectedRowOb.email;
//     tdMobileNo.innerHTML = selectedRowOb.primarycontactno;
//     tdLandNo.innerHTML = selectedRowOb.secondarycontactno;
//     tdAddress.innerHTML = selectedRowOb.address;
//     tdMaritalStatus.innerHTML = selectedRowOb.maritalstatus;
//     tdEmpID.innerHTML = selectedRowOb.empno;
//     tdDesignation.innerHTML = selectedRowOb.designation_id.name;
//     tdEmpStatus.innerHTML = selectedRowOb.employeestatus_id.name;
//     tdAddedDate.innerHTML = selectedRowOb.addeddatetime;
//     tdLastModifiedDate.innerHTML = selectedRowOb.lastmodifieddatetime;
//     tdDeletedDate.innerHTML = selectedRowOb.deleteddatetime;
//     tdNotes.innerHTML = selectedRowOb.description;

//     $('#modalViewEmployee').modal('show');
// }

// const printEmployee = function () {

//     newTab = window.open();
//     newTab.document.write(
//         '<link rel="stylesheet" href="/resources/bootstrap-5.2.3/css/bootstrap.min.css">' +
//         '<link rel="stylesheet" href="/resources/styles/modules.css">'
//         + divPrintTable.outerHTML +
//         "<script>divPrintTable.classList.add('printDiv');divPrintContent.classList.add('printContent');</script>"
//     );

//     setTimeout(function () {
//         newTab.print();
//     }, 1000);
// }

// const reloadDesignationForm = function () {

//     designationob = new Object();

//     inputDesignationName.value = '';
//     inputDesignationName.classList.remove('is-valid');
//     inputDesignationName.classList.remove('is-invalid');
// }

// const addDesignation = function () {

//     // console.log('btn add new designation');

//     // check if values are not empty
//     if (designationob.name != null) {

//         $.confirm({
//             icon: 'fa-solid fa-triangle-exclamation',
//             title: 'Add Designation',
//             content: '<b>Are you sure you want to Add this new designation?</b>',
//             type: 'blue',
//             theme: 'material',
//             columnClass: 'medium',             // width
//             buttons: {
//                 confirm: {
//                     btnClass: 'btn-blue',
//                     action: function () {
//                         // send the designation ob. to backend through 'POST' method.
//                         //          return "200" or "Exception(error)"  to this postResponse variable
//                         let postResponse = bodyRequest('/designation', 'POST', designationob);
//                         if (postResponse == '200') {
//                             // triggers when a designation saved in DB
//                             $.alert({
//                                 title: false,
//                                 content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-check" style="color: #1fb141"></i> A new designation has been succesfully Added!</span>',
//                                 type: 'green',
//                                 buttons: { ok: { btnClass: 'btn-green' } }
//                             });

//                             designations = getRequest('/designation/list');
//                             generateDropdownData(selectDesignation, 'Choose a Designation', designations, 'name', inputDesignationName.value);
//                             selectDesignation.classList.add('is-valid');

//                             employee.designation_id = JSON.parse(selectDesignation.value);
//                             reloadDesignationForm();

//                             $('#collapseAddDesignation').collapse('hide');

//                         } else {
//                             // triggers when designation did not saved in DB (backend will return an exception)
//                             $.alert({
//                                 title: false,
//                                 content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Failed to add the designation!</span> <br>Error: ' + postResponse,
//                                 type: 'red',
//                                 columnClass: 'medium',
//                                 buttons: { ok: { btnClass: 'btn-red' } }
//                             });
//                         }
//                     }
//                 },
//                 cancel: {
//                 }
//             }
//         });
//     } else {
//         $.alert({
//             title: false,
//             content: '<span style="font-weight: normal; font-size: 15px; display: inline"><i class="fa-solid fa-circle-xmark" style="color: #fa5252"></i> Empty values are found in the following field: <br></span> <br>' + '| Designation Name |',
//             columnClass: 'medium',
//             type: 'red',
//             buttons: { ok: { btnClass: 'btn-red' } }
//         });
//     }
// }



