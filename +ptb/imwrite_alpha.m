function imwrite_alpha(varargin)
%IMWRITE_ALPHA Wraps a MATLAB function IMWRITE, and write an image file with an
%alpha channel if provided as the 2nd layer (L<strong>A</strong>) or 4th layer (RGB<strong>A</strong>). Arguments
%are the same as IMWRITE.
%
%   See also IMWRITE.

	A  = parse_arg(varargin, 1, mfilename, 'A', [], {'numeric'}, {'nonempty', 'real', 'finite', 'nonnan'});
	if any(size(A, 3) == [2, 4])
		imwrite(A(:, :, 1:(end - 1)), varargin{2:end}, 'Alpha', A(:, :, end));
	else
		imwrite(varargin{:});
	end
end