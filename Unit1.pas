unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, QRImage;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnQR: TButton;
    QRImg1: TQRImg;
    procedure btnQRClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnQRClick(Sender: TObject);
begin
  QRImg1.Text := memo1.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption := 'Quick Response Code for Delphi 3 and up';
  position := poScreenCenter;
  Memo1.Text := 'Peek a boo';
end;

end.
