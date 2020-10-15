unit Etudiant;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,DM, Vcl.ComCtrls;

type
  TForm_etud = class(TForm)
    Panel_etud: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    nom: TEdit;
    prenom: TEdit;
    telephone: TEdit;
    adresse: TEdit;
    Button1: TButton;
    filiere: TDBLookupComboBox;
    Button8: TButton;
    Button10: TButton;
    Button2: TButton;
    Etud_recherche: TEdit;
    Panel1: TPanel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button3: TButton;
    Label1: TLabel;
    Datenaisse: TDateTimePicker;
    DBGrid1: TDBGrid;
    Image1: TImage;
    sexe: TComboBox;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Etud_rechercheChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure telephoneKeyPress(Sender: TObject; var Key: Char);
    procedure nomKeyPress(Sender: TObject; var Key: Char);
    procedure prenomKeyPress(Sender: TObject; var Key: Char);
    procedure adresseKeyPress(Sender: TObject; var Key: Char);
    procedure Etud_rechercheKeyPress(Sender: TObject; var Key: Char);
    procedure sexeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_etud: TForm_etud;

implementation

{$R *.dfm}

procedure TForm_etud.adresseKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key  in ['a'..'z','A'..'Z',#8] ) then
    begin
         key :=#0;
    end
end;

procedure TForm_etud.Button10Click(Sender: TObject);
begin
    with DataM.Etud_supp do
    begin
      ParamByName('E').AsString := DBGrid1.Fields[0].Value;
      ExecSQL;
    end;
    DataM.DM_etud2.Refresh;
    showMessage('Supprimer avec succes !!');
      nom.clear;
     prenom.Clear;
     telephone.Clear;
     adresse.Clear;
          sexe.Text:='';

end;

procedure TForm_etud.Button1Click(Sender: TObject);
begin
if ( nom.Text<>'')  and (prenom.Text<>'') and  (telephone.Text<>'') and(sexe.Text<>'' )  and (filiere.Text<>'')  then

begin
    with dataM.DM_verification do
    begin
              active:= false;
              sql.Clear;
              sql.Add(' SELECT nom, prenom ');
              sql.Add('FROM etudiants ')  ;
              sql.Add('WHERE  nom=:nom AND prenom=:prenom')  ;
              ParamByName('nom').AsString:=nom.Text;
              ParamByName('prenom').AsString:= prenom.Text;
              open;
              active:= true;
    end;
  if(dataM.DM_verification.RecordCount=1) then
    begin
           ShowMessage('l''etudiant existe deja ');
    end
   else
   begin
          with DataM.DM_etud do
            begin
              open;
                insert;
                  FieldByName('Nom').AsString := nom.Text;
                   FieldByName('prenom').AsString := prenom.Text;
                    FieldByName('telephone').Asstring := telephone.Text;
                    FieldByName('sexe').Asstring := sexe.Text;
                    FieldByName('Adresse').Asstring := adresse.Text;
                    FieldByName('Code_F').Asstring :=  filiere.KeyValue;
                    FieldByname('datnaisse').AsDateTime := Datenaisse.Date;
                post ;
             end;
             DataM.DM_etud2.Refresh;
             dataM.DM_etud_query.Refresh;
             nom.clear;
             prenom.Clear;
             telephone.Clear;
             adresse.Clear;
             sexe.Text:='';
   end;

end
else
showmessage('Tous les champs doivent etre rmeplit !!!')

end;

procedure TForm_etud.Button2Click(Sender: TObject);
begin
      nom.clear;
     prenom.Clear;
     telephone.Clear;
     adresse.Clear;
       sexe.Text:='';
end;

procedure TForm_etud.Button3Click(Sender: TObject);
begin

dataM.DM_etud2.Next;
end;

procedure TForm_etud.Button5Click(Sender: TObject);
begin
dataM.dM_etud2.first;
end;

procedure TForm_etud.Button6Click(Sender: TObject);
begin
     dataM.DM_etud2.Prior;
end;

procedure TForm_etud.Button7Click(Sender: TObject);
begin
  dataM.DM_etud2.Last;
end;

procedure TForm_etud.Button8Click(Sender: TObject);
begin
      if ( nom.Text<>'')  and (prenom.Text<>'') and  (telephone.Text<>'') and(sexe.Text<>'') and (filiere.Text<>'')  then
      begin
        with DataM.etud_update do
          begin
            ParamByName('N').AsString := nom.Text;
            ParamByName('P').AsString := prenom.Text;
            ParamByName('S').AsString := Sexe.Text;
            ParamByName('A').AsString := adresse.text;
            ParamByName('T').AsString := telephone.Text;
            ParamByName('C').AsString := filiere.KeyValue;
             ParamByName('D').AsDate := Datenaisse.Date;
            ParamByName('E').AsInteger := DBGrid1.Fields[0].Value;
            ExecSQL
          end;
          DataM.DM_etud2.Refresh;
          dataM.DM_etud_query.Refresh;
          ShowMessage('Modifier avec success!');
          nom.clear;
           prenom.Clear;
           telephone.Clear;
           adresse.Clear;
             sexe.Text:='';

      end
      else
      showmessage('impossiblz d zffzctuer la modifaction !!');

end;

procedure TForm_etud.DBGrid1CellClick(Column: TColumn);
begin
       nom.Text := DBGrid1.Fields[1].Value  ;
        prenom.Text :=  DBGrid1.Fields[2].value;
        sexe.Text := DBGrid1.Fields[3].value ;
        adresse.Text := DBGrid1.Fields[6].value ;
        telephone.Text := DBGrid1.Fields[4].Value;
         filiere.KeyValue := DBGrid1.Fields[5].value;
         Datenaisse.date :=  DBGrid1.Fields[7].Value;
end;

procedure TForm_etud.Etud_rechercheChange(Sender: TObject);
begin

 with dataM.dM_etud2 do
    begin
       active:= false;
       sql.Clear;
      sql.add('SELECT * FROM etudiants ')  ;
      sql.Add('WHERE nom=:nom or prenom =:prenom ');
      paramByname('nom').AsString := Etud_recherche.Text;
      parambyname('prenom').AsString := Etud_recherche.Text;
      active:= true;
      open;
    end;
    if(Etud_recherche.Text ='' ) then
    begin
    with dataM.dM_etud2 do
    begin
       active:= false;
       sql.Clear;
        sql.add('SELECT * FROM etudiants ')  ;
        active:= true;
        refresh;
    end;
    end;
end;

procedure TForm_etud.Etud_rechercheKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key  in ['a'..'z','A'..'Z',#8] ) then
    begin
         key :=#0;
    end

end;

procedure TForm_etud.FormActivate(Sender: TObject);
begin
     nom.clear;
     prenom.Clear;
     telephone.Clear;
     adresse.Clear;
            sexe.Text:='';
end;

procedure TForm_etud.nomKeyPress(Sender: TObject; var Key: Char);
begin
if not (key  in ['a'..'z','A'..'Z'] ) then
 key :=#0;
end;

procedure TForm_etud.prenomKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key  in ['a'..'z','A'..'Z',#8] ) then
    begin
         key :=#0;
    end
end;

procedure TForm_etud.sexeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key  in ['m','f','M','F',#8] ) then
    begin
         key :=#0;
    end

end;

procedure TForm_etud.telephoneKeyPress(Sender: TObject; var Key: Char);
begin
if not (key  in ['0'..'9',#8] ) then
 key :=#0;
end;

end.
