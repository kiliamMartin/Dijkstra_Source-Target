MATCH (source:City {name: 'Madrid'}), (target:City {name: 'Barcelona'})
CALL gds.shortestPath.dijkstra.stream('citiesGraph', {
    sourceNode: source,
    targetNode: target,
    relationshipWeightProperty: 'distance'
})
YIELD index, sourceNode, targetNode, totalCost, nodeIds, costs, path
RETURN
    index,
    gds.util.asNode(sourceNode).name AS SourceCity,
    gds.util.asNode(targetNode).name AS TargetCity,
    totalCost as TotalDistance,
    [nodeId IN nodeIds | gds.util.asNode(nodeId).name] AS  CityNames,
    costs as Distances,
    nodes(path) as Path
ORDER BY index