unit progressbar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFermerture = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fermerture: TFermerture;

implementation

{$R *.dfm}

procedure TFermerture.FormActivate(Sender: TObject);
begin
Timer1.Enabled := true ;
end;

procedure TFermerture.Timer1Timer(Sender: TObject);
begin
ProgressBar1.Position := ProgressBar1.Position + 1 ;
end;

end.
