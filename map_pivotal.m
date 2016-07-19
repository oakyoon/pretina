function pixelmap = map_pivotal(varargin)
%MAP_PIVOTAL Generates a map of angles measured from the positive x-axis.
%
%   PIXELMAP = MAP_PIVOTAL(ROWS [,COLS] [,PHASE]) returns a ROWS-by-COLS matrix,
%   whose elements contain angles measured from the positive x-axis tilted by
%   PHASE degrees.
%
%   Arguments:
%      ROWS  - number of rows.
%      COLS  - number of columns, the same as ROWS if empty or not provided.
%      PHASE - tilt angle of the positive x-axis, 0 if empty or not provided.
%
%   Example:
%      imshow(map_pivotal(200, [], 45) / 360);

	rows  = parse_arg(varargin, 1, mfilename, 'rows',  [],    {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols  = parse_arg(varargin, 2, mfilename, 'cols',  rows,  {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	phase = parse_arg(varargin, 3, mfilename, 'phase', 0,     {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});

	[bx, by] = base_xy(cols, rows, phase);
	pixelmap = xy2angle(bx, by);
end