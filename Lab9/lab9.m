clear; clc; close all;

imageFiles = {'studded_tire.jpg', 'summer_tire.jpg'};

for i = 1:numel(imageFiles)

    % ---------- 1) Read & resize ----------
    I = imread(imageFiles{i});
    I = imresize(I, 0.5);   % optional scaling

    % ---------- 2) Convert to grayscale ----------
    % TODO: if image is RGB, convert using rgb2gray()

    % ---------- 3) Create tire mask ----------
    Igray = im2gray(I);                 % safe even if already gray
    Inorm = mat2gray(Igray);            % scale to [0 1]
    
    tireMask = Inorm < 0.4;             % tire is dark
    tireMask = imfill(tireMask,'holes');
    tireMask = bwareaopen(tireMask,500);
    
    % ---------- 4) Candidate studs ----------
    % studs = bright spots inside tire
    cand = (Inorm > 0.8) & tireMask;    % threshold for bright points
    cand = bwareaopen(cand,3);          % remove tiny noise
    cand = imclose(cand, strel('disk',1));
    
    % ---------- 5) Connected components ----------
    CC    = bwconncomp(cand);
    stats = regionprops(CC,'Area','Perimeter','Eccentricity');
    
    % ---------- 6) Filter candidates ----------
    studMask  = false(size(cand));      % <-- now cand exists
    studCount = 0;


    % Choose reasonable limits for your images:
    minA = 4;      % min area of a stud
    maxA = 120;    % max area of a stud
    minCirc = 0.6; % minimum circularity
    maxEcc = 0.85; % maximum eccentricity

    % TODO: loop over stats, apply filters, count valid studs
    % for k = 1:numel(stats)
    %   ...
    % end

    % ---------- 7) Decision rule ----------
    tireArea = sum(tireMask(:));          % number of pixels in tire
    density  = studCount / tireArea;      % studs per pixel (optional)
    
    % Simple rule – adjust thresholds for your images
    isStudded = (studCount > 10) || (density > 1e-4);


    % ---------- 8) Visualization ----------
    figure;
    subplot(1,3,1);
    imshow(I); title(sprintf('Input: %s', imageFiles{i}), 'Interpreter','none');
    
    subplot(1,3,2);
    imshow(cand); title('Candidate studs (binary)');
    
    subplot(1,3,3);
    imshow(I); hold on;
    visboundaries(studMask, 'LineWidth', 0.7);
    
    if isStudded
        title(sprintf('STUDDED TIRE (studs: %d)', studCount));
    else
        title(sprintf('NON-STUDDED TIRE (studs: %d)', studCount));
    end

end