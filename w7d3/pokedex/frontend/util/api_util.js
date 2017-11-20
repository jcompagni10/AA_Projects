




export const fetchAllPokemon = () => {
  return (
    $.ajax({
      type: 'GET',
      url: 'api/pokemon'
    })
  );
};
