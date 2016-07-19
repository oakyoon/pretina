function appliedmap = apply_alpha(varargin)
%APPLY_ALPHA Blends two matrices based on a provided alpha map.
%
%   APPLIEDMAP = APPLY_ALPHA(GROUNDMAP, PIXELMAP, ALPHAMAP) returns a matrix
%   with the size of GROUNDMAP. PIXELMAP is superimposed on the GROUNDMAP to
%   produce APPLIEDMAP. Opacity of the PIXELMAP is modulated depending on the
%   ALPHAMAP, of which elements range between 0 (transparent) to 1 (opaque).  
%
%   Arguments:
%      GROUNDMAP - a background image matrix.
%      PIXELMAP  - a foreground image matrix.
%      ALPHAMAP  - an alpha map, ranging between 0 (transparent) and 1 (opaque).

	groundmap = parse_arg(varargin, 1, mfilename, 'groundmap', [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', '3d'});
	pixelmap  = parse_arg(varargin, 2, mfilename, 'pixelmap',  [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', '3d', 'size', size(groundmap)});
	alphamap  = parse_arg(varargin, 3, mfilename, 'alphamap',  [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', '2d', ...
		'nrows', size(pixelmap, 1), 'ncols', size(pixelmap, 2)});

	alphamap = repmat(alphamap, 1, 1, size(pixelmap, 3));
	appliedmap = (pixelmap .* alphamap) + (groundmap .* (1 - alphamap));
end