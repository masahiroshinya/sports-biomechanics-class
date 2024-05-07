function  h = stickPicture(Markers, MarkerNames, frameNumber, coordination, varargin)

% stickPicture    スティックピクチャーの描画
%
% Markers: Markers構造体（マーカー名をフィールドに持つ）
% MarkerNames: 描画したいマーカーの名前（セル配列）
% frameNumber: 描画したいフレーム番号
% coordination: 描画する面を示す文字列（e.g. 矢状面なら 'yz'）または、
%                   インデックス（e.g. 矢状面なら [2,3]）
%               '3d'または'xyz' を指定すると３次元プロット
%
% Last edited by SHINYA, 2024-05-05


%% 開発用
% MarkerNames = {'Shoulder', 'Elbow', 'Wrist'};
% frameNumber = 1 ;
% coordination = 'yz' ;

%%
if isequal(coordination, 'xyz') || isequal(coordination, '3d')
    % 3D coordination
    
    % plot propertiers
    PP = {} ;
    if nargin >= 4
        PP = varargin ;
    end

    % [xx, yy] coordination to plot
    nMarkers = length(MarkerNames) ;
    xx = [] ; yy = [] ; zz = [] ;
    for iMarker = 1:nMarkers
        xx = [xx, Markers.(MarkerNames{iMarker})(frameNumber, 1)] ;
        yy = [yy, Markers.(MarkerNames{iMarker})(frameNumber, 2)] ;
        zz = [zz, Markers.(MarkerNames{iMarker})(frameNumber, 3)] ;
    end

    % plot
    h = plot3(xx,yy,zz, PP{:}) ;
    
else
    % 2D coordination
    if isequal(coordination, 'xy')
        ind = [1,2] ;
    elseif isequal(coordination, 'yz')
        ind = [2,3] ;
    elseif isequal(coordination, 'xz')
        ind = [1,3] ;
    else
        ind = coordination ;
    end

    % plot propertiers
    PP = {} ;
    if nargin >= 5
        PP = varargin ;
    end

    % [xx, yy] coordination to plot
    nMarkers = length(MarkerNames) ;
    xx = [] ; yy = [] ;
    for iMarker = 1:nMarkers
        xx = [xx, Markers.(MarkerNames{iMarker})(frameNumber, ind(1))] ;
        yy = [yy, Markers.(MarkerNames{iMarker})(frameNumber, ind(2))] ;
    end

    % plot
    h = plot(xx,yy, PP{:}) ;
end
