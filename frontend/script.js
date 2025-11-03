const API_BASE = "http://localhost:5000";

async function loadSection(section) {
  const content = document.getElementById("content");
  const appointmentForm = document.getElementById("appointmentForm");
  const prescriptionForm = document.getElementById("prescriptionForm");

  // Hide forms by default
  appointmentForm.classList.add("hidden");
  prescriptionForm.classList.add("hidden");

  content.innerHTML = `<p>Loading ${section}...</p>`;

  try {
    const response = await fetch(`${API_BASE}/${section}`);
    const data = await response.json();

    if (data.error) {
      content.innerHTML = `<p style="color:red;">Error: ${data.error}</p>`;
      return;
    }

    if (!Array.isArray(data) || data.length === 0) {
      content.innerHTML = `<p>No ${section} found.</p>`;
    } else {
      const table = document.createElement("table");

      // assign id to table 
      table.id = "data-table";

      const headers = Object.keys(data[0]);

      const thead = document.createElement("thead");
      const headerRow = document.createElement("tr");
      headers.forEach(h => {
        const th = document.createElement("th");
        th.textContent = h;
        headerRow.appendChild(th);
      });
      thead.appendChild(headerRow);
      table.appendChild(thead);

      const tbody = document.createElement("tbody");
      data.forEach(row => {
        const tr = document.createElement("tr");
        headers.forEach(h => {
          const td = document.createElement("td");
          td.textContent = row[h];
          tr.appendChild(td);
        });
        tbody.appendChild(tr);
      });
      table.appendChild(tbody);

      content.innerHTML = "";
      content.appendChild(table);
    }

    // Show forms only for specific sections
    if (section === "appointments") {
      appointmentForm.classList.remove("hidden");
    } else if (section === "prescription") {
      prescriptionForm.classList.remove("hidden");
    }

  } catch (err) {
    content.innerHTML = `<p style="color:red;">Failed to load ${section}: ${err.message}</p>`;
  }
}

// Add Appointment
async function submitAppointment(event) {
  event.preventDefault();
  const payload = {
    pet_id: parseInt(document.getElementById("petId").value),
    vet_id: parseInt(document.getElementById("vetId").value),
    date_time: document.getElementById("appointmentDate").value.replace("T", " "),
    reason: document.getElementById("reason").value
  };

  try {
    const response = await fetch(`${API_BASE}/appointments`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    const result = await response.json();
    console.log(result);
    alert(result.message || "Appointment added successfully!");
    loadSection("appointments");
  } catch (err) {
    alert("Error adding appointment: " + err.message);
  }
}

// Add Prescription
async function submitPrescription(event) {
  event.preventDefault();
  const payload = {
    record_id: parseInt(document.getElementById("recordId").value),
    item_name: document.getElementById("medication").value,
    quantity: document.getElementById("quantity").value,
    unit_price: document.getElementById("unitPrice").value,
    instruction: document.getElementById("instruction").value
  };

  try {
    const response = await fetch(`${API_BASE}/prescription`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    const result = await response.json();
    alert(result.message || "Prescription added successfully!");
    loadSection("prescription");
  } catch (err) {
    alert("Error adding prescription: " + err.message);
  }
}

// Default section
window.onload = () => loadSection("appointments");
