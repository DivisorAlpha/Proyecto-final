function confirmDelete(id) {
        var result = confirm("¿Está seguro de que desea eliminar este elemento?");
        if (result) {
            window.location.href = "/delete-todo?id=" + id;
        }
    }