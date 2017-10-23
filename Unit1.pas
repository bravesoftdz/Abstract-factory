unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unit2, Vcl.StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R Unit1.dfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  fAbstractFactory: AbstractFactory;
  fAbstractButton: AbstractButton;
  fAbstractWindow: AbstractWindow;
begin
  if CheckBox1.Checked = true then
  begin
    fAbstractFactory:=WinFactory.Create;
    fAbstractButton:=WinButton.Create;
    fAbstractWindow:=WinWindow.Create;
  end
  else
  begin
    fAbstractFactory:=MacFactory.Create;
    fAbstractButton:=WinButton.Create;
    fAbstractWindow:=MacWindow.Create;
  end;
  Label1.Caption:=fAbstractFactory.printButton(fAbstractButton);
  Label2.Caption:=fAbstractFactory.printWindow(fAbstractWindow);
  fAbstractFactory.Free;
  fAbstractButton.Free;
  fAbstractWindow.Free;
end;

end.
