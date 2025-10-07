function  OnR = OnRect(input, thresthold)
%ONRECT Threshold operation for the luminance increment
%ON rectifier����ֵThreshold�����ȵ����ӽ��в���������ȡ�����ص����ȵ�����ֵ��
%   Code written by Junyu Zhao.
%   December 20, 2022.

if input>thresthold
    OnR = abs(input-thresthold);
else
    OnR = 0;
end
end
