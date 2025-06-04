console.log("participant.js chargé WESH LE 3!");

let isFetching = false;

function fetchParticipants() {
  if (isFetching) return;
  isFetching = true;

  fetch('/participants/list')
    .then(response => response.json())
    .then(participants => {
      console.log("Participants reçus :", participants);
      $('#table-valides').empty();
      $('#table-inscrits').empty();


      let countValides = 0;
      
      participants.forEach(p => {
        const isValide = p.statut === true || p.statut === 1 || p.statut === "1";
        if (isValide) countValides++;
        const iconClass = isValide ? 'bi-dash-lg icon-minus' : 'bi-plus-lg icon-plus';
        const row = $(`
          <tr>
            <td>${p.nom}</td>
            <td>${p.prenom}</td>
            <td>${p.classe}</td>
            <td><i class="bi ${iconClass}" data-id="${p.id}" title="Basculer"></i></td>
          </tr>
        `);

        if (isValide) {
          $('#table-valides').append(row);
        } else {
          $('#table-inscrits').append(row);
        }
      });
      console.log("Nombre de validés :", countValides);
      bindToggleActions();
    })
    .finally(() => isFetching = false);
}

function bindToggleActions() {
  $('i[data-id]').off('click').on('click', function () {
    const id = $(this).data('id');
    $.post(`/participants/toggle/${id}`, fetchParticipants);
  });
}

// Recherche dans chaque tableau
document.querySelectorAll('.search-input').forEach(input => {
  input.addEventListener('input', () => {
    const filter = input.value.toLowerCase();
    const tbody = document.getElementById(input.getAttribute('data-target'));
    tbody.querySelectorAll('tr').forEach(row => {
      row.style.display = row.textContent.toLowerCase().includes(filter) ? '' : 'none';
    });
  });
});

// Actualisation auto
$(document).ready(function() {
  setInterval(fetchParticipants, 1000);
  fetchParticipants();
});