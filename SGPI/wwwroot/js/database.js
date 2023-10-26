// TABLAS
let dataTable;
let dataTableIsInitialized = false;

const dataTableOptions = {
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

const eliminarUsuario = async (idUsuario) => {
    try {
        const response = await fetch(`/Administrador/EliminarUsuario?id=${idUsuario}`, {
            method: 'POST'
        });

        if (response.ok) {
            // Actualizar la tabla después de eliminar el usuario
            await listUsers();
        } else {
            // Manejar el caso en el que la eliminación no tenga éxito
            alert("Error al eliminar el usuario.");
        }
    } catch (ex) {
        alert(ex);
    }
};

//CARGAR USUARIO PARA EDICION
const cargarUsuario = async (idUsuario) => {
    try {
        const response = await fetch(`/Administrador/ObtenerUsuario?id=${idUsuario}`);
        if (response.ok) {
            const usuario = await response.json();

            // Rellenar el formulario con los datos del usuario
            document.getElementById("Iduser").value = usuario.iduser;
            document.getElementById('PrimerNombre').value = usuario.primerNombre;
            document.getElementById('SegundoNombre').value = usuario.segundoNombre;
            document.getElementById('PrimerApellido').value = usuario.primerApellido;
            document.getElementById('SegundoApellido').value = usuario.segundoApellido;
            document.getElementById('Email').value = usuario.email;
            document.getElementById('Pass').value = usuario.pass;
            document.getElementById('Documento').value = usuario.documento;
            document.getElementById('NumDoc').value = usuario.numDoc;
            document.getElementById('Genero').value = usuario.genero;
            document.getElementById('Rol').value = usuario.rol;
            document.getElementById('Programa').value = usuario.programa;
            document.getElementById('Activo').checked = usuario.activo;

            // Cambiar el botón "Agregar" por "Editar" y configurar el evento de edición
            const botonAgregar = document.querySelector('button[asp-action="AgregarUsuario"]');
            botonAgregar.textContent = "Editar";
            botonAgregar.removeEventListener('click', agregarUsuario); // Remover el evento anterior si es necesario
            botonAgregar.addEventListener('click', () => editarUsuario(idUsuario));

        } else {
            alert("Error al cargar el usuario.");
        }
    } catch (ex) {
        alert(ex);
    }
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
                    <td class="centered">
                        <button class="btn btn-sm btn-primary editar-usuario" data-id="${user.iduser}"><i class="bx bxs-pencil"></i></button>
                        <button class="btn btn-sm btn-danger eliminar-usuario" data-id="${user.iduser}"><i class="bx bxs-trash"></i></button>
                    </td>
                    <td class="centered">${user.activo ? '<i class="bx bx-check" style="color: green;"></i>' : '<i class="bx bx-x" style="color: red;"></i>'}</td>
                    <td class="centered">${user.iduser}</td>
                    <td class="centered">${user.primerNombre}</td>
                    <td class="centered">${user.segundoNombre}</td>
                    <td class="centered">${user.primerApellido}</td>
                    <td class="centered">${user.segundoApellido}</td>
                    <td class="centered">${user.documento}</td>
                    <td class="centered">${user.numDoc}</td>
                    <td class="centered">${user.genero}</td>
                    <td class="centered">${user.programa}</td>
                    <td class="centered">${user.rol}</td>
                    <td class="centered">${user.email}</td>
                    <td class="centered">${user.pass}</td>
                </tr>`;
        });
        tableBody_users.innerHTML = content;

        // Manejar el clic en el botón de eliminación
        const botonesEliminar = document.querySelectorAll('.eliminar-usuario');
        botonesEliminar.forEach(boton => {
            boton.addEventListener('click', () => {
                const idUsuario = boton.getAttribute('data-id');
                eliminarUsuario(idUsuario);
            });
        });

        // Agregar el evento clic a los botones de "Editar usuario"
        const botonesEditar = document.querySelectorAll('.editar-usuario');
        botonesEditar.forEach(boton => {
            boton.addEventListener('click', () => {
                const idUsuario = boton.getAttribute('data-id');
                cargarUsuario(idUsuario);

                // Ocultar el botón "Agregar" cuando se haga clic en "Editar"
                document.getElementById('btnAgregar').style.display = 'none';

                // Mostrar el botón "Editar"
                document.getElementById('btnEditar').style.display = 'block';
            });
        });

    } catch (ex) {
        alert(ex);
    }
};

window.addEventListener("load", async () => {
    await initDataTable();
});