function gratingmat = cgrating_alpha(varargin)
%CGRATING_ALPHA Generates a 4-layer matrix (RGB and alpha) containing a
%chromatic sinusoidal grating.
%
%   See also GRATING_ALPHA.

	rows       = parse_arg(varargin, 1,  mfilename, 'rows',       [],            {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols       = parse_arg(varargin, 2,  mfilename, 'cols',       rows,          {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	color1     = parse_arg(varargin, 3,  mfilename, 'color1',     [255 0 127.5], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', 'size', [1 3]});
	color2     = parse_arg(varargin, 4,  mfilename, 'color2',     [0 255 127.5], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', 'size', [1 3]});
	sine_freq  = parse_arg(varargin, 5,  mfilename, 'sine_freq',  [],            {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	sine_phase = parse_arg(varargin, 6,  mfilename, 'sine_phase', 90,            {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	sine_tilt  = parse_arg(varargin, 7,  mfilename, 'sine_tilt',  0,             {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});
	env_radius = parse_arg(varargin, 8,  mfilename, 'env_radius', [],            {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', 'positive'});
	env_ratio  = parse_arg(varargin, 9,  mfilename, 'env_ratio',  1,             {'numeric'}, {'scalar', 'real', 'finite', 'nonnan', 'positive'});
	env_tilt   = parse_arg(varargin, 10, mfilename, 'env_tilt',   0,             {'numeric'}, {'scalar', 'real', 'finite', 'nonnan'});

	sinemat = apply_alpha( ...
		repmat(reshape(color2, [1 1 3]), [rows, cols, 1]), ...
		repmat(reshape(color1, [1 1 3]), [rows, cols, 1]), ...
		mk_grating(map_linear(rows, cols, sine_tilt), sine_freq, sine_phase) ...
		);
	envmat = mk_shape(map_radial(rows, cols, env_ratio, env_tilt), env_radius);
	gratingmat = cat(3, sinemat, envmat * 255);
end