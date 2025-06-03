document.addEventListener("DOMContentLoaded", function () {
    const resultBox = document.getElementById("result");
    const pageBody = document.getElementById("page-body");
    const scanBtn = document.getElementById("scan-btn");
    const nextBtn = document.getElementById("next-btn");
    console.log("scan.js chargé !");
  
    const scanner = new Html5Qrcode("reader");
    let scanning = false;
  
    function handleResult() {
      console.log("Résultat du scan reçu");
      scanning = false;
      // Vérifie si le scanner est en cours avant d'appeler stop()
      if (scanner.getState && scanner.getState() === 2) { // 2 = SCANNING
        scanner.stop();
      }
  
      resultBox.className = "alert alert-warning mt-4 result-box";
      resultBox.textContent = "🔍 Vérification du QR code...";
  
      fetch('/api/scan/2c16f47b-f355-4737--9ee53d4f0419')
        .then(res => res.json())
        .then(data => {
          if (data.status === "valid") {
            document.body.style.background = "linear-gradient(135deg, #38ef7d, #11998e)";
            resultBox.className = "alert alert-success mt-4 result-box";
            resultBox.innerHTML = `<strong>✅ Accès autorisé :</strong><br>${data.prenom} ${data.nom} - ${data.classe}`;
          } else if (data.status === "already_used") {
            document.body.style.background = "linear-gradient(135deg, #ffa751, #f83600)";
            resultBox.className = "alert alert-warning mt-4 result-box";
            resultBox.innerHTML = `<strong>⚠️ Déjà scanné :</strong><br>${data.prenom} ${data.nom} - ${data.classe}`;
          } else {
            document.body.style.background = "linear-gradient(135deg, #ff416c, #ff4b2b)";
            resultBox.className = "alert alert-danger mt-4 result-box";
            resultBox.innerHTML = `<strong>❌ QR code inconnu</strong>`;
          }
  
          nextBtn.classList.remove("d-none");
          scanBtn.classList.add("d-none");
        })
        .catch(err => {
          resultBox.className = "alert alert-danger mt-4 result-box";
          resultBox.textContent = "Erreur lors de la vérification : " + err;
          pageBody.style.background = "linear-gradient(135deg, #ff416c, #ff4b2b)";
        });
    }
  
    scanBtn.addEventListener("click", () => {
      if (scanning) return;
  
      scanning = true;
      resultBox.className = "alert alert-warning mt-4 result-box";
      resultBox.textContent = "🔍 En attente de détection...";
      pageBody.style.background = "linear-gradient(135deg, rgb(0, 145, 255), rgb(0, 4, 255))";
  
      scanner.start(
        { facingMode: "environment" },
        {
          fps: 10,
          qrbox: { width: 250, height: 250 }
        },
        handleResult,
        error => {
          // silencieux
        }
      ).catch(err => {
        resultBox.className = "alert alert-danger mt-4 result-box";
        resultBox.textContent = "Erreur caméra : " + err;
      });
    });
  
    nextBtn.addEventListener("click", () => {
      pageBody.style.background = "linear-gradient(135deg, rgb(0, 145, 255), rgb(0, 4, 255))";
      resultBox.className = "alert alert-secondary mt-4 result-box";
      resultBox.textContent = "En attente d'action...";
      nextBtn.classList.add("d-none");
      scanBtn.classList.remove("d-none");
    });
  
    // 👉 Support test manuel du token
    document.getElementById("test-btn").addEventListener("click", () => {
      handleResult();
    });
  });