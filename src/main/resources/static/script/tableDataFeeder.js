const tableDataBinder = (
    tableID,
    dataList,
    columnsList,
    editFunction,
    deleteFunction,
    printFuntion,
    buttonVisibility = true,
    privilegeOb
) => {
    const tableBody = tableID.children[1];
    tableBody.innerHTML = "";

    dataList.forEach((element, index) => {
        const tr = document.createElement("tr");
        tr.className = "align-items-center";


        const tdIndex = document.createElement("td");
        tdIndex.className = "align-middle";
        tdIndex.innerText = parseInt(index) + 1;
        tr.appendChild(tdIndex);

        columnsList.forEach((column) => {
            const td = document.createElement("td");
            td.className = "align-middle";


            if (column.dataType == "text") {
                td.innerText = element[column.propertyName];
            }
            if (column.dataType == "function") {
                td.innerHTML = column.propertyName(element);
            }
            tr.appendChild(td);
        });

        const tdButton = document.createElement("td");
        tdButton.className = "align-middle";


        //Create Dropdown Container
        const divDropdownContainer = document.createElement("div");
        divDropdownContainer.className = "dropdown d-flex justify-content-center";

        //Create Icon Button
        const iconButton = document.createElement("button");
        iconButton.className = "btn dropdown-toggle";
        iconButton.type = "button";
        iconButton.id = "dropdownMenu";
        iconButton.setAttribute("data-bs-toggle","dropdown");
        iconButton.setAttribute("aria-expanded","false");

        //Set the Icon to the button
        iconButton.innerHTML = '<i class="fa-solid fa-ellipsis-vertical"></i>';

        //Create Dropdown menu
        const dropdownMenu = document.createElement("ul");
        dropdownMenu.className = "dropdown-menu";


        //Append the IconButton and dropdownContainer
        divDropdownContainer.appendChild(iconButton);
        divDropdownContainer.appendChild(dropdownMenu);
        tdButton.appendChild(divDropdownContainer);


        const buttonEdit = document.createElement("button");
        buttonEdit.className = "dropdown-item btn";
        buttonEdit.innerHTML = `<i class="fa-solid fa-edit me-2"></i> ${editFunction.name}`;
        const liElementEdit = document.createElement("li");
        buttonEdit.onclick = function () {
            editFunction.action(element, index);
        };

        const buttonDelete = document.createElement("button");
        buttonDelete.className = "dropdown-item btn ";
        buttonDelete.innerHTML = `<i class="fa-solid fa-trash me-2"></i>${deleteFunction.name}`;
        const liElementDelete = document.createElement("li");
        buttonDelete.onclick = function () {
            deleteFunction.action(element, index);
            // console.log('delte');
            // confirm('are you sure to delete following employee');
        };

        const buttonPrint = document.createElement("button");
        buttonPrint.className = "dropdown-item btn";
        buttonPrint.innerHTML = '<i class="fa-solid fa-eye me-2 "></i> print';
        const liElementPrint = document.createElement("li");
        liElementPrint.appendChild(buttonPrint);
        dropdownMenu.appendChild(liElementPrint);
        buttonPrint.onclick = function () {
            printFuntion(element, index);
        };

        if (buttonVisibility) {
            if(privilegeOb !== null && privilegeOb.update ){
                liElementEdit.appendChild(buttonEdit);
                dropdownMenu.appendChild(liElementEdit);

            }
            if(privilegeOb !== null && privilegeOb.delete  ){
                liElementDelete.appendChild(buttonDelete);
                dropdownMenu.appendChild(liElementDelete);
            }

            tr.appendChild(tdButton);
        }

        tableBody.appendChild(tr);
    });
};