export const postBench = (bench) =>(
  $.ajax({
    method: "POST",
    url: "api/benches",
    data: {bench: bench}
  })
);

export const getAllBenches = (filters) =>(
  $.ajax({
    method: "GET",
    url: "api/benches",
    data: filters
  })
);

export const getBench = (id) =>(
  $.ajax({
    method: "GET",
    url: `api/benches/${id}`
  })
);

export const updateBench = (bench) =>(
  $.ajax({
    method: "GET",
    url: `api/benches/${bench.id}`,
    data: {bench: bench}
  })
);

export const deleteBench = (id) =>(
  $.ajax({
    method: "DELETE",
    url: `api/benches/${id}`
  })
);
