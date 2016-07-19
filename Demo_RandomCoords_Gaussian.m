%DEMO_RANDOMCOORDS_GAUSSIAN Demonstrates how to randomly place Gaussian
%envelopes (e.g., Gaussian dot, or Gabor) within a masked area.
%
%   See <a href="matlab:edit Demo_RandomCoords_Gaussian;">source code</a> for details.
%
%   See also RANDOM_COORDS, DEMO_RANDOMCOORDS_CIRCLES, DEMO_RANDOMCOORDS_RECTS.

n_envelopes = 50;								% number of envelopes: 50
sd_envelopes = ones(n_envelopes, 1) * 5;		% S.D. of Gaussian: 5 px

% area mask (350 by 350 px circle)
mask = mk_shape(map_radial(400), 175);
subplot(1, 2, 1);
imshow(mask);

% random coordinates of Gaussian centers
% Gaussian params. is a 3-column matrix and the columns represent:
%   sd * padding coefs. of each Gaussian,
%   x-to-y ratio of each Gaussian (set to 1 if not provided),
%   tilt angle of each Gaussian (set to 0 if not provided).
padding_coefs = 2;
[coords, voidmap, n] = random_coords(mask, ...
	sd_envelopes * padding_coefs, ...		% Gaussian params.
	@postfunc_gaussian ...
	);
subplot(1, 2, 2);
imshow(voidmap);

% center coordinates, radius
fprintf('%d envelopes randomly placed:\n', n);
disp([coords]);
