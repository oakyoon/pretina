function gabormat = gabor_blended(varargin)
%GABOR_BLENDED Generates a matrix containing a Gabor patch blended to the
%background luminance.
%
%   Example: <a href="matlab:imshow(ptb.gabor_blended(400, [], [], [], .01, [], 45, 20) / 255);">imshow(ptb.gabor_blended(400, [], [], [], .01, [], 45, 20) / 255);</a>
%
%   See also GABOR_ALPHA, CGABOR_ALPHA, CGABOR_BLENDED.

	rows       = parse_arg(varargin, 1,  mfilename, 'rows',       [],    {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols       = parse_arg(varargin, 2,  mfilename, 'cols',       rows,  {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	bg_lum     = parse_arg(varargin, 3,  mfilename, 'bg_lum',     127.5, {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});

	gabormat = ptb.gabor_alpha(varargin{:});
	gabormat = apply_alpha(bg_lum, ...
		gabormat(:, :, 1:(end - 1)), ...
		gabormat(:, :, end) / 255 ...
		);
end