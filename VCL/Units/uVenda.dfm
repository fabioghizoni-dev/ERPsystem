object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  ClientHeight = 621
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 904
    Height = 621
    Align = alClient
    BevelOuter = bvNone
    Color = 16580327
    ParentBackground = False
    TabOrder = 0
    object pnlMargins: TPanel
      AlignWithMargins = True
      Left = 38
      Top = 38
      Width = 828
      Height = 545
      Margins.Left = 38
      Margins.Top = 38
      Margins.Right = 38
      Margins.Bottom = 38
      Align = alClient
      BevelOuter = bvNone
      Color = 16580327
      Padding.Top = 38
      ParentBackground = False
      TabOrder = 0
      object pnlTop: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 38
        Width = 828
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 0
        object lblCodProd: TLabel
          AlignWithMargins = True
          Left = 233
          Top = 0
          Width = 72
          Height = 25
          Margins.Left = 128
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Alignment = taCenter
          Caption = 'ID Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
        object lblIDProduct: TLabel
          AlignWithMargins = True
          Left = 643
          Top = 0
          Width = 115
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 70
          Margins.Bottom = 0
          Align = alRight
          Alignment = taCenter
          Caption = 'Pre'#231'o do Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
        object lblNameProd: TLabel
          AlignWithMargins = True
          Left = 369
          Top = 0
          Width = 194
          Height = 25
          Margins.Left = 64
          Margins.Top = 0
          Margins.Right = 80
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Nome do Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 116
          ExplicitHeight = 19
        end
        object lblName: TLabel
          Left = 0
          Top = 0
          Width = 105
          Height = 25
          Align = alLeft
          Caption = 'Nome Vendedor:'
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
      object pnlBtns: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 504
        Width = 828
        Height = 41
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alBottom
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 1
        object btnSale: TButton
          Left = 728
          Top = 0
          Width = 100
          Height = 41
          Align = alRight
          Caption = 'Concluir Venda'
          TabOrder = 0
          OnClick = btnSaleClick
        end
        object btnExlude: TButton
          AlignWithMargins = True
          Left = 623
          Top = 0
          Width = 100
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 5
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Excluir'
          TabOrder = 1
          OnClick = btnExludeClick
        end
      end
      object pnlEdts: TPanel
        AlignWithMargins = True
        Left = 0
        Top = 63
        Width = 828
        Height = 41
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 50
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 2
        object pnlQuite: TPanel
          AlignWithMargins = True
          Left = 369
          Top = 0
          Width = 244
          Height = 41
          Margins.Left = 30
          Margins.Top = 0
          Margins.Right = 30
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtNameProd: TEdit
            Left = 0
            Top = 0
            Width = 234
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlLeft: TPanel
          AlignWithMargins = True
          Left = 233
          Top = 0
          Width = 106
          Height = 41
          Margins.Left = 40
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 1
          object edtCodProd: TEdit
            Left = 0
            Top = 0
            Width = 96
            Height = 26
            Align = alClient
            MaxLength = 10
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlRight: TPanel
          Left = 643
          Top = 0
          Width = 185
          Height = 41
          Align = alRight
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 2
          object edtPrice: TEdit
            Left = 0
            Top = 0
            Width = 185
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlName: TPanel
          Left = 0
          Top = 0
          Width = 193
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 3
          object edtName: TEdit
            Left = 0
            Top = 0
            Width = 183
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object pnlLbls: TPanel
        Left = 0
        Top = 154
        Width = 828
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 3
        object lblAmount: TLabel
          AlignWithMargins = True
          Left = 311
          Top = 0
          Width = 96
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 180
          Margins.Bottom = 0
          Align = alClient
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 76
          ExplicitHeight = 19
        end
        object lblDate: TLabel
          AlignWithMargins = True
          Left = 587
          Top = 0
          Width = 32
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 209
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 6845186
          Font.Height = -16
          Font.Name = 'Roboto Cn'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 19
        end
        object lblDiscount: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 63
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 248
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Desconto:'
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
        Top = 179
        Width = 828
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        Color = 16580327
        ParentBackground = False
        TabOrder = 4
        object pnlDate: TPanel
          AlignWithMargins = True
          Left = 587
          Top = 0
          Width = 241
          Height = 41
          Margins.Left = 90
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelOuter = bvNone
          Color = 16580327
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 0
          object edtDate: TEdit
            Left = 0
            Top = 0
            Width = 241
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlAmount: TPanel
          AlignWithMargins = True
          Left = 311
          Top = 0
          Width = 186
          Height = 41
          Margins.Left = 150
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 1
          object edtAmount: TEdit
            Left = 0
            Top = 0
            Width = 176
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
        object pnlDiscount: TPanel
          Left = 0
          Top = 0
          Width = 161
          Height = 41
          Align = alLeft
          BevelOuter = bvNone
          Color = 16580327
          Padding.Right = 10
          Padding.Bottom = 15
          ParentBackground = False
          TabOrder = 2
          object edtDiscount: TEdit
            Left = 0
            Top = 0
            Width = 151
            Height = 26
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 23
          end
        end
      end
      object grid: TDBGrid
        Left = 0
        Top = 289
        Width = 828
        Height = 195
        Align = alBottom
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id_prod_vendido'
            Title.Alignment = taCenter
            Title.Caption = 'ID Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = []
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_prod_vendido'
            Title.Alignment = taCenter
            Title.Caption = 'Nome do Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco_prod'
            Title.Alignment = taCenter
            Title.Caption = 'Pre'#231'o Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_vendedor'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Vendedor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = [fsBold]
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_venda'
            Title.Alignment = taCenter
            Title.Caption = 'Data Venda'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qntd_vendida'
            Title.Alignment = taCenter
            Title.Caption = 'Quantidade Vendida'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -15
            Title.Font.Name = 'Roboto Cn'
            Title.Font.Style = [fsBold]
            Width = 140
            Visible = True
          end>
      end
      object check: TCheckBox
        Left = 588
        Top = 226
        Width = 97
        Height = 17
        Caption = 'Data Atual'
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = checkClick
      end
    end
  end
  object ds: TDataSource
    DataSet = vendas
    Left = 566
    Top = 142
  end
  object vendas: TFDTable
    Active = True
    IndexFieldNames = 'id_prod_vendido'
    Connection = DM.ConnDbERP
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'vendas'
    Left = 526
    Top = 142
    object vendasnome_vendedor: TWideStringField
      FieldName = 'nome_vendedor'
      Origin = 'nome_vendedor'
      Size = 8190
    end
    object vendasnome_prod_vendido: TWideStringField
      FieldName = 'nome_prod_vendido'
      Origin = 'nome_prod_vendido'
      Size = 8190
    end
    object vendasid_prod_vendido: TIntegerField
      FieldName = 'id_prod_vendido'
      Origin = 'id_prod_vendido'
    end
    object vendasdata_venda: TDateField
      FieldName = 'data_venda'
      Origin = 'data_venda'
    end
    object vendaspreco_prod: TCurrencyField
      FieldName = 'preco_prod'
      Origin = 'preco_prod'
    end
    object vendasqntd_vendida: TIntegerField
      FieldName = 'qntd_vendida'
      Origin = 'qntd_vendida'
    end
  end
end
