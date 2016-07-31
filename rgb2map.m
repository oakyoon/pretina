function rgbmap = rgb2map(varargin)
%RGB2MAP Generates a 3layer map from given RGB code.
%
%   RGBMAP = RGB2MAP(RGB ,ROWS [,COLS]) returns a ROWS-by-COLS-by-3 matrix,
%   whose elements contain R, G, and B values depending on the layer.
%
%   Arguments:
%      RGB  - 3-column vector of RGB code.
%      ROWS - number of rows.
%      COLS - number of columns, the same as ROWS if empty or not provided.

	rgb  = parse_arg(varargin, 1,  mfilename, 'rgb',  [],   {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan', 'size', [1 3]});
	rows = parse_arg(varargin, 2,  mfilename, 'rows', [],   {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});
	cols = parse_arg(varargin, 3,  mfilename, 'cols', rows, {'numeric'}, {'scalar', 'integer', 'finite', 'positive'});

	rgbmap = repmat(reshape(rgb, [1 1 3]), [rows, cols, 1]);
end