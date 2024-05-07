function h = lineplot(varargin)

% lineplot  �����̃v���b�g
%
% lineplot(X,'v',...) �̓J�����g��axes�� x=X �ɁA��[���牺�[�܂Œ������v���b�g���܂�
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
%Axes�̎擾
P = 0 ;
if isempty(axescheck(varargin{1})) 
    AX = gca ; value = varargin{1} ; direction = varargin{2} ;
    if nargin >= 3
        p = 3 ;  P = 1 ;
    end
else
    AX = varargin{1} ; value = varargin{2} ; direction = varargin{3} ;
    if nargin >= 4
        p = 4 ;  P = 1 ;
    end
end

%--------------------------------------------------------------------------
%�v���p�e�B�l�̎擾
NextPlot = get(AX,'nextplot') ;
set(AX,'nextplot','add') ;                                 %�d�˂���
XLim = get(AX,'XLim') ;
YLim = get(AX,'YLim') ;

switch direction
    case 'v'                                                %�c�̒����̃v���b�g
        if min(size(value)) == 1 ;                          %�������i���j�̓x�N�g���܂��̓X�J���łȂ���΂Ȃ�Ȃ�
            X = value ;
            for k = 1:length(X) ;
                if P==0
                    h(k) = plot(AX,[X(k),X(k)],YLim) ;               %���{�̒������v���b�g
                elseif P==1 
                    h(k) = plot(AX,[X(k),X(k)],YLim,varargin{p:end}) ;
                end
            end
            set(AX,'XLim',XLim,'YLim',YLim) ;              %���A�����̃v���b�g�͈͂����ɖ߂�
        else
            disp('direction��v�̂Ƃ�value�̓X�J���܂��̓x�N�g���łȂ���΂Ȃ�܂���') ;
            set(AX,'nextplot',NextPlot) ;
            return
        end
    case 'h'                                                %���̒����̃v���b�g
        if min(size(value)) == 1 ;
            Y = value ;
            for k = 1:length(Y) ;
                if P==0
                    h(k) = plot(AX,XLim,[Y(k),Y(k)]) ;
                elseif P==1
                    h(k) = plot(AX,XLim,[Y(k),Y(k)],varargin{p:end}) ;
                end
            end
            set(AX,'XLim',XLim,'YLim',YLim) ;
        else
            disp('direction��h�̂Ƃ�value�̓X�J���܂��̓x�N�g���łȂ���΂Ȃ�܂���') ;
            set(AX,'nextplot',NextPlot) ;
            return
        end
    otherwise
        disp('direction��''v'',''h'' �̂����ꂩ�łȂ���΂Ȃ�܂���') ;
        set(AX,'nextplot',NextPlot) ;
        return
end
    
set(AX,'nextplot',NextPlot) ;                               %nextplot�v���p�e�B�����ɖ߂�



