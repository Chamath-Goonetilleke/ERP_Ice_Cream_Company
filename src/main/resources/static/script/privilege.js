//browser on load event
window.addEventListener("load", () => {

    //Create empty object
    privilege = {};

    // call table refresh funtion
    refresPrivilegeTable();

    //call form refresh function
    refreshPrivilegeForm();


});

const refresPrivilegeTable = () => {


    privileges = [];
    privileges = ajaxGetRequest("/privilege/findall")
    designations = ajaxGetRequest("/designation/findall")


    // text-> string date number
    //funtion ->object array boolean -- create funtion
    //column count === object count
    const displayProperty = [
        { dataType: "function", propertyName: getRole },
        { dataType: "function", propertyName: getModule },
        { dataType: "function", propertyName: getSelect },
        { dataType: "function", propertyName: getInsert },
        { dataType: "function", propertyName: getUpdate},
        { dataType: "function", propertyName: getDelete }
    ];

    //call fillDataIntoTable funtion
    //(tableID, dataArrayName, displayPropertyArea,editfuntion, deletefunction, printfuntion, button Visibility);
    //fillDataIntoTable1(tableEmployee, employees,displayProperty,employeeFormRefil, deleteEmployee, printEmployee,true);
    // fillDataIntoTable3(tableEmployee, employees, displayProperty, true);
    // fillDataIntoTable1(
    //     tablePrivilege,
    //     privileges,
    //     displayProperty,
    //     PrivilegeFormRefill,
    //     deleteEmployee,
    //     printEmployee,
    //     true
    // );
};

const getModule = (ob) => {
    // console.log('module');
    return ob.module_id.name;
}

const getRole = (ob) => {
    // console.log('role');
    return ob.role_id.name;
}

const getSelect = (ob) => {
    if (ob.sel == true) {
        return 'Not-Granted';
    } else {
        return 'Granted';
    }
}

const getInsert = (ob) => {
    if (ob.inst == true) {
        return 'Not-Granted';
    } else {
        return 'Granted';
    }
}

const getUpdate = (ob) => {
    if (ob.upd == true) {
        return 'Not-Granted';
    } else {
        return 'Granted';
    }
}

const getDelete = (ob) => {
    if (ob.del == true) {
        return 'Not-Granted';
    } else {
        return 'Granted';
    }
}



const PrivilegeFormRefill = (ob, rowIndex) => {
    console.log("refil");
    $("#modalPrivilegeAddForm").modal('show');

    privilege = JSON.parse(JSON.stringify(ob));
    oldPrivilege = JSON.parse(JSON.stringify(ob));

    roles = ajaxGetRequest("/role/list");
    fillDataIntoSelect(
        selectRole,
        "Select Role",
        roles,
        "name",
        privilege.role_id.name
    );
    selectRole.disabled = true;

    modules = ajaxGetRequest("/module/list")
    fillDataIntoSelect(
        selectModule,
        "Select Module",
        modules,
        "name",
        privilege.module_id.name
    );

    selectModule.disabled = true;



};

//Select Designation

//Select Valid Color for element


//deifine method for check updates
const checkUpdate = () =>{
    let updates = "";

    if(employee.nic != oldemployee.nic){
        updates = updates + "NIC is Change \n";
    }

    if(employee.mobile != oldemployee.mobile){
        updates = updates + "Mobile is Change " + oldemployee.mobile + "into"+ employee.mobile+  "\n";
    }

    if(employee.designation != oldemployee.designation){
        updates = updates + "Designation is Change " + oldemployee.designation + "into"+ employee.designation+  "\n";
    }


    return updates;
}

//Define function for employee update
const buttonEmployeeUpdate = () => {
    console.log("update Button")
    //Check form Error
    let errors = checkFormEroor();

    if (errors === "") {
        //Check form update
        let updates = checkUpdate();
        console.log(updates);
        if (updates !== "") {
            let userConfirm = confirm("Are you sure to following updates..? \n" + updates);
            if (userConfirm) {
                let updateServiceResponse = ajaxRequestBody("/employee", "PUT", employee);
                if (updateServiceResponse === "OK") {
                    alert("Update successfully ...! \n");
                    //Need to refresh
                    formEmployee.reset();
                    refreshEmployeeTable();
                    refreshEmployeeForm();
                    //Need hide modal
                    $('#modalEmployeeAdd').modal("hide");
                } else {
                    alert("Update Not  Sucessfully ...! have some errors \n" + updateServiceResponse)
                }
            }
        } else {
            alert("No updates Found..!")
        }

    } else {
        alert("Form has following errors \n" + errors);
    }
}


//Set min value
//home work
//min = current date// new Date();
//max = current date + 14 days
//dateDOB.min = '2023-02-04'
//dateDOB.max = '2023-02-04'


// create funtion for delete employee
const deleteEmployee = (ob, rowIndex) => {
    console.log("delete");

    tableEmployee.children[1].children[rowIndex].style.backgroundColor = "pink";

    const userConfirm = confirm(
        "are you sure to delete following employee \n" +
        "\n full name is " +
        ob.fullname +
        "\n nic is " +
        ob.nic +
        "\n status is " +
        ob.employeestatus_id.name
    );


    if (userConfirm) {

        //Delete Service
        let deleteServiceRequestResponse = ajaxRequestBody("/employee", "DELETE", ob)


        //Check Backend Service
        if (deleteServiceRequestResponse === "OK") {
            alert("Delete Successfully..! \n");

            formEmployee.reset();
            refreshEmployeeTable();
            refreshEmployeeForm();
        } else {
            alert("Delete Not Successfully \n" + deleteServiceRequestResponse)
        }
    }
}


// create function for print employee
const printEmployee = (ob, rowIndex) => {
    console.log("print");
};

//Create function for check form errors
const checkFormEroor = () =>{
    let errors = '';

    return errors;
}

//Create function for submit employee form
const employeeSubmit = () => {
    console.log("button Submit");
    console.log(employee);

    //1 Check form eroors
    const  errors = checkFormEroor();

    if(errors == ""){

        //2 Need to get user confirm
        let userConfirm = window.confirm("Are you sure to add following Employee.? \n" + "FUllname : " + employee.fullname + "\n Nic : " + employee.nic + '\n Gender :' + employee.gender+ "\n Email : " + employee.email);


        if(userConfirm){

            let postServiceRequestResponse = ajaxRequestBody("/employee","POST", employee)


            //Check Backend Service
            if(new RegExp('^[0-9]{10}$').test(postServiceRequestResponse)){
                alert("Save Successfuly..!" + postServiceRequestResponse);

                //need to hide modal
                $("#modalEmployeeAdd").modal('hide');
                formEmployee.reset();
                refreshEmployeeTable();
                refreshEmployeeForm();
            }else {
                alert("Form has error\n" + postServiceRequestResponse)
            }

        }
    }else {
        alert("Following eroors \n " + errors)
    }

};

// Define function for filter module list by given role id
const generateModuleList = () => {
    console.log(selectRole.value)
    modulesByRole = ajaxGetRequest("/module/listbyrole?roleid=" + JSON.parse(selectRole.value).id);
    fillDataIntoSelect(selectModule, 'select Module',modulesByRole,'name');

    selectModule.disabled = false;

}


const refreshPrivilegeForm = () =>{

    //Create empty object
    privilege = new Object();


    //Fill data into Roles
    const selectRole = document.getElementById("selectRole");
    fillDataIntoSelect(
        selectRole,
        "Select Role",
        roles,
        "name",
    );

//

    // Fill data into modules
    const selectModule = document.getElementById("selectModule");
    fillDataIntoSelect(
        selectModule,
        "Select Module",
        modules,
        "name",
    );



    roles = ajaxGetRequest("/role/list");
    fillDataIntoSelect(
        selectRole,
        "Select Role",
        roles,
        "name",
    );
    selectRole.disabled = false;

    modules = ajaxGetRequest("/module/list")
    fillDataIntoSelect(
        selectModule,
        "Select Module",
        modules,
        "name",
    );

    selectModule.disabled = true;



//
//   let currentDate = new Date();
//   console.log('Date', currentDate);
//   console.log('Year', currentDate.getFullYear());
//   console.log('Month', currentDate.getMonth()); //Month array [0-11]
//   console.log('Day', currentDate.getDate()); //Range 0-31
//
//   let minDate = new Date();
//   let maxDate = new Date();
//
//   let minMonth = minDate.getMonth();
//
//   if(minMonth<10){
//     minMonth = '0' + minMonth;
//   }
//
//   let minDay = minDate.getDate();
//   if(minDay<10){
//     minDay = '0' + minDay;
//   }
//
//   minDate.setFullYear(minDate.getFullYear() -60);
//   dateOfBirth.min = minDate.getFullYear() + '-' + minMonth+ '-'+ minDay;
//
//
//   let maxMonth = maxDate.getMonth();
//
//   if(maxMonth<10){
//     maxMonth = '0' + maxMonth;
//   }
//
//   let maxDay = maxDate.getDate();
//   if(maxDay<10){
//     maxDay = '0' + maxDay;
//   }
//   maxDate.setFullYear(maxDate.getFullYear() -18);
//   dateOfBirth.max = maxDate.getFullYear() + '-' + maxMonth+ '-'+ maxDay;
//
//
//   //need to set default color
//
//   console.log(employee)
//





}
