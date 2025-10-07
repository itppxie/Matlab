function  OnR = OnRect(input, thresthold)
%ONRECT Threshold operation for the luminance increment
%ON rectifier：阈值Threshold对亮度的增加进行操作，即获取该像素点亮度的增加值？
%   Code written by Junyu Zhao.
%   December 20, 2022.

if input>thresthold
    OnR = abs(input-thresthold);
else
    OnR = 0;
end
end
