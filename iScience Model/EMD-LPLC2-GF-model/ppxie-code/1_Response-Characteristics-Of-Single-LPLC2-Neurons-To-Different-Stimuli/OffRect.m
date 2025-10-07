function  OffR = OffRect(input, thresthold)
%OFFRECT Threshold operation for the luminance decrement

if input<thresthold
    OffR = abs(input-thresthold);
else
    OffR = 0;
end
end
