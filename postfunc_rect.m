function voidmap = postfunc_rect(voidmap, params, mx, my)
%POSTFUNC_RECT Marks a new rectangle to a void map when being used in
%coordination with RANDOM_COORDS function.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_RECTS.

	[radius, ratio, tilt] = parse_params(params, [], 1, 0);

	[bx, by] = rotate_xy(mx, my, tilt);
	voidmap = voidmap .* (1 - mk_shape(max(abs(bx), abs(by) * ratio), radius));
end