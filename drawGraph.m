function drawGraph(nodePositions, edges)
	%draw nodes
	plot(nodePositions(:,1),nodePositions(:,2),'.')

	%draw edges
	for i = 1:length(edges)
		for j = edges{i}
			line(nodePositions([i,j],1),nodePositions([i,j],2),'Color','b','LineWidth',1,'LineStyle','-')
		end
	end
end