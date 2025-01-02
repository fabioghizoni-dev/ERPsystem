object frameStock: TframeStock
  Left = 0
  Top = 0
  Width = 633
  Height = 829
  Color = 16580327
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object pnlAddClient: TPanel
    Left = 0
    Top = 0
    Width = 633
    Height = 829
    Align = alClient
    BevelOuter = bvNone
    Color = 16580327
    ParentBackground = False
    TabOrder = 0
    object pnlMargins: TPanel
      AlignWithMargins = True
      Left = 38
      Top = 109
      Width = 557
      Height = 682
      Margins.Left = 38
      Margins.Top = 0
      Margins.Right = 38
      Margins.Bottom = 38
      Align = alClient
      BevelOuter = bvNone
      Color = 16580327
      ParentBackground = False
      TabOrder = 0
      object pnlLbls: TPanel
        Left = 0
        Top = 0
        Width = 557
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 0
        object lblFull: TLabel
          AlignWithMargins = True
          Left = 324
          Top = 0
          Width = 114
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 119
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Total em Estoque:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
        object lblNameClient: TLabel
          Left = 0
          Top = 0
          Width = 109
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Nome do Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
      end
      object pnlEdts: TPanel
        Left = 0
        Top = 25
        Width = 557
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 1
        object pnlEdtStock: TPanel
          Left = 324
          Top = 0
          Width = 233
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtStock: TEdit
            Left = 0
            Top = 0
            Width = 223
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlClient: TPanel
          Left = 0
          Top = 0
          Width = 233
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 1
          object edtNameClient: TEdit
            Left = 0
            Top = 0
            Width = 223
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object pnlLbls2: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 116
        Width = 557
        Height = 25
        Margins.Left = 0
        Margins.Top = 50
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 2
        object lblProduct: TLabel
          Left = 0
          Top = 0
          Width = 124
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Produto Espec'#237'fico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
      end
      object pnlEdts2: TPanel
        Left = 0
        Top = 141
        Width = 557
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 3
        object pnlEdtName: TPanel
          Left = 0
          Top = 0
          Width = 233
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtNameProduct: TEdit
            Left = 0
            Top = 0
            Width = 223
            Height = 23
            Align = alTop
            TabOrder = 0
          end
        end
      end
      object btnVenda: TButton
        AlignWithMargins = True
        Left = 10
        Top = 616
        Width = 537
        Height = 56
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alBottom
        Caption = 'Fazer Venda'
        TabOrder = 4
        OnClick = btnVendaClick
        ExplicitLeft = 300
        ExplicitWidth = 247
      end
    end
    object pnlTitle: TPanel
      AlignWithMargins = True
      Left = 80
      Top = 38
      Width = 473
      Height = 41
      Margins.Left = 80
      Margins.Top = 38
      Margins.Right = 80
      Margins.Bottom = 30
      Align = alTop
      BevelOuter = bvNone
      Color = 16580327
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Roboto'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      object lblTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 467
        Height = 35
        Align = alClient
        Alignment = taCenter
        Caption = 'ESTOQUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6845186
        Font.Height = -24
        Font.Name = 'Roboto Cn'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitWidth = 92
        ExplicitHeight = 29
      end
    end
  end
end
