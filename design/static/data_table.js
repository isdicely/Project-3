// Get data and display
d3.csv("/static/winequality-TOTAL.csv").then(function (data) {
  console.log(data);
  //   Set wine type dropdown menu
  const winetypeDropdownMenuSelection = d3.selectAll("#selWineType");
  const winetypeDropdownMenu = winetypeDropdownMenuSelection.node();
  const unique_winetype = new Set(data.map((entry) => entry.type));
  // Add a opt for both wine types
  const opt_all_winetype = document.createElement("option");
  opt_all_winetype.value = "";
  opt_all_winetype.innerHTML = "[All Types]";
  winetypeDropdownMenu.appendChild(opt_all_winetype);
  // Add opts for both wine types to the dropdown menu
  [...unique_winetype].sort().forEach((type) => {
    const opt = document.createElement("option");
    opt.value = type;
    opt.innerHTML = type;
    winetypeDropdownMenu.appendChild(opt);
  });
  console.log(winetypeDropdownMenu);

  // Set Quality dropdown menu
  const QualityDropdownMenuSelection = d3.selectAll("#selQuality");
  const QualityDropdownMenu = QualityDropdownMenuSelection.node();
  const unique_quality = new Set(data.map((entry) => entry.quality));
  // Add opt for no quality
  const opt_no_quality = document.createElement("option");
  opt_no_quality.value = "";
  opt_no_quality.innerHTML = "[All Quality]";
  QualityDropdownMenu.appendChild(opt_no_quality);
  // Add opts for all quality
  [...unique_quality].sort().forEach((quality) => {
    const opt_element = document.createElement("option");
    opt_element.value = quality;
    opt_element.innerHTML = quality;
    QualityDropdownMenu.appendChild(opt_element);
  });

  // Append Table heading and Column names
  const table = document.querySelector("table");
  const thead = table.createTHead();
  const tbody = document.createElement("tbody");
  const row = thead.insertRow();
  for (const key in data[0]) {
    const th = document.createElement("th");
    const text = document.createTextNode(key);
    th.appendChild(text);
    row.appendChild(th);
  }
  function make_table(data) {
    // Add table contents

    // Function to sort data by quality score and type
    function byQualityScoreandType(a, b) {
      if (a.quality < b.quality) return -1;
      if (a.quality === b.quality) {
        if (a.type < b.type) return -1;
        if (a.type === b.type) return 0;
      }
      return 1;
    }
    data.sort(byQualityScoreandType).forEach((entry) => {
      let row = tbody.insertRow();
      Object.values(entry).forEach((value) => {
        let cell = row.insertCell();
        const text = document.createTextNode(value);
        cell.appendChild(text);
      });
    });
    table.appendChild(tbody);
  }
  make_table(data);

  // THIS IS WHERE YOU LEFT OFF

  let lastSelectedQuality = QualityDropdownMenu.value;
  function updateTable(event) {
    // Prevent the page from refreshing
    event.preventDefault();
    // Clear any input
    while (tbody.firstChild) tbody.removeChild(tbody.lastChild);

    // Retrive quality selected
    const quality_selected = QualityDropdownMenu.value;
    if (lastSelectedQuality !== quality_selected) {
      lastSelectedQuality = quality_selected;
      const hasQuality = lastSelectedQuality !== "";
      const qualityWineType = new Set(
        data.flatMap((entry) =>
          !hasQuality || lastSelectedQuality === entry.quality ? entry.type : []
        )
      );
    }

    // Retrive type selected
    const winetype_selected = winetypeDropdownMenu.value;

    if (winetype_selected === "") {
      if (quality_selected === "") {
        make_table(data);
      } else {
        // filter data based on quality
        const quality_filtered_display_data = data.filter(
          (entry) => entry.quality === quality_selected
        );

        make_table(quality_filtered_display_data);
      }
    } else {
      // Filter data based on selected wine type
      const winetype_filtered_display_data = data.filter(
        (entry) => entry.type === winetype_selected
      );

      // check if we also need to filter by quality,
      // and do so, if needed

      filtered_display_data =
        quality_selected === ""
          ? winetype_filtered_display_data
          : winetype_filtered_display_data.filter(
              (entry) => entry.quality === quality_selected
            );

      make_table(filtered_display_data);
    }
  }
  // Create event handler, set on chage
  winetypeDropdownMenuSelection.on("input", updateTable);

  // move this to the new function***********

  QualityDropdownMenuSelection.on("input", updateTable);
});
