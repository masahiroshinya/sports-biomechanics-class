function  h = stickPicture(Markers, MarkerNames, frameNumber, coordination, varargin)

% stickPicture    �X�e�B�b�N�s�N�`���[�̕`��
%
% Markers: Markers�\���́i�}�[�J�[�����t�B�[���h�Ɏ��j
% MarkerNames: �`�悵�����}�[�J�[�̖��O�i�Z���z��j
% frameNumber: �`�悵�����t���[���ԍ�
% coordination: �`�悷��ʂ�����������ie.g. ���ʂȂ� 'yz'�j�܂��́A
%                   �C���f�b�N�X�ie.g. ���ʂȂ� [2,3]�j
%               '3d'�܂���'xyz' ���w�肷��ƂR�����v���b�g
%
% Last edited by SHINYA, 2024-05-05


%% �J���p
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
