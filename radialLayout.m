radius = 1; 
axis([-radius, radius, -radius, radius])
axis equal
hold on

edges = readGraph('sample-trees/full-binary-tree.in');

[numLeaves, height] = getTreeInfo(edges);
dy = radius/height;
positions = getRadialLayout(edges, radius, numLeaves, dy);
drawGraph(positions, edges);

% draw circles centered at 0, of increasing radius
for i = 1:height
	rectangle('Position',[-dy*i,-dy*i,2*dy*i,2*dy*i],'Curvature',1)
end