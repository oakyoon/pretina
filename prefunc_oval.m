function voidmap = prefunc_oval(voidmap, params)
%PREFUNC_OVAL Shrinks a void map for a new ellipse placement when being used in
%coordination with RANDOM_COORDS function.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_CIRCLES.

	[radius, ratio, tilt] = parse_params(params, [], 1, 0);

	kernel_oval = mk_shape( ...
		map_radial( ...
			ceil(max(radius ./ [1, ratio]) * 2), ...
			[], ratio, tilt ...
			), ...
		radius ...
		);
	bumpmap = ones(size(voidmap) + 2);
	bumpmap(2:(end - 1), 2:(end - 1)) = 1 - voidmap;
	bumpmap = min(1, filter2(kernel_oval, bumpmap, 'same'));
	voidmap = 1 - bumpmap(2:(end - 1), 2:(end - 1));
end