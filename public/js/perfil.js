const datos = document.getElementById('datos');
const cuenta = document.getElementById('cuenta');

datos.addEventListener('submit', function (event) {
  event.preventDefault();
  if (this.codigoPostal) {
    fetch('http://localhost:3000/perfil', {
      method: 'PUT',
      body: JSON.stringify({
        nombre: this.nombre.value,
        telefono: this.telefono.value,
        direccion: this.direccion.value,
        codigoPostal: this.codigoPostal.value,
        correo: this.correo.value,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    }).then((data) => {
      if (data.status == 403) {
        alert('CORREO EN USO');
        return;
      }
      window.location.reload();
    });
    return;
  }
  if (!this.telefono) {
    fetch('http://localhost:3000/perfil', {
      method: 'PUT',
      body: JSON.stringify({
        nombre: this.nombre.value,
        correo: this.correo.value,
      }),
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      },
    }).then((data) => {
      if (data.status == 403) {
        alert('CORREO EN USO');
        return;
      }
      window.location.reload();
    });
    return;
  }
  fetch('http://localhost:3000/perfil', {
    method: 'PUT',
    body: JSON.stringify({
      nombre: this.nombre.value,
      apellido: this.apellido.value,
      telefono: this.telefono.value,
      correo: this.correo.value,
    }),
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  }).then((data) => {
    if (data.status == 403) {
      alert('CORREO EN USO');
      return;
    }
    window.location.reload();
  });
});
cuenta.addEventListener('submit', function (event) {
  event.preventDefault();
  if (this.passwordn.value != this.passwordn2.value) {
    alert('Las contraseñas no coinciden');
    return;
  }

  fetch('http://localhost:3000/cuenta', {
    method: 'PUT',
    body: JSON.stringify({
      password: this.passwordn.value,
    }),
    headers: {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
    },
  }).then(() => {
    window.location.reload();
  });
});
