LOAD CSV FROM "file:///cities.csv"
AS line
CREATE (:City { id: toInteger(line[0]), name: line[1] })

LOAD CSV WITH HEADERS FROM "file:///distances.csv"
AS line
MATCH (c1:City { id: toInteger(line.FromCity) }),
  (c2:City { id: toInteger(line.ToCity) })
CREATE path = (c1) -[:ROAD {name: 'ROAD-' + line.Id, distance: toInteger(line.DistanceKM) }]-> (c2)