function positions = getTreeLayout(edges, radius, numLeaves, dy)
	dx = 2 * radius/numLeaves;
	currX = -radius; % tracks the x coordinate of the i_th leaf
	% it is assumed the axis is a square and centered at 0
	
	% performs a dfs
	% the y coordinate of each node depends on it's level in the tree
	% the x axis is divided into numLeaves regions, and then each leaf is place at 
	% the start of a section
	% the x coordinate of an interior node is the average coordinate of it's children

	function positions = helper(currNode, level)
		sumX = 0; % the sum of the x coordinates of the children of 'node'
		numChildren = length(edges{currNode});
		positions = [];
		
		for v = edges{currNode}
			temp = helper(v, level + 1);
			positions = [positions; temp];
			sumX += temp(1, 2); % add the x coordinate of the i_{th} child 
		end

		if (numChildren==0) % if this is a leaf node 
			positions = [currNode, currX, radius - level * dy]; %set the x coordinate to currX 
			currX = currX + dx; % the x coordinate of the next leaf will be currX + dx
		else
			positions = [currNode, sumX/numChildren, radius - level*dy; positions]; % if interior node, 
														% then use average x coordinate of children
		end
	end

	positions = helper(1,0); % root is the first node, at level 1
	positions = sortrows(positions,1); % sort according to node number
	positions = positions(:, 2:end); % remove node numbers from the matrix
	% shift so that x coordinate of root is at center
	positions = [positions(:, 1) - positions(1, 1), positions(:, 2)];
end
	
