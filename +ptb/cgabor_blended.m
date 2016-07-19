function gabormat = cgabor_blended(varargin)
%CGABOR_BLENDED Generates a 3-layer matrix (RGB) containing a chromatic Gabor
%patch blended to the background color.
%
%   Example: <a href="matlab:imshow(ptb.cgabor_blended(400, [], [], [], .01, [], 45, 20) / 255);">imshow(ptb.cgabor_blended(400, [], [], [], .01, [], 45, 20) / 255);</a>
%
%   See also CGABOR_ALPHA, GABOR_ALPHA, GABOR_BLENDED.

	rows       = parse_arg(varargin, 1,  mfilename, 'rows',       [],            {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols       = parse_arg(varargin, 2,  mfilename, 'cols',       rows,          {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	color1     = parse_arg(varargin, 3,  mfilename, 'color1',     [255 0 127.5], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', 'size', [1 3]});
	color2     = parse_arg(varargin, 4,  mfilename, 'color2',     [0 255 127.5], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', 'size', [1 3]});

	gabormat = ptb.cgabor_alpha(varargin{:});
	gabormat = apply_alpha( ...
		repmat(reshape((color1 + color2) / 2, [1 1 3]), [rows, cols, 1]), ...
		gabormat(:, :, 1:(end - 1)), ...
		gabormat(:, :, end) / 255 ...
		);
end