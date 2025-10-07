function  OffR = OffRect(input, thresthold)
%OFFRECT Threshold operation for the luminance decrement
%OFF rectifier：对亮度减小的操作，即获取该像素点亮度的减小值？
%   Code written by Junyu Zhao.
%   December 20, 2022.

if input<thresthold
    OffR = abs(input-thresthold);
else
    OffR = 0;
end
end
