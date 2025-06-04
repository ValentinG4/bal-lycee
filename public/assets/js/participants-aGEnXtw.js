console.log("participant.js chargé !");

let isFetching = false;

    function fetchParticipants() {
      if (isFetching) return;
      isFetching = true;

      fetch('/participants/list')
        .then(response => response.json())
        .then(participants => {
          $('#table-valides').empty();
          $('#table-inscrits').empty();

          participants.forEach(p => {
            const iconClass = p.statut === 'valide' ? 'bi-dash-lg icon-minus' : 'bi-plus-lg icon-plus';
            const row = $(`
              <tr>
                <td>${p.nom}</td>
                <td>${p.prenom}</td>
                <td>${p.classe}</td>
                <td><i class="bi ${iconClass}" data-id="${p.id}" title="Basculer"></i></td>
              </tr>
            `);

            if (p.statut === 'valide') {
              $('#table-valides').append(row);
            } else {
              $('#table-inscrits').append(row);
            }
          });

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
    setInterval(fetchParticipants, 1000);
    fetchParticipants();