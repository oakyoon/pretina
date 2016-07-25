function normmap = normalize_map(varargin)
%NORMALIZE_MAP Normalizes a matrix to a range between 0 and 1.
%
%   NORMMAP = NORMALIZE_MAP(PIXELMAP [,MINVAL] [,MAXVAL]) returns a matrix with
%   the size of PIXELMAP scaled to a range between 0 and 1. MINVAL is scaled to
%   0 and MAXVAL is scaled to 1 from the elements of PIXElMAP.
%
%   Arguments:
%      PIXELMAP - an image matrix.
%      MINVAL   - a value to scale to 0, min(PIXELMAP) if empty or not provided.
%      MAXVAL   - a value to scale to 1, max(PIXELMAP) if empty or not provided.

	pixelmap = parse_arg(varargin, 1, mfilename, 'pixelmap', [],               {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	minval   = parse_arg(varargin, 2, mfilename, 'minval',   min(pixelmap(:)), {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	maxval   = parse_arg(varargin, 3, mfilename, 'maxval',   max(pixelmap(:)), {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', '>', minval});

	normmap = ((pixelmap - minval) / (maxval - minval));
end