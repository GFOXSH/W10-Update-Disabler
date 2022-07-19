// Copyright 2022 GFOXSH
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Reg1: TRegistry;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Reg1:=TRegistry.Create();
  try
    Reg1.RootKey:=HKEY_LOCAL_MACHINE;
    Reg1.OpenKey('SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', true);
    Reg1.WriteInteger('DoNotConnectToWindowsUpdateInternetLocations', $00000001);
    Reg1.WriteString('UpdateServiceUrlAlternate', '127.0.0.1');
    Reg1.WriteString('WUServer', '127.0.0.1');
    Reg1.WriteString('WUStatusServer', '127.0.0.1');
    Reg1.CloseKey();
    Reg1.OpenKey('SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU', true);
    Reg1.WriteInteger('UseWUServer', $00000001);
    Reg1.CloseKey();
  finally
    Reg1.Free();
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Reg1:=TRegistry.Create();
  try
    Reg1.RootKey:=HKEY_LOCAL_MACHINE;
    Reg1.OpenKey('SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate', false);
    Reg1.DeleteValue('DoNotConnectToWindowsUpdateInternetLocations');
    Reg1.DeleteValue('UpdateServiceUrlAlternate');
    Reg1.DeleteValue('WUServer');
    Reg1.DeleteValue('WUStatusServer');
    Reg1.CloseKey();
    Reg1.OpenKey('SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU', false);
    Reg1.DeleteValue('UseWUServer');
    Reg1.CloseKey();
  finally
    Reg1.Free();
  end;
end;

end.
