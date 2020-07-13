%============================================
% ��ͨ��ͼ����ֲ�ͼЧ��
% ����ͨ����ȫ��ͼ��ʾ
%===============================================
clc
clearvars
close all

tic

[FileName, FilePath]=uigetfile('*.jpg;*.png;*.tif;*.img;*.bmp;','��ѡ��һ���ο�ͼƬ');
image_name = [FilePath FileName];

Iorg = imread(image_name);
[rI, cI] = size(Iorg);

Ir = zeros(rI, cI, 3);

%-- ����Ի���ѡ�������ɫ��--%
% 1-��ɫ; 2-��ɫ; 3-��ɫ
prompt = {'�����������ɫ��1��ɫ; 2��ɫ; 3��ɫ��'};
title = '��ͨ��ͼ����ֲ�ͼЧ��';
lines = [1]';
def = {'1'};
Channel_input = inputdlg(prompt, title, lines, def);
Nc = str2double(Channel_input);
%-----------------------------%

Ir(:,:,Nc) = Iorg;

%-- ����ͼ��--%
rf = [FilePath, 'RGB-', FileName];
imwrite(uint8(Ir), rf);
%--------------%












toc
