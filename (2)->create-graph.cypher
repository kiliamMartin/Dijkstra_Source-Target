CALL gds.graph.create(
    'citiesGraph',
    'City',
    {ROAD:{ orientation: 'UNDIRECTED' } },
    {relationshipProperties: 'distance' }
);