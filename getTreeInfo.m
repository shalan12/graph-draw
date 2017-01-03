function [numLeaves, height] = getTreeInfo(edges)
	
	function [numLeaves, height] = helper(edges, currNode)
		isLeaf = (length(edges{currNode}) == 0);
		height = 0;
		numLeaves = isLeaf;
		
		for v = edges{currNode}
			[leaves, levels] = helper(edges, v);
			numLeaves += leaves;
			height = max(height, levels);
		end
		
		if (isLeaf == 0)
			height += 1;
		end
	end

	[numLeaves, height] = helper(edges, 1);
end