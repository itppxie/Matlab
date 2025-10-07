%1.主程序
clear,clc,close all;
ImageOrigin=im2double(imread('./images/second.png'));
figure,imshow(ImageOrigin),title('原图');
DBImage=DBfilt(ImageOrigin);                 %双边滤波

SkinImage1=FirstFilter(ImageOrigin);            %%初步过滤
SkinArea=SecondFilter(SkinImage1);           %%YCgCr空间范围肤色检测

SkinFuse=Fuse(ImageOrigin,DBImage,SkinArea);%图像融合
SkinBeautify=Sharp(SkinFuse);               %图像锐化

%Meibai=MB(SkinBeautify);

%2.图像平滑
function Out=DBfilt(In)
    [height,width,c] = size(In); 
    win=15;       % 定义双边滤波窗口宽度  
    sigma_s=6; sigma_r=0.1; % 双边滤波的两个标准差参数  
    [X,Y] = meshgrid(-win:win,-win:win); 
    Gs = exp(-(X.^2+Y.^2)/(2*sigma_s^2));%计算邻域内的空间权值    
    Out=zeros(height,width,c); 
    for k=1:c
        for j=1:height    
            for i=1:width  
                temp=In(max(j-win,1):min(j+win,height),max(i-win,1):min(i+win,width),k);
                Gr = exp(-(temp-In(j,i,k)).^2/(2*sigma_r^2));%计算灰度邻近权值        
                % W为空间权值Gs和灰度权值Gr的乘积       
                W = Gr.*Gs((max(j-win,1):min(j+win,height))-j+win+1,(max(i-win,1):min(i+win,width))-i+win+1);      
                Out(j,i,k)=sum(W(:).*temp(:))/sum(W(:));            
            end
        end  
    end
    figure,imshow(Out),title('双边滤波');
end
%3.皮肤区域分割
%3.1基于RGB空间的非肤色像素初步过滤
function Out=FirstFilter(In)
    Out=In;
    [height,width,c] = size(In); 
    IR=In(:,:,1); IG=In(:,:,2);IB=In(:,:,3);
    for j=1:height
        for i=1:width
            if (IR(j,i)<160/255 && IG(j,i)<160/255 && IB(j,i)<160) && (IR(j,i)>IG(j,i) && IG(j,i)>IB(j,i))
                Out(j,i,:)=0;
            end
            if IR(j,i)+IG(j,i)>500/255
                Out(j,i,:)=0;
            end
            if IR(j,i)<70/255 && IG(j,i)<40/255 && IB(j,i)<20/255
                Out(j,i,:)=0;
            end
        end
    end
 
    figure,imshow(Out);title('非肤色初步过滤'); 
end
%3.2基于YCgCr空间范围肤色分割
function Out=SecondFilter(In)
    IR=In(:,:,1); IG=In(:,:,2);IB=In(:,:,3);       
    [height,width,c] = size(In);
    Out=zeros(height,width);
    for i=1:width
        for j=1:height  
           R=IR(j,i); G=IG(j,i); B=IB(j,i);       
           Cg=(-81.085)*R+(112)*G+(-30.915)*B+128;  
           Cr=(112)*R+(-93.786)*G+(-18.214)*B+128;         
           if Cg>=85 && Cg<=135 && Cr>=-Cg+260 && Cr<=-Cg+280       
               Out(j,i)=1;          
           end
        end
    end
    Out=medfilt2(Out,[3 3]);
    
    figure,imshow(Out),title('YCgCr空间范围肤色检测');    
end
%4.图像融合
function Out=Fuse(ImageOrigin,DBImage,SkinArea)
    Skin=zeros(size(ImageOrigin));
    Skin(:,:,1)=SkinArea;   
    Skin(:,:,2)=SkinArea;  
    Skin(:,:,3)=SkinArea;
    Out=DBImage.*Skin+double(ImageOrigin).*(1-Skin);
    
    figure,imshow(Out);title('肤色与背景图像融合');
end
%5.图像锐化
function Out=Sharp(In)
    H=[0 -1 0;-1 4 -1;0 -1 0]; %Laplacian锐化模板
    Out(:,:,:)=imfilter(In(:,:,:),H); 
    Out=Out/3+In;
%     imwrite(Out,'man4.jpg');
    figure,imshow(Out),title('Laplacia锐化图像');
end