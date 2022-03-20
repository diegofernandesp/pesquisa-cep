object fPrincipal: TfPrincipal
  Left = 0
  Top = 0
  Caption = 'Pesquisa CEP'
  ClientHeight = 237
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 95
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 37
    Width = 441
    Height = 196
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edCep: TRzMaskEdit
    Left = 8
    Top = 8
    Width = 79
    Height = 21
    EditMask = '00000-000;0;_'
    MaxLength = 9
    TabOrder = 2
    Text = ''
  end
end
