%DEMO_RANDOMCOORDS_RECTS Demonstrates how to randomly place rectangles of
%various radius, ratio, and tilt within a masked area.
%
%   See <a href="matlab:edit Demo_RandomCoords_Rects;">source code</a> for details.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_CIRCLES,
%   DEMO_RANDOMCOORDS_GAUSSIAN.

n_rects = 30;								% number of rectangles: 30
r_rects = rand(n_rects, 1) * 10 + 15;		% radius of rectangles: 10 - 25 px
ratio = rand(n_rects, 1) * 1.5 + 1;			% x-to-y ratio of rectangles: 1 - 2.5
tilt = rand(n_rects, 1) * 180;				% tilt angle of rectangles: 0 - 180 degs.

% area mask (400 by 400 px rect w/ 150 x 150 px hole)
mask = ones(400) .* (1 - mk_shape(map_radial(400), 75));
subplot(1, 2, 1);
imshow(mask);

% random coordinates of rectangle centers
% rect. params. is a 3-column matrix and the columns represent:
%   radius + padding of each rectangle,
%   x-to-y ratio of each rectangle (set to 1 if not provided),
%   tilt angle of each rectangle (set to 0 if not provided).
padding_rects = 5;
[coords, voidmap, n] = random_coords(mask, ...
	[r_rects + padding_rects, ratio, tilt], ...	% rect. params.
	@postfunc_rect, @prefunc_rect ...
	);
subplot(1, 2, 2);
imshow(voidmap);

% center coordinates, radius, ratio, tilt
fprintf('%d rectangles randomly placed:\n', n);
disp([coords, r_rects, ratio, tilt]);
