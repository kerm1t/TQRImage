{------------------------------------------------------------------------------}
{                                                                              }
{ QR Image                                                                     }
{ This uses QR code from ...                                                   }
{                                                                              }
{------------------------------------------------------------------------------}
{                                                                              }
{ Unit owner:    W.Schulz, Friedrichshafen                                     }
{ Created:       Jan 22, 2021                                                  }
{ Last modified: Jan 23, 2021                                                  }
{                                                                              }
{------------------------------------------------------------------------------}
unit QRImage;

interface

uses stdctrls, extctrls, classes,
  qr, // didn't work --> in './include/qr.pas',
  bitstr,
  ec
  ;

{
done:
- not much yet
- create initial component

2do:
- 
}
//const


type
{
 add description here
}

  TQRImg = class(TImage)
  private
    F_text: String;
    pQR: QRCodePtr;
    data: ByteBufferPtr;
    dataLen: Integer;
    qrError: Integer;
    preferredVersion, preferredLevel, preferredMaskPattern: Integer;

    procedure set_text(msg: String);
  protected
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
  published
	  property Text: String read F_text write set_text;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('EkwoTECH', [TQRImg]);
end;

constructor TQRImg.Create(Owner: TComponent); // Owner = TForm
begin
  Inherited;

  if (csDesigning in ComponentState) then begin
  end else begin
  end;
 
end;

destructor TQRImg.Destroy;
begin
  {free allocs here}
  
  inherited Destroy;
end;

procedure TQRImg.set_text(msg: String);
var j: Integer;
begin
  preferredVersion := QRVersionAny;
  preferredLevel := ECLevelAny;
  preferredMaskPattern := MaskPatternAny;

  dataLen := Length(msg);
  GetMem(data, dataLen);
  for j := 1 to Length(msg) do
    data^[j - 1] := ord(msg[j]);

  pQR := New(QRCodePtr, Init);
  pQR^.SetPreferredLevel(preferredLevel);
  PQR^.SetPreferredVersion(preferredVersion);
  pQR^.SetPreferredMaskPattern(preferredMaskPattern);
  qrError := pQR^.Make(data, dataLen);

  self.Picture := nil;
  self.Picture.bitmap.Width := pQR^.QRSize;
  self.Picture.bitmap.height := pQR^.QRSize;

  pQR^.ToImg(self.Canvas);
  Dispose(pQr);
end;

end.
