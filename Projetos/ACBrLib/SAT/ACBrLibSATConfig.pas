{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }
{ Colaboradores nesse arquivo: Rafael Teno Dias                                }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }
{******************************************************************************}


{$I ACBr.inc}

unit ACBrLibSATConfig;

interface

uses
  Classes, SysUtils, IniFiles,
  ACBrLibConfig, ACBrSAT, ACBrSATClass,
  ACBrIntegradorConfig, ACBrDFeSSL,
  pcnRede, pcnConversao;

type
  TTipoExtrato = (teFortes, teEscPos);

  { TExtratoConfig }
  TExtratoConfig = class
  private
    FTipoExtrato: TTipoExtrato;

  public
    constructor Create;

    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property TipoExtrato: TTipoExtrato read FTipoExtrato write FTipoExtrato;

  end;

  { TSATConfig }
  TSATConfig = class
  private
    Femit_CNPJ: string;
    Femit_cRegTrib: TpcnRegTrib;
    Femit_cRegTribISSQN: TpcnRegTribISSQN;
    Femit_IE: string;
    Femit_IM: string;
    Femit_indRatISSQN: TpcnindRatISSQN;
    Fide_CNPJ: string;
    Fide_numeroCaixa: integer;
    FinfCFe_versaoDadosEnt: real;
    Fide_tpAmb: TpcnTipoAmbiente;
    FPaginaDeCodigo: word;
    FArqSchema: string;
    FXmlSignLib: TSSLXmlSignLib;

    function GetEhUTF8: boolean;
    procedure SetEhUTF8(AValue: boolean);

  public
    constructor Create;

    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property infCFe_versaoDadosEnt: real read FinfCFe_versaoDadosEnt
      write FinfCFe_versaoDadosEnt;
    property ide_CNPJ: string read Fide_CNPJ write Fide_CNPJ;
    property ide_numeroCaixa: integer read Fide_numeroCaixa write Fide_numeroCaixa;
    property ide_tpAmb: TpcnTipoAmbiente read Fide_tpAmb write Fide_tpAmb;
    property emit_CNPJ: string read Femit_CNPJ write Femit_CNPJ;
    property emit_IE: string read Femit_IE write Femit_IE;
    property emit_IM: string read Femit_IM write Femit_IM;
    property emit_cRegTrib: TpcnRegTrib read Femit_cRegTrib write Femit_cRegTrib;
    property emit_cRegTribISSQN: TpcnRegTribISSQN
      read Femit_cRegTribISSQN write Femit_cRegTribISSQN;
    property emit_indRatISSQN: TpcnindRatISSQN
      read Femit_indRatISSQN write Femit_indRatISSQN;
    property EhUTF8: boolean read GetEhUTF8 write SetEhUTF8;
    property PaginaDeCodigo: word read FPaginaDeCodigo write FPaginaDeCodigo;
    property ArqSchema: string read FArqSchema write FArqSchema;
    property XmlSignLib: TSSLXmlSignLib read FXmlSignLib write FXmlSignLib;
  end;

  { TSATConfigArquivo }
  TSATConfigArquivo = class
  private
    FPrefixoArqCFe: string;
    FPrefixoArqCFeCanc: string;
    FSalvarCFe: boolean;
    FPastaCFeCancelamento: string;
    FPastaCFeVenda: string;
    FSalvarCFeCanc: boolean;
    FPastaEnvio: string;
    FSalvarEnvio: boolean;
    FSepararPorCNPJ: boolean;
    FSepararPorAno: boolean;
    FSepararPorMes: boolean;
    FSepararPorDia: boolean;
    FSepararPorModelo: boolean;

  public
    constructor Create;

    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property SalvarCFe: boolean read FSalvarCFe write FSalvarCFe;
    property SalvarCFeCanc: boolean read FSalvarCFeCanc write FSalvarCFeCanc;
    property SalvarEnvio: boolean read FSalvarEnvio write FSalvarEnvio;
    property SepararPorCNPJ: boolean read FSepararPorCNPJ write FSepararPorCNPJ;
    property SepararPorModelo: boolean read FSepararPorModelo write FSepararPorModelo;
    property SepararPorAno: boolean read FSepararPorAno write FSepararPorAno;
    property SepararPorMes: boolean read FSepararPorMes write FSepararPorMes;
    property SepararPorDia: boolean read FSepararPorDia write FSepararPorDia;
    property PastaCFeVenda: string read FPastaCFeVenda write FPastaCFeVenda;
    property PastaCFeCancelamento: string read FPastaCFeCancelamento
      write FPastaCFeCancelamento;
    property PastaEnvio: string read FPastaEnvio write FPastaEnvio;
    property PrefixoArqCFe: string read FPrefixoArqCFe write FPrefixoArqCFe;
    property PrefixoArqCFeCanc: string read FPrefixoArqCFeCanc write FPrefixoArqCFeCanc;

  end;

  { TLibSATConfig }
  TLibSATConfig = class(TLibConfig)
  private
    FModelo: TACBrSATModelo;
    FNomeDLL: string;
    FValidarNumeroSessaoResposta: boolean;
    FNumeroTentativasValidarSessao: integer;
    FArqLOG: string;
    FMFe: boolean;
    FConfig: TSATConfig;
    FConfigArquivos: TSATConfigArquivo;
    FRede: TRede;
    FExtrato: TExtratoConfig;
    FIntegrador: TIntegradorConfig;

  protected
    function AtualizarArquivoConfiguracao: boolean; override;

    procedure INIParaClasse; override;
    procedure ClasseParaINI; override;
    procedure ClasseParaComponentes; override;

    procedure Travar; override;
    procedure Destravar; override;

  public
    constructor Create(AOwner: TObject; ANomeArquivo: string = '';
      AChaveCrypt: ansistring = ''); override;
    destructor Destroy; override;

    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);

    property Modelo: TACBrSATModelo read FModelo write FModelo;
    property NomeDLL: string read FNomeDLL write FNomeDLL;
    property ValidarNumeroSessaoResposta: boolean
      read FValidarNumeroSessaoResposta write FValidarNumeroSessaoResposta;
    property NumeroTentativasValidarSessao: integer
      read FNumeroTentativasValidarSessao write FNumeroTentativasValidarSessao;
    property ArqLOG: string read FArqLOG write FArqLOG;
    property IsMFe: boolean read FMFe write FMFe;
    property Config: TSATConfig read FConfig;
    property ConfigArquivos: TSATConfigArquivo read FConfigArquivos;
    property Rede: TRede read FRede;
    property Extrato: TExtratoConfig read FExtrato;
    property Integrador: TIntegradorConfig read FIntegrador;

  end;

implementation

uses
  ACBrLibSATClass, ACBrLibSATConsts, ACBrLibConsts, ACBrLibComum,
  ACBrUtil, ACBrConsts;

{ TExtratoConfig }
constructor TExtratoConfig.Create;
begin
  FTipoExtrato := teFortes;
end;

procedure TExtratoConfig.LerIni(const AIni: TCustomIniFile);
begin
  FTipoExtrato := TTipoExtrato(AIni.ReadInteger(CSessaoExtrato, CChaveTipo,
    integer(FTipoExtrato)));
end;

procedure TExtratoConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteInteger(CSessaoExtrato, CChaveTipo, integer(FTipoExtrato));
end;

{ TSATConfig }
constructor TSATConfig.Create;
begin
  Femit_CNPJ := '';
  Femit_cRegTrib := RTSimplesNacional;
  Femit_cRegTribISSQN := RTISSMicroempresaMunicipal;
  Femit_IE := '';
  Femit_IM := '';
  Femit_indRatISSQN := irSim;
  Fide_CNPJ := '';
  Fide_numeroCaixa := 0;
  Fide_tpAmb := taHomologacao;
  FinfCFe_versaoDadosEnt := cversaoDadosEnt;
  FArqSchema := '';
  FXmlSignLib := xsNone;
end;

procedure TSATConfig.LerIni(const AIni: TCustomIniFile);
begin
  infCFe_versaoDadosEnt := AIni.ReadFloat(CSessaoSATConfig,
    CChaveVersaoDadosEnt, infCFe_versaoDadosEnt);
  ide_CNPJ := AIni.ReadString(CSessaoSATConfig, CChaveIdeCNPJ, ide_CNPJ);
  ide_numeroCaixa := AIni.ReadInteger(CSessaoSATConfig, CChaveIdeNumeroCaixa,
    ide_numeroCaixa);
  ide_tpAmb := TpcnTipoAmbiente(AIni.ReadInteger(CSessaoSATConfig,
    CChaveIdeTpAmb, integer(ide_tpAmb)));
  emit_CNPJ := AIni.ReadString(CSessaoSATConfig, CChaveEmitCNPJ, emit_CNPJ);
  emit_IE := AIni.ReadString(CSessaoSATConfig, CChaveEmitIE, emit_IE);
  emit_IM := AIni.ReadString(CSessaoSATConfig, CChaveEmitIM, emit_IM);
  emit_cRegTrib := TpcnRegTrib(AIni.ReadInteger(CSessaoSATConfig,
    CChaveEmitcRegTrib, integer(emit_cRegTrib)));
  emit_cRegTribISSQN := TpcnRegTribISSQN(AIni.ReadInteger(CSessaoSATConfig,
    CChaveEmitcRegTribISSQN, integer(emit_cRegTribISSQN)));
  emit_indRatISSQN := TpcnindRatISSQN(AIni.ReadInteger(CSessaoSATConfig,
    CChaveEmitIndRatISSQN, integer(emit_indRatISSQN)));
  EhUTF8 := AIni.ReadBool(CSessaoSATConfig, CChaveEhUTF8, EhUTF8);
  PaginaDeCodigo := AIni.ReadInteger(CSessaoSATConfig, CChavePaginaDeCodigo,
    PaginaDeCodigo);
  ArqSchema := AIni.ReadString(CSessaoSATConfig, CChaveArqSchema, ArqSchema);
  XmlSignLib := TSSLXmlSignLib(AIni.ReadInteger(CSessaoSATConfig,
    CChaveXmlSignLib, integer(XmlSignLib)));
end;

procedure TSATConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteFloat(CSessaoSATConfig, CChaveVersaoDadosEnt, infCFe_versaoDadosEnt);
  AIni.WriteString(CSessaoSATConfig, CChaveIdeCNPJ, ide_CNPJ);
  AIni.WriteInteger(CSessaoSATConfig, CChaveIdeNumeroCaixa, ide_numeroCaixa);
  AIni.WriteInteger(CSessaoSATConfig, CChaveIdeTpAmb, integer(ide_tpAmb));
  AIni.WriteString(CSessaoSATConfig, CChaveEmitCNPJ, emit_CNPJ);
  AIni.WriteString(CSessaoSATConfig, CChaveEmitIE, emit_IE);
  AIni.WriteString(CSessaoSATConfig, CChaveEmitIM, emit_IM);
  AIni.WriteInteger(CSessaoSATConfig, CChaveEmitcRegTrib, integer(emit_cRegTrib));
  AIni.WriteInteger(CSessaoSATConfig, CChaveEmitcRegTribISSQN,
    integer(emit_cRegTribISSQN));
  AIni.WriteInteger(CSessaoSATConfig, CChaveEmitIndRatISSQN, integer(emit_indRatISSQN));
  AIni.WriteBool(CSessaoSATConfig, CChaveEhUTF8, EhUTF8);
  AIni.WriteInteger(CSessaoSATConfig, CChavePaginaDeCodigo, PaginaDeCodigo);
  AIni.WriteString(CSessaoSATConfig, CChaveArqSchema, ArqSchema);
  AIni.WriteInteger(CSessaoSATConfig, CChaveXmlSignLib, integer(XmlSignLib));
end;

function TSATConfig.GetEhUTF8: boolean;
begin
  Result := (FPaginaDeCodigo = CUTF8CodPage);
end;

procedure TSATConfig.SetEhUTF8(AValue: boolean);
begin
  if AValue then
    FPaginaDeCodigo := CUTF8CodPage
  else
  begin
    if FPaginaDeCodigo = CUTF8CodPage then
      FPaginaDeCodigo := 0;
  end;
end;

{ TSATConfigArquivo }
constructor TSATConfigArquivo.Create;
begin
  FPastaCFeCancelamento := '';
  FPastaCFeVenda := '';
  FSalvarCFe := False;
  FSalvarCFeCanc := False;
  FSalvarEnvio := False;
  FSepararPorCNPJ := False;
  FSepararPorModelo := False;
  FSepararPorMes := False;
  FSepararPorDia := False;
  FPrefixoArqCFe := CPREFIXO_ArqCFe;
  FPrefixoArqCFeCanc := CPREFIXO_ArqCFeCanc;
end;

procedure TSATConfigArquivo.LerIni(const AIni: TCustomIniFile);
begin
  SalvarCFe := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSalvarCFe, SalvarCFe);
  SalvarCFeCanc := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSalvarCFeCanc,
    SalvarCFeCanc);
  SalvarEnvio := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSalvarEnvio, SalvarEnvio);
  SepararPorCNPJ := AIni.ReadBool(CSessaoSATConfigArquivos,
    CChaveSepararPorCNPJ, SepararPorCNPJ);
  SepararPorModelo := AIni.ReadBool(CSessaoSATConfigArquivos,
    CChaveSepararPorModelo, SepararPorModelo);
  SepararPorAno := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSepararPorAno,
    SepararPorAno);
  SepararPorMes := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSepararPorMes,
    SepararPorMes);
  SepararPorDia := AIni.ReadBool(CSessaoSATConfigArquivos, CChaveSepararPorDia,
    SepararPorDia);
  PastaCFeVenda := AIni.ReadString(CSessaoSATConfigArquivos,
    CChavePastaCFeVenda, PastaCFeVenda);
  PastaCFeCancelamento := AIni.ReadString(CSessaoSATConfigArquivos,
    CChavePastaCFeCancelamento, PastaCFeCancelamento);
  PastaEnvio := AIni.ReadString(CSessaoSATConfigArquivos, CChavePastaEnvio, PastaEnvio);
  PrefixoArqCFe := AIni.ReadString(CSessaoSATConfigArquivos,
    CChavePrefixoArqCFe, PrefixoArqCFe);
  PrefixoArqCFeCanc := AIni.ReadString(CSessaoSATConfigArquivos,
    CChavePrefixoArqCFeCanc, PrefixoArqCFeCanc);
end;

procedure TSATConfigArquivo.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSalvarCFe, SalvarCFe);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSalvarCFeCanc, SalvarCFeCanc);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSalvarEnvio, SalvarEnvio);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSepararPorCNPJ, SepararPorCNPJ);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSepararPorModelo, SepararPorModelo);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSepararPorAno, SepararPorAno);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSepararPorMes, SepararPorMes);
  AIni.WriteBool(CSessaoSATConfigArquivos, CChaveSepararPorDia, SepararPorDia);
  AIni.WriteString(CSessaoSATConfigArquivos, CChavePastaCFeVenda, PastaCFeVenda);
  AIni.WriteString(CSessaoSATConfigArquivos, CChavePastaCFeCancelamento,
    PastaCFeCancelamento);
  AIni.WriteString(CSessaoSATConfigArquivos, CChavePastaEnvio, PastaEnvio);
  AIni.WriteString(CSessaoSATConfigArquivos, CChavePrefixoArqCFe, PrefixoArqCFe);
  AIni.WriteString(CSessaoSATConfigArquivos, CChavePrefixoArqCFeCanc, PrefixoArqCFeCanc);
end;

{ TLibSATConfig }

constructor TLibSATConfig.Create(AOwner: TObject; ANomeArquivo: string;
  AChaveCrypt: ansistring);
begin
  inherited Create(AOwner, ANomeArquivo, AChaveCrypt);

  FModelo := satNenhum;
  FNomeDLL := '';
  FArqLOG := '';
  FValidarNumeroSessaoResposta := False;
  FNumeroTentativasValidarSessao := CMAX_ERROS_SESSAO;

  FConfig := TSATConfig.Create;
  FConfigArquivos := TSATConfigArquivo.Create;
  FRede := TRede.Create;
  FExtrato := TExtratoConfig.Create;
  FIntegrador := TIntegradorConfig.Create;
end;

destructor TLibSATConfig.Destroy;
begin
  FConfig.Free;
  FConfigArquivos.Free;
  FRede.Free;
  FExtrato.Free;

  inherited Destroy;
end;

procedure TLibSATConfig.LerIni(const AIni: TCustomIniFile);
begin
  FModelo := TACBrSATModelo(AIni.ReadInteger(CSessaoSAT, CChaveModelo,
    integer(FModelo)));
  FNomeDLL := AIni.ReadString(CSessaoSAT, CChaveModelo, FNomeDLL);
  FValidarNumeroSessaoResposta :=
    AIni.ReadBool(CSessaoSAT, CChaveValidarNumero, FValidarNumeroSessaoResposta);
  FNumeroTentativasValidarSessao :=
    AIni.ReadInteger(CSessaoSAT, CChaveNumeroTentativas, FNumeroTentativasValidarSessao);
  FArqLog := AIni.ReadString(CSessaoSAT, CChaveArqLog, FArqLog);
  FMFe := AIni.ReadBool(CSessaoSAT, CChaveMFe, FMFe);

  with FRede do
  begin
    tipoInter := TTipoInterface(AIni.ReadInteger(CSessaoSATRede,
      CChaveTipoInter, integer(tipoInter)));
    SSID := AIni.ReadString(CSessaoSATRede, CChaveSSID, SSID);
    seg := TSegSemFio(AIni.ReadInteger(CSessaoSATRede, CChaveSeg, integer(seg)));
    codigo := AIni.ReadString(CSessaoSATRede, CChaveCodigo, codigo);
    tipoLan := TTipoLan(AIni.ReadInteger(CSessaoSATRede, CChaveTipoLan,
      integer(tipoLan)));
    lanIP := AIni.ReadString(CSessaoSATRede, CChaveLanIP, lanIP);
    lanMask := AIni.ReadString(CSessaoSATRede, CChaveLanMask, lanMask);
    lanGW := AIni.ReadString(CSessaoSATRede, CChaveLanGW, lanGW);
    lanDNS1 := AIni.ReadString(CSessaoSATRede, CChaveLanDNS1, lanDNS1);
    lanDNS2 := AIni.ReadString(CSessaoSATRede, CChaveLanDNS2, lanDNS2);
    usuario := AIni.ReadString(CSessaoSATRede, CChaveUsuario, usuario);
    senha := AIni.ReadString(CSessaoSATRede, CChaveSenha, '');
    proxy := AIni.ReadInteger(CSessaoSATRede, CChaveProxy, proxy);
    proxy_ip := AIni.ReadString(CSessaoSATRede, CChaveProxyIp, proxy_ip);
    proxy_porta := AIni.ReadInteger(CSessaoSATRede, CChaveProxyPorta, proxy_porta);
    proxy_user := AIni.ReadString(CSessaoSATRede, CChaveProxyUser, proxy_user);
    proxy_senha := AIni.ReadString(CSessaoSATRede, CChaveProxySenha, '');
  end;

  FConfig.LerIni(AIni);
  FConfigArquivos.LerIni(AIni);
  FExtrato.LerIni(AIni);
  FIntegrador.LerIni(AIni);
end;

procedure TLibSATConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteInteger(CSessaoSAT, CChaveModelo, integer(FModelo));
  AIni.WriteString(CSessaoSAT, CChaveModelo, FNomeDLL);
  AIni.WriteBool(CSessaoSAT, CChaveValidarNumero, FValidarNumeroSessaoResposta);
  AIni.WriteInteger(CSessaoSAT, CChaveNumeroTentativas, FNumeroTentativasValidarSessao);
  AIni.WriteString(CSessaoSAT, CChaveArqLog, FArqLog);
  AIni.WriteBool(CSessaoSAT, CChaveMFe, FMFe);

  with FRede do
  begin
    AIni.WriteInteger(CSessaoSATRede, CChaveTipoInter, integer(tipoInter));
    AIni.WriteString(CSessaoSATRede, CChaveSSID, SSID);
    AIni.WriteInteger(CSessaoSATRede, CChaveSeg, integer(seg));
    AIni.WriteString(CSessaoSATRede, CChaveCodigo, codigo);
    AIni.WriteInteger(CSessaoSATRede, CChaveTipoLan, integer(tipoLan));
    AIni.WriteString(CSessaoSATRede, CChaveLanIP, lanIP);
    AIni.WriteString(CSessaoSATRede, CChaveLanMask, lanMask);
    AIni.WriteString(CSessaoSATRede, CChaveLanGW, lanGW);
    AIni.WriteString(CSessaoSATRede, CChaveLanDNS1, lanDNS1);
    AIni.WriteString(CSessaoSATRede, CChaveLanDNS2, lanDNS2);
    AIni.WriteString(CSessaoSATRede, CChaveUsuario, usuario);
    AIni.WriteString(CSessaoSATRede, CChaveSenha, StringToB64Crypt(senha, FChaveCrypt));
    AIni.WriteInteger(CSessaoSATRede, CChaveProxy, proxy);
    AIni.WriteString(CSessaoSATRede, CChaveProxyIp, proxy_ip);
    AIni.WriteInteger(CSessaoSATRede, CChaveProxyPorta, proxy_porta);
    AIni.WriteString(CSessaoSATRede, CChaveProxyUser, proxy_user);
    AIni.WriteString(CSessaoSATRede, CChaveProxySenha,
      StringToB64Crypt(proxy_senha, FChaveCrypt));
  end;

  FConfig.GravarIni(AIni);
  FConfigArquivos.GravarIni(AIni);
  FExtrato.GravarIni(AIni);
  FIntegrador.GravarIni(AIni);
end;

function TLibSATConfig.AtualizarArquivoConfiguracao: boolean;
var
  Versao: string;
begin
  Versao := Ini.ReadString(CSessaoVersao, CLibSATNome, '0');
  Result := (CompareVersions(CLibSATVersao, Versao) > 0) or
    (inherited AtualizarArquivoConfiguracao);
end;

procedure TLibSATConfig.INIParaClasse;
begin
  inherited INIParaClasse;

  LerIni(Ini);
end;

procedure TLibSATConfig.ClasseParaINI;
begin
  inherited ClasseParaINI;

  Ini.WriteString(CSessaoVersao, CLibSATNome, CLibSATVersao);

  GravarIni(Ini);
end;

procedure TLibSATConfig.ClasseParaComponentes;
begin
  if Assigned(Owner) then
    TACBrLibSAT(Owner).SatDM.AplicarConfiguracoes;
end;

procedure TLibSATConfig.Travar;
begin
  if Assigned(Owner) then
  begin
    with TACBrLibSAT(Owner) do
      SatDM.Travar;
  end;
end;

procedure TLibSATConfig.Destravar;
begin
  if Assigned(Owner) then
  begin
    with TACBrLibSAT(Owner) do
      SatDM.Destravar;
  end;
end;

end.