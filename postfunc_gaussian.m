function voidmap = postfunc_gaussian(voidmap, params, mx, my)
%POSTFUNC_GAUSSIAN Marks a new Gaussian to a void map when being used in
%coordination with RANDOM_COORDS function.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_GAUSSIAN.

	[sd, ratio, tilt] = parse_params(params, [], 1, 0);

	[bx, by] = rotate_xy(mx, my, tilt);
	voidmap = voidmap .* (1 - mk_gaussian(xy2ecc(bx, by * ratio), sd));
end