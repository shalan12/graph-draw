function positions = getRadialLayout(edges, radius, numLeaves, dy)
	positions = getTreeLayout(edges, radius, numLeaves, dy);
	positions = positions - positions(1, :); % shift so that root is at center	
	positions = [cos(positions(:, 1) .* (pi/radius)) .* positions(:,2), sin(positions(:,1) .*(pi/radius)) .* positions(:,2)];
	% y coordinate is used as the radius of the circle
	% x coordinate is used to distribute the points across the circle
end
