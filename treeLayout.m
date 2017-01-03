radius = 1; 
axis([-radius, radius, -radius, radius])
axis equal
hold on

edges = readGraph('sample-trees/full-binary-tree.in');

[numLeaves, height] = getTreeInfo(edges);
dy = 2 * radius/height;
positions = getTreeLayout(edges, radius, numLeaves, dy);
drawGraph(positions, edges);