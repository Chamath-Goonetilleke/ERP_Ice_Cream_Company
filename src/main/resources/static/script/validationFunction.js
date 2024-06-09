//define function for validate input element
const inputValidation = (fieldId, pattern, object, property) => {

    //create variable for assign regExp object
    const regPattern = new RegExp(pattern);

    if (fieldId.value != "") {
        // if value exist
        if (regPattern.test(fieldId.value)) {
            // if value valid
            window[object][property] = fieldId.value;
            fieldId.style.border = "2px solid green";
        } else {
            // if value invalid
            window[object][property] = null;
            fieldId.style.border = "2px solid red";
        }
    } else {
        // if value not exist
        if (fieldId.required) {
            fieldId.style.border = "2px solid red";
        } else {
            fieldId.style.border = "1px solid #ced4da";
        }
    }
}


//define function for validate select element -dynamic
const selectDValidation = (fieldId, pattern, object, property) => {

    if (fieldId.value != '') {
        //valid
        fieldId.style.border = '2px solid green';
        window[object][property] = JSON.parse(fieldId.value);   //select element value type is string, need toconvert as a js object
    } else {
        //invaild
        fieldId.style.border = '2px solid red';
        window[object][property] = null;
    }
}

//define function for validate select element -static
const selectSValidation = (fieldId, pattern, object, property) => {
    if (fieldId.value != '') {
        //valid
        fieldId.style.border = '2px solid green';
        window[object][property] = fieldId.value;
    } else {
        //invaild
        fieldId.style.border = '2px solid red';
        window[object][property] = null;
    }
}

//define function for validate fullname and generate calling name
const genarateCallingNames = ()=>{
    const callingnames = document.querySelector('#callingNames');
    callingnames.innerHTML = '';

     calllingNamePartList = textFullName.value.split(' ');
    console.log(calllingNamePartList)

    calllingNamePartList.forEach( name =>{
        const option = document.createElement('option');
        option.innerHTML = name;
        callingnames.appendChild(option);
    })

}

//Create function for validation callingName
const textCallingNameValidator = (fieldId) => {
    const callingNameValue = fieldId.value;

    const index = calllingNamePartList.map(element => element).indexOf(callingNameValue);
    console.log(index);

    if (index !== -1) {
        //valid
        fieldId.classList.remove("is-invalid");
        fieldId.classList.add("is-valid");
        employee.callingname = callingNameValue;
    } else {
        console.log("Calling Name Invalid")
        //invalid
        fieldId.classList.remove("is-valid");
        fieldId.classList.add("is-invalid");
        employee.callingname = null;
    }
}

//Create function for date field validator
const dateFeildValidator = (fieldId,pattern,object,property ) => {
    const fieldValue = fieldId.value;
    const Pattern = new RegExp('^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$');

    if (fieldId.value !== "") {
        if (Pattern.test(fieldId.value)) {
            fieldId.classList.remove("is-invalid");
            fieldId.classList.add("is-valid");
            console.log("valid");
            window[object][property] = fieldValue;
            console.log(employee)
        } else {
            fieldId.classList.add("is-invalid");
            window[object][property] = null;

        }
    } else
    {
        window[object][property] = null;
        if (!fieldId.required) {
            fieldId.classList.remove("is-valid");
            fieldId.classList.remove("is-invalid");
        } else {
            fieldId.classList.remove("is-valid");
        }
    }
};

//Create Function for Radio Field Validator
const radioValidator = (fieldId, pattern, object, property,l1,l2)=>{

    const fieldValue = fieldId.value;

    if(fieldId.checked){
        window[object][property] = fieldValue;
    }else {
        window[object][property] = fieldValue;
    }

}

//Create Function for Check box Validator
const checkBoxValidator = (fieldId, pattern, object, property,trueValue,falseValue,labelId,labelTrueValue,labelFalseValue)=>{

    const fieldValue = fieldId.checked;

    if(fieldValue){
        window[object][property] = trueValue;
        labelId.innerText = labelTrueValue;
    }else {
        window[object][property] = falseValue;
        labelId.innerText = labelFalseValue;
    }

}