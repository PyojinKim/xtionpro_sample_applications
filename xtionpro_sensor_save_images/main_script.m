%% check depth and rgb images

figure;
imshow(depthRaw, []);

figure;
imshow(rgbRaw, []);


%% 3D reconstruction

K = eye(3);
K(1,1) = 525.0;
K(2,2) = 525.0;
K(1,3) = 319.5;
K(2,3) = 239.5;


imageDepthMeter = double(depthRaw) / 1000;

Points = zeros(3, 480*640);
Colors = zeros(3, 480*640);
count = 0;

for v = 1 : 480
    for u = 1:640
        
        if (imageDepthMeter(v, u) >= 0.3 && imageDepthMeter(v, u) <= 10)
            count = count + 1;
            
            depth = imageDepthMeter(v, u);
            
            Points(1, count) = ( (u - K(1,3)) / K(1,1) ) * depth;
            Points(2, count) = ( (v - K(2,3)) / K(2,2) ) * depth;
            Points(3, count) = depth;
            
            Colors(1, count) = rgbRaw(v, u, 1);
            Colors(2, count) = rgbRaw(v, u, 2);
            Colors(3, count) = rgbRaw(v, u, 3);
        end
    end
end

Points(:, (count+1):end) = [];
Colors(:, (count+1):end) = [];

tempPoints = Points(:,1:2:end);
tempColors = Colors(:,1:2:end) / 255;

figure;
scatter3( tempPoints(1,:), tempPoints(2,:), tempPoints(3,:) , 3*ones(1, size(tempColors,2)), tempColors.' ) ; axis equal;












