function voidmap = postfunc_oval(voidmap, params, mx, my)
%POSTFUNC_OVAL Marks a new ellipse to a void map when being used in coordination
%with RANDOM_COORDS function.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_CIRCLES.

	[radius, ratio, tilt] = parse_params(params, [], 1, 0);

	[bx, by] = rotate_xy(mx, my, tilt);
	voidmap = voidmap .* (1 - mk_shape(xy2ecc(bx, by * ratio), radius));
end