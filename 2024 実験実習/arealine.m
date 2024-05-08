function patchObj = arealine(varargin)

% arealine  ���������������G���A�̃v���b�g�ipatch���g�p�j
%
% arealine(X,'v',...) �̓J�����g�� axes�� x=X �ɁA��[���牺�[�܂Œ����G���A���쐬���܂�
% X = [x1, x2] ��2�v�f�̃x�N�g���ŁAx1<x<x2 �̗̈�� patch �ŁA�h��Ԃ��܂�
%
% ���Ȃ킿�Aplot([X,X],gca(get,'YLim'),...) �Ɠ����ł�
% ...�����ɂ� plot �ɗp����v���p�e�B����͂��܂�
% X������n�̃x�N�g���̏ꍇn�{�̒������v���b�g���܂�
%
% lineplot(Y,'h',...) �̓J�����g��axes�� y=Y �ɁA���[����E�[�܂Œ������v���b�g���܂�
%
% lineplot(AX,...) �̓J�����g�̑����AX��lineplot���s���܂�
%
% h = lineplot �� h �Ƀn���h�����o�͂��܂�
% n�{�̒������v���b�g�����ꍇ�Ah�͂��v�f����Ȃ�x�N�g���ƂȂ�܂�
%
% last update: 2015-06-07 (Shinya)

%--------------------------------------------------------------------------

DefaultPatchProperties = {[0.5, 0.5, 0.5], 'FaceAlpha', 0.3, 'LineStyle', 'none'} ;

if isempty(axescheck(varargin{1})) % ��1������ axis ���w�肳��Ă��Ȃ��@�igca �ɍ쐬�j
    AX = gca ; value = varargin{1} ; direction = varargin{2} ;
    if nargin >= 3 % plot property ���w�肳��Ă���
        p = 3 ;  
        P = 1 ; 
        PatchProperties = varargin{3:end} ; 
    elseif nargin == 2 % plot property ���w�肳��Ă��Ȃ��@�i�f�t�H���g�l���g�p�j
        PatchProperties = DefaultPatchProperties ;
    end
else % ��1������ axis ���w�肳��Ă���
    AX = varargin{1} ; value = varargin{2} ; direction = varargin{3} ;
    if nargin >= 4
        p = 4 ;  P = 1 ;
        PatchProperties = varargin{4:end} ; 
    elseif nargin == 3
        PatchProperties = DefaultPatchProperties ;
    end
end

%--------------------------------------------------------------------------
%�v���p�e�B�l�̎擾
nextPlot = get(AX,'nextplot') ;
set(AX,'nextplot','add') ;                                 %�d�˂���
xLim = get(AX,'XLim') ;
yLim = get(AX,'YLim') ;

% value
v1 = value(1) ;
v2 = value(2) ;

switch direction
    case 'v'
        xData = [v1, v2, v2, v1, v1] ;
        yData = [yLim(1), yLim(1), yLim(2), yLim(2), yLim(1)] ;
    case 'h'
        xData = [xLim(1), xLim(2), xLim(2), xLim(1), xLim(1)] ;
        yData = [v1, v1, v2, v2, v1] ;
end

if length(value) == 2 % value �͓�v�f�����x�N�g���łȂ���΂Ȃ�Ȃ�
    patchObj = patch(xData, yData, PatchProperties{:}) ;
    set(AX,'XLim',xLim,'YLim',yLim) ;              %���A�����̃v���b�g�͈͂����ɖ߂�
else
    disp('value �͓�v�f�����x�N�g���łȂ���΂Ȃ�܂���') ;
    set(AX,'nextplot',nextPlot) ;
    return
end
    
set(AX,'nextplot',nextPlot) ;                               %nextplot�v���p�e�B�����ɖ߂�



