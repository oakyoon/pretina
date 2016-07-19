%DEMO_RANDOMCOORDS_CIRCLES Demonstrates how to randomly place circles of various
%radius within a masked area.
%
%   See <a href="matlab:edit Demo_RandomCoords_Circles;">source code</a> for details.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_RECTS, DEMO_RANDOMCOORDS_GAUSSIAN.

n_circles = 40;								% number of circles: 40
r_circles = rand(n_circles, 1) * 25 + 5;	% radius of circles: 5 - 30 px

% area mask (400 by 400 px circle)
mask = mk_shape(map_radial(400), 200);
subplot(1, 2, 1);
imshow(mask);

% random coordinates of circle centers
% oval params. is a 3-column matrix and the columns represent:
%   radius + padding of each ellipse,
%   x-to-y ratio of each ellipse (set to 1 if not provided),
%   tilt angle of each ellipse (set to 0 if not provided).
padding_circle = 5;
[coords, voidmap, n] = random_coords(mask, ...
	r_circles + padding_circle, ...		% oval params.
	@postfunc_oval, @prefunc_oval ...
	);
subplot(1, 2, 2);
imshow(voidmap);

% center coordinates, radius
fprintf('%d circles randomly placed:\n', n);
disp([coords, r_circles]);
