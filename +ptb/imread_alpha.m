function image = imread_alpha(varargin)
%IMREAD_ALPHA Wraps a MATLAB function IMREAD, and adds an alpha channel below
%the image layers if there is one. Arguments are the same as IMREAD.
%
%   See also IMREAD.

	[image, ~, alpha] = imread(varargin{:});
	if size(image, 1) == size(alpha, 1) && size(image, 2) == size(alpha, 2)
		image(:, :, end + 1) = alpha;
	end
end