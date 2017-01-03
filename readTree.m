% reads in a graph from a file with the following format
% number of nodes on line 1
% neighbors of each node (space seperated) on subsequent lines 
function edges = readGraph(filename)
	fid = fopen(filename);
	numNodes = str2num(fgetl(fid));
	edges = cell(1,numNodes);
	for i = 1:numNodes
		edges{i} = str2num(fgetl(fid));
	end
	fclose(fid);
end