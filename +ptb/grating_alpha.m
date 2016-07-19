function gratingmat = grating_alpha(varargin)
%GRATING_ALPHA Generates a 2-layer matrix (luminance and alpha) containing a
%grayscale sinusoidal grating.
%
%   See also CGRATING_ALPHA.

	rows       = parse_arg(varargin, 1,  mfilename, 'rows',       [],    {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols       = parse_arg(varargin, 2,  mfilename, 'cols',       rows,  {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	bg_lum     = parse_arg(varargin, 3,  mfilename, 'bg_lum',     127.5, {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	contrast   = parse_arg(varargin, 4,  mfilename, 'contrast',   1,     {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	sine_freq  = parse_arg(varargin, 5,  mfilename, 'sine_freq',  [],    {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	sine_phase = parse_arg(varargin, 6,  mfilename, 'sine_phase', 90,    {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	sine_tilt  = parse_arg(varargin, 7,  mfilename, 'sine_tilt',  0,     {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	env_radius = parse_arg(varargin, 8,  mfilename, 'env_radius', [],    {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', 'positive'});
	env_ratio  = parse_arg(varargin, 9,  mfilename, 'env_ratio',  1,     {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', 'positive'});
	env_tilt   = parse_arg(varargin, 10, mfilename, 'env_tilt',   0,     {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});

	sinemat = mk_grating(map_linear(rows, cols, sine_tilt), ...
		sine_freq, sine_phase ...
		);
	envmat = mk_shape(map_radial(rows, cols, env_ratio, env_tilt), env_radius);
	gratingmat = cat(3, ...
		((sinemat * 2 - 1) * contrast + 1) * bg_lum, ...
		envmat * 255 ...
		);
end