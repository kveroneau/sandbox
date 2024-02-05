unit storedb;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, dbf, DB, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, DBCtrls, DBGrids;

type

  { TStoreDBForm }

  TStoreDBForm = class(TForm)
    InvoiceBtn: TButton;
    CustDB: TDbf;
    CustDS: TDataSource;
    DBGrid: TDBGrid;
    SalesNavigator: TDBNavigator;
    DBTotal: TDBEdit;
    SearchByCode: TEdit;
    Label7: TLabel;
    SearchByPhone: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    SalesDS: TDataSource;
    SalesDB: TDbf;
    DBSaleCustomer: TDBLookupComboBox;
    Label4: TLabel;
    ProductGrid: TDBGrid;
    ProductsDS: TDataSource;
    DBAddress: TDBEdit;
    ProductsDB: TDbf;
    DBMemo: TDBMemo;
    CustNavigator: TDBNavigator;
    DBPhone: TDBEdit;
    DBName: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StoreTabs: TPageControl;
    CustomersTab: TTabSheet;
    ProductsTab: TTabSheet;
    SalesTab: TTabSheet;
    SearchTab: TTabSheet;
    DBGridTab: TTabSheet;
    procedure FormResize(Sender: TObject);
    procedure InvoiceBtnClick(Sender: TObject);
    procedure ProductGridDblClick(Sender: TObject);
    procedure ProductsTabResize(Sender: TObject);
    procedure SearchByCodeKeyPress(Sender: TObject; var Key: char);
    procedure SearchByPhoneKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  StoreDBForm: TStoreDBForm;

implementation

{$R *.lfm}

{ TStoreDBForm }

procedure TStoreDBForm.FormResize(Sender: TObject);
begin
  StoreTabs.Width:=ClientWidth;
  StoreTabs.Height:=ClientHeight;
end;

procedure TStoreDBForm.InvoiceBtnClick(Sender: TObject);
begin
  SalesDB.IndexName:='idxcustid';
  SalesDB.MasterSource:=CustDS;
  SalesDB.MasterFields:='ID';
  StoreTabs.TabIndex:=4;
end;

procedure TStoreDBForm.ProductGridDblClick(Sender: TObject);
begin

end;

procedure TStoreDBForm.ProductsTabResize(Sender: TObject);
begin
  ProductGrid.Width:=ClientWidth;
  ProductGrid.Height:=ClientHeight;
end;

procedure TStoreDBForm.SearchByCodeKeyPress(Sender: TObject; var Key: char);
begin
  if Key <> #13 then
    Exit;
  with ProductsDB do
  begin
    Filter:='CODE='+QuotedStr(SearchByCode.Text+'*');
    Filtered:=True;
    if EOF then
      Filtered:=False
    else
      StoreTabs.TabIndex:=1;
  end;
end;

procedure TStoreDBForm.SearchByPhoneKeyPress(Sender: TObject; var Key: char);
begin
  if Key <> #13 then
    Exit;
  with CustDB do
  begin
    Filter:='PHONE='+QuotedStr(SearchByPhone.Text);
    Filtered:=True;
    First;
    if EOF then
    begin
      Filtered:=False;
      Exit;
    end;
    StoreTabs.TabIndex:=0;
    SalesDB.Append;
    DBSaleCustomer.Text:=CustDB.FieldByName('NAME').AsString;
  end;
end;

end.

