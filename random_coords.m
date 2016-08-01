function [coords, voidmap, n] = random_coords(varargin)
%RANDOM_COORDS Selects random x, y coordinate pairs a map.
%
%   [COORDS, VOIDMAP, N] = RANDOM_COORDS(MASK, PARAMS [,POSTFUNC] [,PREFUNC])
%   returns a coordinate pair matrix (COORDS, the same number of rows as
%   PARAMS), a map of void space (VOIDMAP, the same size as MASK), and the
%   number of successful placements (N). The coordinates are centered at the
%   center of the MASK. If there is not enough space left, remaining coordinate
%   pairs will be filled with 0, 0.
%
%   Arguments:
%      MASK     - area mask, forbids placement in the pixel marked with 0.
%      PARAMS   - parameters given to POSTFUNC and PREFUNC.
%      POSTFUNC - function handle, marks an element into VOIDMAP.
%      PREFUNC  - function handle, shrinks VOIDMAP before the element placement.
%
%   See also DEMO_RANDOMCOORDS_GAUSSIAN, DEMO_RANDOMCOORDS_CIRCLES,
%   DEMO_RANDOMCOORDS_RECTS.

	mask     = parse_arg(varargin, 1, mfilename, 'mask',     [], {'numeric'},           {'nonempty', 'real', 'finite', 'nonnan', '2d'});
	params   = parse_arg(varargin, 2, mfilename, 'params',   [], {'numeric', 'struct'}, {'nonempty', '2d'});
	postfunc = parse_arg(varargin, 3, mfilename, 'postfunc', @(m, p, mx, my) m .* (1 - (mx == 0) .* (my == 0)), {'function_handle'}, { });
	prefunc  = parse_arg(varargin, 4, mfilename, 'prefunc',  @(m, p) m,                                         {'function_handle'}, { });

	n_coords = size(params, 1);
	[mask_h, mask_w] = size(mask);
	[bx, by] = base_xy(mask_w, mask_h);

	voidmap = ones(mask_h, mask_w);
	coords = zeros(n_coords, 2);
	n = 0;

	seedmat = rand(mask_h, mask_w);
	for i = 1:n_coords
		tmpseed = seedmat .* prefunc(voidmap .* mask, params(i, :));
		if max(tmpseed(:)) == 0
			break;
		end
		[~, xx] = max(max(tmpseed, [], 1));
		[~, yy] = max(max(tmpseed, [], 2));
		coords(i, :) = [bx(yy, xx), by(yy, xx)];
		voidmap = postfunc(voidmap, params(i, :), ...
			bx - coords(i, 1), by - coords(i, 2) ...
			);
		n = i;
	end
end