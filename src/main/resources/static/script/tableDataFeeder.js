const tableDataBinder = (
    tableID,
    dataList,
    columnsList,
    buttonVisibility = true,
    dropDown,
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
            if (column.dataType === "text") {
                td.innerText = element[column.propertyName];
            }
            if (column.dataType === "function") {
                td.innerHTML = column.propertyName(element);
            }
            if (column.dataType === "List") {
                let ingList = document.createElement("ul");
                column.propertyName(element).forEach((ing)=>{
                     const liElement = document.createElement("li");
                    liElement.innerHTML=`${ing.ingredientName} (${ing.ingredientCode})`
                    ingList.appendChild(liElement);
                })
                td.appendChild(ingList)
            }
            tr.appendChild(td);
        });

        if (buttonVisibility) {
            const tdButton = document.createElement("td");
            tdButton.className = "align-middle";

            const divDropdownContainer = document.createElement("div");
            divDropdownContainer.className = "dropdown d-flex justify-content-center";

            const iconButton = document.createElement("button");
            iconButton.className = "btn dropdown-toggle";
            iconButton.type = "button";
            iconButton.id = "dropdownMenu";
            iconButton.setAttribute("data-bs-toggle", "dropdown");
            iconButton.setAttribute("aria-expanded", "false");
            iconButton.innerHTML = '<i class="fa-solid fa-ellipsis-vertical"></i>';

            const dropdownMenu = dropDown(element);

            divDropdownContainer.appendChild(iconButton);
            divDropdownContainer.appendChild(dropdownMenu);
            tdButton.appendChild(divDropdownContainer);
            tr.appendChild(tdButton);
        }

        tableBody.appendChild(tr);
    });
};