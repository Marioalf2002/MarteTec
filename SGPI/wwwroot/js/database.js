// TABLAS
let dataTable;
let dataTableIsInitialized = false;

const dataTableOptions = {
    /*dom: "<'controles-busqueda'fr>t<'row'<'col-sm-12 col-md-12 col-lg-12 col-xl-12'p>>", *//*// Esta es la línea que se agrega*/

    scrollX: "2000px",
    lengthMenu: [5, 10, 15, 20],
    columnDefs: [
        { classnombre: "centered", targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13] },
        { orderable: false, targets: [12, 13] },
        /*{ searchable: false, targets: [1] }*/
        //{ width: "50%", targets: [0] }
    ],
    pageLength: 5,
    destroy: true,
    language: {
        lengthMenu: "Mostrar _MENU_ registros por pagina",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar:",
        loadingRecords: "Cargando...",
        paginate: {
            first: "Primero",
            last: "Último",
            next: "Siguiente",
            previous: "Anterior"
        }
    }
};

const initDataTable = async () => {
    if (dataTableIsInitialized) {
        dataTable.destroy();
    }

    await listUsers();

    dataTable = $("#datatable_users").DataTable(dataTableOptions);

    dataTableIsInitialized = true;
};

const listUsers = async () => {
    try {
        const response = await fetch("https://localhost:7020/Administrador/ListaUsuarios");
        const result = await response.json();

        // Accede a la propiedad "data" para obtener el arreglo de usuarios
        const users = result.data;

        let content = '';
        users.forEach((user, index) => {
            content += `
                <tr>
                    <td>${user.iduser}</td>
                    <td>${user.primerNombre}</td>
                    <td>${user.segundoNombre}</td>
                    <td>${user.primerApellido}</td>
                    <td>${user.segundoApellido}</td>
                    <td>${user.documento}</td>
                    <td>${user.numDoc}</td>
                    <td>${user.genero}</td>
                    <td>${user.programa}</td>
                    <td>${user.rol}</td>
                    <td>${user.email}</td>
                    <td>${user.pass}</td>
                    <td>${user.activo ? '<i class="bx bx-check" style="color: green;"></i>' : '<i class="bx bx-x" style="color: red;"></i>'}</td>
                    <td>
                        <button class="btn btn-sm btn-primary"><i class="bx bxs-pencil"></i></button>
                        <button class="btn btn-sm btn-danger"><i class="bx bxs-trash"></i></button>
                    </td>
                </tr>`;
        });
        tableBody_users.innerHTML = content;
    } catch (ex) {
        alert(ex);
    }
};

window.addEventListener("load", async () => {
    await initDataTable();
});