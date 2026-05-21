function patchObj = arealine(varargin)

% arealine  幅をもった直線エリアのプロット（patchを使用）
%
% arealine(X,'v',...) はカレントの axesの x=X に、上端から下端まで直線エリアを作成します
% X = [x1, x2] は2要素のベクトルで、x1<x<x2 の領域を patch で、塗りつぶします
%
% すなわち、plot([X,X],gca(get,'YLim'),...) と等価です
% ...部分には plot に用いるプロパティを入力します
% Xが長さnのベクトルの場合n本の直線をプロットします
%
% lineplot(Y,'h',...) はカレントのaxesの y=Y に、左端から右端まで直線をプロットします
%
% lineplot(AX,...) はカレントの代わりにAXにlineplotを行います
%
% h = lineplot は h にハンドルを出力します
% n本の直線をプロットした場合、hはｎ要素からなるベクトルとなります
%
% last update: 2015-06-07 (Shinya)

%--------------------------------------------------------------------------

DefaultPatchProperties = {[0.5, 0.5, 0.5], 'FaceAlpha', 0.3, 'LineStyle', 'none'} ;

if isempty(axescheck(varargin{1})) % 第1引数で axis が指定されていない　（gca に作成）
    AX = gca ; value = varargin{1} ; direction = varargin{2} ;
    if nargin >= 3 % plot property が指定されている
        p = 3 ;  
        P = 1 ; 
        PatchProperties = varargin{3:end} ; 
    elseif nargin == 2 % plot property が指定されていない　（デフォルト値を使用）
        PatchProperties = DefaultPatchProperties ;
    end
else % 第1引数で axis が指定されている
    AX = varargin{1} ; value = varargin{2} ; direction = varargin{3} ;
    if nargin >= 4
        p = 4 ;  P = 1 ;
        PatchProperties = varargin{4:end} ; 
    elseif nargin == 3
        PatchProperties = DefaultPatchProperties ;
    end
end

%--------------------------------------------------------------------------
%プロパティ値の取得
nextPlot = get(AX,'nextplot') ;
set(AX,'nextplot','add') ;                                 %重ねがき
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

if length(value) == 2 % value は二要素をもつベクトルでなければならない
    patchObj = patch(xData, yData, PatchProperties{:}) ;
    set(AX,'XLim',xLim,'YLim',yLim) ;              %ｘ、ｙ軸のプロット範囲を元に戻す
else
    disp('value は二要素を持つベクトルでなければなりません') ;
    set(AX,'nextplot',nextPlot) ;
    return
end
    
set(AX,'nextplot',nextPlot) ;                               %nextplotプロパティを元に戻す



