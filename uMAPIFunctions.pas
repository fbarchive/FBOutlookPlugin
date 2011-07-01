unit uMapiFunctions;

interface

uses Windows, ActiveX, SysUtils, Outlook2000;

const
  Mapi32Dll = 'mapi32.dll';

type
  PMSGSESS = Pointer;

type
  TBOOKMARK = ULONG;

  PMAPIERROR = ^TMAPIERROR;
  TMAPIERROR = record
    ulVersion: ULONG;
    lpszError: PChar;
    lpszComponent: PChar;
    ulLowLevelError: ULONG;
    ulContext: ULONG;
  end;

  PSPropTagArray = ^TSPropTagArray;
  TSPropTagArray = record
    cValues: ULONG;
    aulPropTag: array[0..0] of ULONG;
  end;

  TCY = record
    case Integer of
      1:(_noname1:
            record
              Lo: Longint;
              Hi: Longint;
            end;);
      2: (int64: LONGLONG;);
  end;

  TCURRENCY = TCY;
  TSBinary = record
    cb: ULONG;
    lpb: PBYTE;
  end;

  TSShortArray = record
    cValues: ULONG;
    lpi: ^Smallint;
  end;

  TSLongArray = record
    cValues: ULONG;
    lpl: ^Longint;
  end;

  TSRealArray = record
    cValues: ULONG;
    lpflt: ^Single;
  end;

  TSDoubleArray = record
    cValues: ULONG;
    lpdbl: ^Double;
  end;

  TSCurrencyArray = record
    cValues: ULONG;
    lpcur: ^TCURRENCY;
  end;

  TSAppTimeArray = record
    cValues: ULONG;
    lpat: ^Double;
  end;

  TSDateTimeArray = record
    cValues: ULONG;
    lpft: ^TFILETIME;
  end;

  TSBinaryArray = record
    cValues: ULONG;
    lpbin: ^TSBinary;
  end;

  TSLPSTRArray = record
    cValues: ULONG;
    lppszA: ^LPSTR;
  end;

  TSWStringArray = record
    cValues: ULONG;
    lppszW: ^LPWSTR;
  end;

  TSGuidArray = record
    cValues: ULONG;
    lpguid: ^TGUID;
  end;

  TSLargeIntegerArray = record
    cValues: ULONG;
    lpli: ^TLargeInteger;
  end;

  T__UPV = record
    case Integer of
      1 : (i: Smallint;);              { case PT_I2 }
      2 : (l: Longint;);               { case PT_LONG }
      3 : (ul: ULONG;);                { alias for PT_LONG }
      4 : (flt: Single;);              { case PT_R4 }
      5 : (dbl: Double;);              { case PT_DOUBLE }
      6 : (b: Smallint;);              { case PT_BOOLEAN }
      7 : (cur: TCURRENCY;);           { case PT_CURRENCY }
      8 : (at: Double;);               { case PT_APPTIME }
      9 : (ft: TFILETIME;);            { case PT_SYSTIME }
      10: (lpszA: LPSTR;);             { case PT_STRING8 }
      11: (bin: TSBinary;);            { case PT_BINARY }
      12: (lpszW: LPWSTR;);            { case PT_UNICODE }
      13: (lpguid: PGUID;);            { case PT_CLSID }
      14: (li: TLargeInteger;);        { case PT_I8 }
      15: (MVi: TSShortArray;);        { case PT_MV_I2 }
      16: (MVl: TSLongArray;);         { case PT_MV_LONG }
      17: (MVflt: TSRealArray;);       { case PT_MV_R4 }
      18: (MVdbl: TSDoubleArray;);     { case PT_MV_DOUBLE }
      19: (MVcur: TSCurrencyArray;);   { case PT_MV_CURRENCY }
      20: (MVat: TSAppTimeArray;);     { case PT_MV_APPTIME }
      21: (MVft: TSDateTimeArray;);    { case PT_MV_SYSTIME }
      22: (MVbin: TSBinaryArray;);     { case PT_MV_BINARY }
      23: (MVszA: TSLPSTRArray;);      { case PT_MV_STRING8 }
      24: (MVszW: TSWStringArray;);    { case PT_MV_UNICODE }
      25: (MVguid: TSGuidArray;);      { case PT_MV_CLSID }
      26: (MVli: TSLargeIntegerArray;);{ case PT_MV_I8 }
      27: (err: SCODE;);               { case PT_ERROR }
      28: (x: Longint;);               { case PT_NULL, PT_OBJECT (no usable value) }
  end;

  PSPropValue = ^TSPropValue;
  TSPropValue = record
    ulPropTag: ULONG;
    dwAlignPad: ULONG;
    Value: T__UPV;
  end;

  PSPropProblem = ^TSPropProblem;
  TSPropProblem = record
    ulIndex: ULONG;
    ulPropTag: ULONG;
    scode: SCODE;
  end;

  PSPropProblemArray = ^TSPropProblemArray;
  TSPropProblemArray = record
    cProblem: ULONG;
    aProblem: array[0..0] of TSPropProblem;
  end;

  PMAPINAMEID = ^TMAPINAMEID;
  TMAPINAMEID = record
    lpguid: PGUID;
    ulKind: ULONG;
    Kind: record
      case Integer of
        1: (lID: Longint;);
        2: (lpwstrName: LPWSTR;);
    end;
  end;

  PENTRYID = ^TENTRYID;
  TENTRYID = record
    abFlags: array[0..4 - 1] of Byte;
    ab: array[0..0] of Byte;
  end;

  PSPropValueArray = ^TSPropValueArray;
  TSPropValueArray = array[0..0] of TSPropValue;

  PSRow = ^TSRow;
  TSRow = record
    ulAdrEntryPad: ULONG;       { Pad so SRow's can map to ADRENTRY's }
    cValues: ULONG;             { Count of property values }
    lpProps: PSPropValueArray;  { Property value array }
  end;

  PSRowSet = ^TSRowSet;
  TSRowSet = record
    cRows: ULONG;               { Count of rows }
    aRow: array[0..0] of TSRow; { Array of rows }
  end;

  TERROR_NOTIFICATION = record
    cbEntryID: ULONG;
    lpEntryID: PENTRYID;
    scode: SCODE;
    ulFlags: ULONG;                 { 0 or MAPI_UNICODE }
    lpMAPIError: PMAPIERROR;        { Detailed error information }
  end;

  TNEWMAIL_NOTIFICATION = record
    cbEntryID: ULONG;
    lpEntryID: PENTRYID;            { identifies the new message }
    cbParentID: ULONG;
    lpParentID: PENTRYID;           { identifies the folder it lives in }
    ulFlags: ULONG;                 { 0 or MAPI_UNICODE }
    lpszMessageClass: PChar;        { message class (UNICODE or string8) }
    ulMessageFlags: ULONG;          { copy of PR_MESSAGE_FLAGS }
  end;

  TOBJECT_NOTIFICATION = record
    cbEntryID: ULONG;
    lpEntryID: PENTRYID;            { EntryID of object }
    ulObjType: ULONG;               { Type of object }
    cbParentID: ULONG;
    lpParentID: PENTRYID;           { EntryID of parent object }
    cbOldID: ULONG;
    lpOldID: PENTRYID;              { EntryID of old object }
    cbOldParentID: ULONG;
    lpOldParentID: PENTRYID;        { EntryID of old parent }
    lpPropTagArray: PSPropTagArray;
  end;

  TTABLE_NOTIFICATION = record
    ulTableEvent: ULONG;            { Identifies WHICH table event }
    hResult: HResult;               { Value for TABLE_ERROR }
    propIndex: TSPropValue;         { This row's "index property" }
    propPrior: TSPropValue;         { Preceding row's "index property" }
    row: TSRow;                     { New data of added/modified row }
    ulPad: ULONG;                   { Force to 8-byte boundary }
  end;

  TEXTENDED_NOTIFICATION = record
    ulEvent: ULONG;                 { extended event code }
    cb: ULONG;                      { size of event parameters }
    pbEventParameters: PBYTE;       { event parameters }
  end;

  TSTATUS_OBJECT_NOTIFICATION = record
    cbEntryID: ULONG;
    lpEntryID: PENTRYID;
    cValues: ULONG;
    lpPropVals: PSPropValue;
  end;

  PNOTIFICATION = ^TNOTIFICATION;
  TNOTIFICATION = record
    ulEventType: ULONG;             { notification type, i.e. fnevSomething }
    ulAlignPad: ULONG;              { Force to 8-byte boundary }
    info: record
      case Integer of
        1: (err: TERROR_NOTIFICATION;);
        2: (newmail: TNEWMAIL_NOTIFICATION;);
        3: (obj: TOBJECT_NOTIFICATION;);
        4: (tab: TTABLE_NOTIFICATION;);
        5: (ext: TEXTENDED_NOTIFICATION;);
        6: (statobj: TSTATUS_OBJECT_NOTIFICATION;);
      end;
  end;

  PSRestriction = ^TSRestriction;

  TSAndRestriction = record
    cRes: ULONG;
    lpRes: PSRestriction;
  end;

  TSOrRestriction = record
    cRes: ULONG;
    lpRes: PSRestriction;
  end;

  TSNotRestriction = record
    ulReserved: ULONG;
    lpRes: PSRestriction;
  end;

  TSContentRestriction = record
    ulFuzzyLevel: ULONG;
    ulPropTag: ULONG;
    lpProp: PSPropValue;
  end;
    
  TSBitMaskRestriction = record
    relBMR: ULONG;
    ulPropTag: ULONG;
    ulMask: ULONG;
  end;

  TSPropertyRestriction = record
    relop: ULONG;
    ulPropTag: ULONG;
    lpProp: PSPropValue;
  end;

  TSComparePropsRestriction = record
    relop: ULONG;
    ulPropTag1: ULONG;
    ulPropTag2: ULONG;
  end;

  TSSizeRestriction = record
    relop: ULONG;
    ulPropTag: ULONG;
    cb: ULONG;
  end;

  TSExistRestriction = record
    ulReserved1: ULONG;
    ulPropTag: ULONG;
    ulReserved2: ULONG;
  end;

  TSSubRestriction = record
    ulSubObject: ULONG;
    lpRes: PSRestriction;
  end;

  TSCommentRestriction = record
    cValues: ULONG;                 { # of properties in lpProp }
    lpRes: PSRestriction;
    lpProp: PSPropValue;
  end;

  TSRestriction = record
    rt: ULONG;
    res: record
      case Integer of
        1 : (resCompareProps: TSComparePropsRestriction;);
        2 : (resAnd: TSAndRestriction;);
        3 : (resOr: TSOrRestriction;);
        4 : (resNot: TSNotRestriction;);
        5 : (resContent: TSContentRestriction;);
        6 : (resProperty: TSPropertyRestriction;);
        7 : (resBitMask: TSBitMaskRestriction;);
        8 : (resSize: TSSizeRestriction;);
        9 : (resExist: TSExistRestriction;);
        10: (resSub: TSSubRestriction;);
        11: (resComment: TSCommentRestriction;);
    end;
  end;

  PSSortOrder = ^TSSortOrder;
  TSSortOrder = record
    ulPropTag: ULONG;
    ulOrder: ULONG;
  end;

  PSSortOrderSet = ^TSSortOrderSet;
  TSSortOrderSet = record
    cSorts: ULONG;
    cCategories: ULONG;
    cExpanded: ULONG;
    aSort: array[0..0] of TSSortOrder;
  end;

  PADRENTRY = ^TADRENTRY;
  TADRENTRY = record
      ulReserved1: ULONG;
      cValues: ULONG;
      rgPropVals: PSPropValue;
    end;

  PADRLIST = ^TADRLIST;
  TADRLIST = record
    cEntries: ULONG;
    aEntries: array[0..0] of TADRENTRY;
  end;

type
  TACCELERATEABSDI = function (ulUIParam: ULONG; lpvmsg: Pointer): BOOL; stdcall;
  PFNABSDI = ^TACCELERATEABSDI;

type
  TDISMISSMODELESS = function (ulUIParam: ULONG; lpvContext: Pointer): Pointer; stdcall;
  PFNDISMISS = ^TDISMISSMODELESS;

type
  PFNBUTTON = function (ulUIParam: ULONG; lpvContext: Pointer;
    cbEntryID: ULONG; lpSelection: PENTRYID; ulFlags: ULONG): SCODE; stdcall;

type
  PADRPARM = ^TADRPARM;
  TADRPARM = record
    cbABContEntryID: ULONG;
    lpABContEntryID: PENTRYID;
    ulFlags: ULONG;
    lpReserved: Pointer;
    ulHelpContext: ULONG;
    lpszHelpFileName: PChar;
    lpfnABSDI: PFNABSDI;
    lpfnDismiss: PFNDISMISS;
    lpvDismissContext: Pointer;
    lpszCaption: PChar;
    lpszNewEntryTitle: PChar;
    lpszDestWellsTitle: PChar;
    cDestFields: ULONG;
    nDestFieldFocus: ULONG;
    lppszDestTitles: ^PChar;
    lpulDestComps: ^ULONG;
    lpContRestriction: PSRestriction;
    lpHierRestriction: PSRestriction;
  end;

type
  PMAPIUID = ^TMAPIUID;
  TMAPIUID = record
    ab: array [0..16 - 1] of Byte;
  end;

type
  TENTRYLIST = TSBinaryArray;
  PENTRYLIST = ^TENTRYLIST;

type
  IMAPIProgress = interface(IUnknown)
  ['{0002031F-0000-0000-C000-000000000046}']
    function Progress(ulValue: ULONG; ulCount: ULONG; ulTotal: ULONG): HResult; stdcall;
    function GetFlags(var lpulFlags: ULONG): HResult; stdcall;
    function GetMax(var lpulMax: ULONG): HResult; stdcall;
    function GetMin(var lpulMin: ULONG): HResult; stdcall;
    function SetLimits(lpulMin: PULONG; lpulMax: PULONG; lpulFlags: PULONG): HResult; stdcall;
  end;

  IMAPIProp = interface(IUnknown)
  ['{00020303-0000-0000-C000-000000000046}']
    function GetLastError(hResult: HResult; ulFlags: ULONG;
      var lppMAPIError: PMAPIERROR): HResult; stdcall;
    function SaveChanges(ulFlags: ULONG): HResult; stdcall;
    function GetProps(lpPropTagArray: PSPropTagArray; ulFlags: ULONG;
      var lpcValues: ULONG;
      var lppPropArray: PSPropValue): HResult; stdcall;
    function GetPropList(ulFlags: ULONG;
      var lppPropTagArray: PSPropTagArray): HResult; stdcall;
    function OpenProperty (ulPropTag: ULONG; const lpiid: TIID;
      ulInterfaceOptions: ULONG; ulFlags: ULONG;
      var lppUnk: IUnknown): HResult; stdcall;
    function SetProps(cValues: ULONG; lpPropArray: PSPropValue;
      var lppProblems: PSPropProblemArray): HResult; stdcall;
    function DeleteProps(lpPropTagArray: PSPropTagArray;
      var lppProblems: PSPropProblemArray): HResult; stdcall;
    function CopyTo(ciidExclude: ULONG; const rgiidExclude: TIID;
      lpExcludeProps: PSPropTagArray; ulUIParam: ULONG;
      lpProgress: IMAPIProgress; const lpInterface: TIID;
      lpDestObj: Pointer; ulFlags: ULONG;
      var lppProblems: PSPropProblemArray): HResult; stdcall;
    function CopyProps(lpIncludeProps: PSPropTagArray; ulUIParam: ULONG;
      lpProgress: IMAPIProgress; const lpInterface: TIID; lpDestObj: Pointer;
      ulFlags: ULONG; var lppProblems: PSPropProblemArray): HResult; stdcall;
    function GetNamesFromIDs(var lppPropTags: PSPropTagArray;
      lpPropSetGuid: PGUID; ulFlags: ULONG; var lpcPropNames:  ULONG;
      var lpppPropNames: PMAPINAMEID): HResult; stdcall;
    function GetIDsFromNames(cPropNames: ULONG; var lppPropNames: PMAPINAMEID;
      ulFlags: ULONG; var lppPropTags: PSPropTagArray): HResult; stdcall;
  end;

  IAttach = interface(IMAPIProp)
  ['{00020308-0000-0000-C000-000000000046}']
  end;

  IMAPIAdviseSink = interface(IUnknown)
  ['{00020302-0000-0000-C000-000000000046}']
    function OnNotify(cNotif: ULONG; lpNotifications: PNOTIFICATION): ULONG; stdcall;
  end;

  IMAPITable = interface(IUnknown)
  ['{00020301-0000-0000-C000-000000000046}']
    function GetLastError(hResult: HResult; ulFlags: ULONG;
      var lppMAPIError: PMAPIERROR): HResult; stdcall;
    function Advise(ulEventMask: ULONG; lpAdviseSink: IMAPIAdviseSink;
      var lpulConnection: ULONG): HResult; stdcall;
    function Unadvise(ulConnection: ULONG): HResult; stdcall;
    function GetStatus(var lpulTableStatus: ULONG; var lpulTableType: ULONG): HResult; stdcall;
    function SetColumns(lpPropTagArray: PSPropTagArray; ulFlags: ULONG): HResult; stdcall;
    function QueryColumns(ulFlags: ULONG; var lpPropTagArray: PSPropTagArray): HResult; stdcall;
    function GetRowCount(ulFlags: ULONG; var lpulCount: ULONG): HResult; stdcall;
    function SeekRow(bkOrigin: TBOOKMARK; lRowCount: Longint; var lplRowsSought: Longint): HResult; stdcall;
    function SeekRowApprox(ulNumerator: ULONG; ulDenominator: ULONG): HResult; stdcall;
    function QueryPosition(var lpulRow: ULONG; var lpulNumerator: ULONG;
      var lpulDenominator: ULONG): HResult; stdcall;
    function FindRow(lpRestriction: PSRestriction; bkOrigin: TBOOKMARK;
      ulFlags: ULONG): HResult; stdcall;
    function Restrict(lpRestriction: PSRestriction; ulFlags: ULONG): HResult; stdcall;
    function CreateBookmark(var lpbkPosition: TBOOKMARK): HResult; stdcall;
    function FreeBookmark(bkPosition: TBOOKMARK): HResult; stdcall;
    function SortTable(lpSortCriteria: PSSortOrderSet; ulFlags: ULONG): HResult; stdcall;
    function QuerySortOrder(var lppSortCriteria: PSSortOrderSet): HResult; stdcall;
    function QueryRows(lRowCount: Longint; ulFlags: ULONG;
      var lppRows: PSRowSet): HResult; stdcall;
    function Abort: HResult; stdcall;
    function ExpandRow(cbInstanceKey: ULONG; pbInstanceKey: PBYTE;
      ulRowCount: ULONG; ulFlags: ULONG; var lppRows: PSRowSet;
      var lpulMoreRows: ULONG): HResult; stdcall;
    function CollapseRow(cbInstanceKey: ULONG; pbInstanceKey: PBYTE;
      ulFlags: ULONG; var lpulRowCount: ULONG): HResult; stdcall;
    function WaitForCompletion(ulFlags: ULONG; ulTimeout: ULONG;
      var lpulTableStatus: ULONG): HResult; stdcall;
    function GetCollapseState(ulFlags: ULONG; cbInstanceKey: ULONG;
      lpbInstanceKey: PBYTE; var lpcbCollapseState: ULONG;
      var lppbCollapseState: PBYTE): HResult; stdcall;
    function SetCollapseState(ulFlags: ULONG; cbCollapseState: ULONG;
      pbCollapseState: PBYTE; var lpbkLocation: TBOOKMARK): HResult; stdcall;
  end;

  IMessage = interface(IMAPIProp)
  ['{00020307-0000-0000-C000-000000000046}']
    function GetAttachmentTable(ulFlags: ULONG; var lppTable: IMAPITable): HResult; stdcall;
    function OpenAttach(ulAttachmentNum: ULONG; const lpInterface: TIID;
      ulFlags: ULONG; var lppAttach: IAttach): HResult; stdcall;
    function CreateAttach(const lpInterface: PIID; ulFlags: ULONG;
      var lpulAttachmentNum: ULONG; var lppAttach: IAttach): HResult; stdcall;
    function DeleteAttach(ulAttachmentNum: ULONG; ulUIParam: ULONG;
      lpProgress: IMAPIProgress; ulFlags: ULONG): HResult; stdcall;
    function GetRecipientTable(ulFlags: ULONG; var lppTable: IMAPITable): HResult; stdcall;
    function ModifyRecipients(ulFlags: ULONG; lpMods: PADRLIST): HResult; stdcall;
    function SubmitMessage(ulFlags: ULONG): HResult; stdcall;
    function SetReadFlag(ulFlags: ULONG): HResult; stdcall;
  end;

  IMsgStore = interface(IMAPIProp)
  ['{00020306-0000-0000-C000-000000000046}']
    function Advise (cbEntryID : ULONG; lpEntryID : PENTRYID; ulEventMask : ULONG;
      lpAdviseSink : IMAPIAdviseSink; var lpulConnection : ULONG) : HResult; stdcall;
    function Unadvise (ulConnection : ULONG) : HResult; stdcall;
    function CompareEntryIDs (cbEntryID1 : ULONG; lpEntryID1 : PENTRYID;
      cbEntryID2 : ULONG; lpEntryID2 : PENTRYID; ulFlags : ULONG;
      var lpulResult : ULONG) : HResult; stdcall;
    function OpenEntry (cbEntryID : ULONG; lpEntryID : PENTRYID; const lpInterface : TIID;
      ulFlags : ULONG; var lpulObjType : ULONG; var lppUnk : IUnknown) : HResult; stdcall;
    function SetReceiveFolder (lpszMessageClass : PChar; ulFlags : ULONG;
      cbEntryID : ULONG; lpEntryID : PENTRYID) : HResult; stdcall;
    function GetReceiveFolder (lpszMessageClass : PChar; ulFlags : ULONG;
      var lpcbEntryID : ULONG; var lppEntryID : PENTRYID;
      var lppszExplicitClass : PChar) : HResult; stdcall;
    function GetReceiveFolderTable (ulFlags : ULONG; var lppTable : IMAPITable) : HResult; stdcall;
    function StoreLogoff (var lpulFlags : ULONG) : HResult; stdcall;
    function AbortSubmit (cbEntryID : ULONG; lpEntryID : PENTRYID; ulFlags : ULONG) : HResult; stdcall;
    function GetOutgoingQueue (ulFlags : ULONG; var lppTable : IMAPITable) : HResult; stdcall;
    function SetLockState (lpMessage : IMessage; ulLockState : ULONG) : HResult; stdcall;
    function FinishedMsg (ulFlags : ULONG; cbEntryID : ULONG; lpEntryID : PENTRYID) : HResult; stdcall;
    function NotifyNewMail (lpNotification : PNOTIFICATION) : HResult; stdcall;
  end;

  IProfSect = interface(IMAPIProp)
  ['{00020304-0000-0000-C000-000000000046}']
  end;

  IAddrBook = interface(IMAPIProp)
  ['{00020309-0000-0000-C000-000000000046}']
    function OpenEntry (cbEntryID : ULONG; lpEntryID : PENTRYID; const lpInterface : TIID;
      ulFlags : ULONG; var lpulObjType : ULONG; out lppUnk : IUnknown) : HResult; stdcall;
    function CompareEntryIDs (cbEntryID1 : ULONG; lpEntryID1 : PENTRYID;
      cbEntryID2 : ULONG; lpEntryID2 : PENTRYID; ulFlags : ULONG;
      var lpulResult : ULONG) : HResult; stdcall;
    function Advise (cbEntryID : ULONG; lpEntryID : PENTRYID; ulEventMask : ULONG;
      lpAdviseSink : IMAPIAdviseSink; var lpulConnection : ULONG) : HResult; stdcall;
    function Unadvise (ulConnection : ULONG) : HResult; stdcall;
    function CreateOneOff (lpszName : PChar; lpszAdrType : PChar;
      lpszAddress : PChar; ulFlags : ULONG; var lpcbEntryID : ULONG;
      var lppEntryID : PENTRYID) : HResult; stdcall;
    function NewEntry (ulUIParam : ULONG; ulFlags : ULONG; cbEIDContainer : ULONG; 
      lpEIDContainer : PENTRYID; cbEIDNewEntryTpl : ULONG; 
      lpEIDNewEntryTpl : PENTRYID; var lpcbEIDNewEntry : ULONG; 
      var lppEIDNewEntry : PENTRYID) : HResult; stdcall;
    function ResolveName (ulUIParam : ULONG; ulFlags : ULONG;
      lpszNewEntryTitle : PChar; lpAdrList : PADRLIST) : HResult; stdcall;
    function Address (var lpulUIParam : ULONG; lpAdrParms : PADRPARM; 
      var lppAdrList : PADRLIST) : HResult; stdcall;
    function Details (var lpulUIParam : ULONG; lpfnDismiss : PFNDISMISS; 
      lpvDismissContext : Pointer; cbEntryID : ULONG; lpEntryID : PENTRYID; 
      lpfButtonCallback : PFNBUTTON; lpvButtonContext : Pointer; 
      lpszButtonText : PChar; ulFlags : ULONG) : HResult; stdcall;
    function RecipOptions (ulUIParam : ULONG; ulFlags : ULONG;
      lpRecip : PADRENTRY) : HResult; stdcall;
    function QueryDefaultRecipOpt (lpszAdrType : PChar; ulFlags : ULONG;
      var lpcValues : ULONG; var lppOptions : PSPropValue) : HResult; stdcall;
    function GetPAB (var lpcbEntryID : ULONG;
      var lppEntryID : PENTRYID) : HResult; stdcall;
    function SetPAB (cbEntryID : ULONG;
      lpEntryID : PENTRYID) : HResult; stdcall;
    function GetDefaultDir (var lpcbEntryID : ULONG;
      var lppEntryID : PENTRYID) : HResult; stdcall;
    function SetDefaultDir (cbEntryID : ULONG;
      lpEntryID : PENTRYID) : HResult; stdcall;
    function GetSearchPath (ulFlags : ULONG;
      var lppSearchPath : PSRowSet) : HResult; stdcall;
    function SetSearchPath (ulFlags : ULONG;
      lpSearchPath : PSRowSet) : HResult; stdcall;
    function PrepareRecips (ulFlags : ULONG; lpPropTagArray : PSPropTagArray;
      lpRecipList : PADRLIST) : HResult; stdcall;
  end;

  IMsgServiceAdmin = interface;

  IMAPIContainer = interface(IMAPIProp)
  ['{0002030B-0000-0000-C000-000000000046}']
    function GetContentsTable (ulFlags : ULONG; var lppTable : IMAPITable) : HResult; stdcall;
    function GetHierarchyTable (ulFlags : ULONG; var lppTable : IMAPITable) : HResult; stdcall;
    function OpenEntry (cbEntryID : ULONG; lpEntryID : PENTRYID; const lpInterface : TIID;
      ulFlags : ULONG; var lpulObjType : ULONG; var lppUnk : IUnknown) : HResult; stdcall;
    function SetSearchCriteria (lpRestriction : PSRestriction;
      lpContainerList : PENTRYLIST; ulSearchFlags : ULONG) : HResult; stdcall;
    function GetSearchCriteria (ulFlags : ULONG; var lppRestriction : PSRestriction;
      var lppContainerList : PENTRYLIST; var lpulSearchState : ULONG) : HResult; stdcall;
  end;

  IMAPIFolder = interface(IMAPIContainer)
  ['{0002030C-0000-0000-C000-000000000046}']
    function CreateMessage (const lpInterface : TIID; ulFlags : ULONG;
      var lppMessage : IMessage) : HResult; stdcall;
    function CopyMessages (lpMsgList : PENTRYLIST; const lpInterface : TIID;
      lpDestFolder : Pointer; ulUIParam : ULONG; lpProgress : IMAPIProgress;
      ulFlags : ULONG) : HResult; stdcall;
    function DeleteMessages (lpMsgList : PENTRYLIST; ulUIParam : ULONG;
      lpProgress : IMAPIProgress; ulFlags : ULONG) : HResult; stdcall;
    function CreateFolder (ulFolderType : ULONG; lpszFolderName : PChar;
      lpszFolderComment : PChar; const lpInterface : TIID; ulFlags : ULONG;
      var lppFolder : IMAPIFolder) : HResult; stdcall;
    function CopyFolder (cbEntryID : ULONG; lpEntryID : PENTRYID;
      const lpInterface : TIID; lpDestFolder : Pointer; lpszNewFolderName : PChar;
      ulUIParam : ULONG; lpProgress : IMAPIProgress; ulFlags : ULONG) : HResult; stdcall;
    function DeleteFolder (cbEntryID : ULONG; lpEntryID : PENTRYID;
      ulUIParam : ULONG; lpProgress : IMAPIProgress; ulFlags : ULONG) : HResult; stdcall;
    function SetReadFlags (lpMsgList : PENTRYLIST; ulUIParam : ULONG;
      lpProgress : IMAPIProgress; ulFlags : ULONG) : HResult; stdcall;
    function GetMessageStatus (cbEntryID : ULONG; lpEntryID : PENTRYID;
      ulFlags : ULONG; var lpulMessageStatus : ULONG) : HResult; stdcall;
    function SetMessageStatus (cbEntryID : ULONG; lpEntryID : PENTRYID;
      ulNewStatus : ULONG; ulNewStatusMask : ULONG; var lpulOldStatus : ULONG) : HResult; stdcall;
    function SaveContentsSort (lpSortCriteria : PSSortOrderSet; ulFlags : ULONG) : HResult; stdcall;
    function EmptyFolder (ulUIParam : ULONG; lpProgress : IMAPIProgress;
      ulFlags : ULONG) : HResult; stdcall;
  end;

  IMAPISession = interface(IUnknown)
  ['{00020300-0000-0000-C000-000000000046}']
    function GetLastError(hResult: HResult; ulFlags: ULONG;
      var lppMAPIError: PMAPIERROR): HResult; stdcall;
    function GetMsgStoresTable (ulFlags : ULONG;
      out lppTable : IMAPITable) : HResult; stdcall;
    function OpenMsgStore (ulUIParam : ULONG; cbEntryID : ULONG;
      lpEntryID : PENTRYID; const lpInterface : TIID; ulFlags : ULONG;
      out lppMDB : IMsgStore) : HResult; stdcall;
    function OpenAddressBook (ulUIParam : ULONG; const lpInterface : PIID;
      ulFlags : ULONG; out lppAdrBook : IAddrBook) : HResult; stdcall;
    function OpenProfileSection (lpUID : PMAPIUID; const lpInterface : TIID;
      ulFlags : ULONG; out lppProfSect : IProfSect) : HResult; stdcall;
    function GetStatusTable (ulFlags : ULONG;
      out lppTable : IMAPITable) : HResult; stdcall;
    function OpenEntry (cbEntryID : ULONG; lpEntryID : PENTRYID;
      const lpInterface : TIID; ulFlags : ULONG; var lpulObjType : ULONG;
      out lppUnk : IUnknown) : HResult; stdcall;
    function CompareEntryIDs (cbEntryID1 : ULONG; lpEntryID1 : PENTRYID;
      cbEntryID2 : ULONG; lpEntryID2 : PENTRYID; ulFlags : ULONG;
      var lpulResult : ULONG) : HResult; stdcall;
    function Advise (cbEntryID : ULONG; lpEntryID : PENTRYID;
      ulEventMask : ULONG; lpAdviseSink : IMAPIAdviseSink;
      var lpulConnection : ULONG) : HResult; stdcall;
    function Unadvise (ulConnection : ULONG) : HResult; stdcall;
    function MessageOptions (ulUIParam : ULONG; ulFlags : ULONG;
      lpszAdrType : PChar; lpMessage : IMessage) : HResult; stdcall;
    function QueryDefaultMessageOpt (lpszAdrType : PChar; ulFlags : ULONG;
      var lpcValues : ULONG; var lppOptions : PSPropValue) : HResult; stdcall;
    function EnumAdrTypes (ulFlags : ULONG; var lpcAdrTypes : ULONG;
      var lpppszAdrTypes : PChar) : HResult; stdcall;
    function QueryIdentity (var lpcbEntryID : ULONG;
      var lppEntryID : PENTRYID) : HResult; stdcall;
    function Logoff (ulUIParam : ULONG; ulFlags : ULONG;
      ulReserved : ULONG) : HResult; stdcall;
    function SetDefaultStore (ulFlags : ULONG; cbEntryID : ULONG;
      lpEntryID : PENTRYID) : HResult; stdcall;
    function AdminServices (ulFlags : ULONG;
      out lppServiceAdmin : IMsgServiceAdmin) : HResult; stdcall;
    function ShowForm (ulUIParam : ULONG; lpMsgStore : IMsgStore;
      lpParentFolder : IMAPIFolder; const lpInterface : TIID;
      ulMessageToken : ULONG; lpMessageSent : IMessage; ulFlags : ULONG;
      ulMessageStatus : ULONG; ulMessageFlags : ULONG; ulAccess : ULONG;
      lpszMessageClass : LPSTR) : HResult; stdcall;
    function PrepareForm (const lpInterface : TIID; lpMessage : IMessage;
      var lpulMessageToken : ULONG) : HResult; stdcall;
  end;

  IProviderAdmin = interface(IUnknown)
  ['{00020325-0000-0000-C000-000000000046}']
    function GetLastError (hResult : HResult; ulFlags : ULONG;
      var lppMAPIError : PMAPIERROR) : HResult; stdcall;
    function GetProviderTable (ulFlags : ULONG; var lppTable : IMAPITable) : HResult; stdcall;
    function CreateProvider (lpszProvider : PChar; cValues : ULONG;
      lpProps : PSPropValue; ulUIParam : ULONG; ulFlags : ULONG;
      var lpUID : TMAPIUID) : HResult; stdcall;
    function DeleteProvider (lpUID : PMAPIUID) : HResult; stdcall;
    function OpenProfileSection (lpUID : PMAPIUID; const lpInterface : TIID;
      ulFlags : ULONG; var lppProfSect : IProfSect) : HResult; stdcall;
  end;

  IMsgServiceAdmin = interface(IUnknown)
  ['{0002031D-0000-0000-C000-000000000046}']
    function GetLastError (hResult : HResult; ulFlags : ULONG;
      var lppMAPIError : PMAPIERROR) : HResult; stdcall;
    function GetMsgServiceTable (ulFlags : ULONG; out lppTable : IMAPITable) : HResult; stdcall;
    function CreateMsgService (lpszService : PChar; lpszDisplayName : PChar;
      ulUIParam : ULONG; ulFlags : ULONG) : HResult; stdcall;
    function DeleteMsgService (lpUID : PMAPIUID) : HResult; stdcall;
    function CopyMsgService (lpUID : PMAPIUID; lpszDisplayName : PChar;
      const lpInterfaceToCopy : TIID; const lpInterfaceDst : TIID;
      lpObjectDst : Pointer; ulUIParam : ULONG;
      ulFlags : ULONG) : HResult; stdcall;
    function RenameMsgService (lpUID : PMAPIUID; ulFlags : ULONG;
      lpszDisplayName : PChar) : HResult; stdcall;
    function ConfigureMsgService (lpUID : PMAPIUID; ulUIParam : ULONG;
      ulFlags : ULONG; cValues : ULONG; lpProps : PSPropValue) : HResult; stdcall;
    function OpenProfileSection (lpUID : PMAPIUID; const lpInterface : TIID;
      ulFlags : ULONG; out lppProfSect : IProfSect) : HResult; stdcall;
    function MsgServiceTransportOrder (cUID : ULONG; lpUIDList : PMAPIUID;
      ulFlags : ULONG) : HResult; stdcall;
    function AdminProviders (lpUID : PMAPIUID; ulFlags : ULONG;
      out lppProviderAdmin : IProviderAdmin) : HResult; stdcall;
    function SetPrimaryIdentity (lpUID : PMAPIUID; ulFlags : ULONG) : HResult; stdcall;
    function GetProviderTable (ulFlags : ULONG; out lppTable : IMAPITable) : HResult; stdcall;
  end;

type
  TMAPIInitialize = function (lpMapiInit: Pointer): HResult; stdcall;
  TMAPIUninitialize = procedure; stdcall;
  TMAPILogonEx = function (ulUIParam: ULONG; lpszProfileName: PChar;
    lpszPassword: PChar; ulFlags: ULONG; { ulFlags takes all that SimpleMAPI does + MAPI_UNICODE }
    out lppSession: IMAPISession): HResult; stdcall;
  THrGetOneProp = function (pmp: IMAPIPROP; ulPropTag: ULONG; var ppprop: PSPropValue): HResult; stdcall;
  THrSetOneProp = function (pmp: IMAPIPROP; pprop: PSPropValue): HResult; stdcall;
  TMAPIFreeBuffer = function (lpBuffer: Pointer): ULONG; stdcall;
  TWrapCompressedRTFStream = function (lpCompressedRTFStream: IStream; ulFlags: ULONG;
    var lpUncompressedRTFStream: IStream): HResult; stdcall;
  TRTFSync = function (lpMessage: IMessage; ulFlags: ULONG;
    var lpfMessageUpdated: BOOL): HResult; stdcall;

  TMAPIGetDefaultMalloc = function: Pointer; stdcall;
  TOpenIMsgSession = function (
    lpMalloc: IMalloc;                         { -> Co malloc object          }
    ulFlags: ULONG;                            { reserved. Must be zero.      }
    var lppMsgSess: PMSGSESS): SCODE; stdcall; { <- message session object    }
  TCloseIMsgSession = procedure (
    lpMsgSess: PMSGSESS); stdcall;             { -> message session object    }

type
  TALLOCATEBUFFER = function (cbSize: ULONG; var lppBuffer: Pointer): SCODE; stdcall;
  TALLOCATEMORE = function (cbSize: ULONG; lpObject: Pointer;
    var lppBuffer: Pointer): SCODE; stdcall;
  TFREEBUFFER = function (lpBuffer: Pointer): ULONG; stdcall;
  PALLOCATEBUFFER = ^TALLOCATEBUFFER;
  PALLOCATEMORE = ^TALLOCATEMORE;
  PFREEBUFFER = ^TFREEBUFFER;

  TMSGCALLRELEASE = procedure (ulCallerData: ULONG;
    lpMessage: IMessage); stdcall;
  TMAPIAllocateBuffer = function (cbSize: ULONG;
    var lppBuffer: Pointer): SCODE; stdcall;
  TMAPIAllocateMore = function (cbSize: ULONG; lpObject: Pointer;
    var lppBuffer: Pointer): SCODE; stdcall;
//  TMAPIFreeBuffer = function (lpBuffer: Pointer): ULONG; stdcall;

  TOpenIMsgOnIStg = function (
    lpMsgSess: PMSGSESS;                   { -> message session obj (optional) }
    lpAllocateBuffer: PALLOCATEBUFFER;     { -> AllocateBuffer memory routine  }
    lpAllocateMore: PALLOCATEMORE;         { -> AllocateMore memory routine    }
    lpFreeBuffer: PFREEBUFFER;             { -> FreeBuffer memory routine      }
    lpMalloc: IMalloc;                     { -> Co malloc object               }
    lpMapiSup: Pointer;                    { -> MAPI Support Obj (optional)    }
    lpStg: IStorage;                       { -> open IStorage containing msg   }
    var lpfMsgCallRelease: TMSGCALLRELEASE;{ -> release callback rtn (opt) }
    ulCallerData: ULONG;                   { caller data returned in callback  }
    ulFlags: ULONG;                        { -> flags (controls istg commit)   }
    out lppMsg: IMessage): SCODE; stdcall;

var
  MAPIDLLHandle: THandle;
  MAPIInitialize: TMAPIInitialize = nil;
  MAPIUninitialize: TMAPIUninitialize = nil;
  MAPILogonEx: TMAPILogonEx = nil;
  HrGetOneProp: THrGetOneProp = nil;
  HrSetOneProp: THrSetOneProp = nil;
  MAPIAllocateBuffer: TMAPIAllocateBuffer = nil;
  MAPIAllocateMore: TMAPIAllocateMore = nil;
  MAPIFreeBuffer: TMAPIFreeBuffer = nil;
  WrapCompressedRTFStream: TWrapCompressedRTFStream = nil;
  RTFSync: TRTFSync = nil;

  MAPIGetDefaultMalloc: TMAPIGetDefaultMalloc = nil;
  OpenIMsgSession: TOpenIMsgSession = nil;
  CloseIMsgSession: TCloseIMsgSession = nil;
  OpenIMsgOnIStg: TOpenIMsgOnIStg = nil;

function GetSenderAddressViaMAPI(const MailItem: MailItem): string;

const
  MAPI_DEFERRED_ERRORS   = ULONG($00000008);
  MAPI_MODIFY            = ULONG($00000001);
  MAPI_CREATE            = ULONG($00000002);
  STORE_UNCOMPRESSED_RTF = ULONG($00008000);

  MAPI_EXTENDED     = ULONG($00000020);
  MAPI_ALLOW_OTHERS = ULONG($00000008);

  KEEP_OPEN_READONLY  = ULONG($00000001);
  KEEP_OPEN_READWRITE = ULONG($00000002);
  FORCE_SAVE          = ULONG($00000004);

  RTF_SYNC_RTF_CHANGED  = ULONG($00000001);
  RTF_SYNC_BODY_CHANGED = ULONG($00000002);

  PT_STRING8 = ULONG(30);  { Null terminated 8-bit character string }
  PT_UNICODE = ULONG(31);  { Null terminated Unicode string }
  PT_LONG    = ULONG(3);   { Signed 32-bit value }
  PT_BINARY  = ULONG(258); { Uninterpreted (counted byte array) }
  PT_OBJECT  = ULONG(13);  { Embedded object in a property }

  PR_BODY   = (PT_STRING8) or (($1000) shl 16);
  PR_BODY_W = (PT_UNICODE) or (($1000) shl 16);
  PR_BODY_A = (PT_STRING8) or (($1000) shl 16);

  PR_ATTACH_FLAGS = (PT_LONG) or (($3714) shl 16);

  PR_RTF_COMPRESSED = (PT_BINARY) or (($1009) shl 16);

  PR_ADDRTYPE    = (PT_STRING8) or (($3002) shl 16);
  PR_ADDRTYPE_W  = (PT_UNICODE) or (($3002) shl 16);
  PR_ADDRTYPE_A  = (PT_STRING8) or (($3002) shl 16);

  PR_EMAIL_ADDRESS   = (PT_STRING8) or (($3003) shl 16);
  PR_EMAIL_ADDRESS_W = (PT_UNICODE) or (($3003) shl 16);
  PR_EMAIL_ADDRESS_A = (PT_STRING8) or (($3003) shl 16);

  PR_SENDER_ADDRTYPE   = PT_STRING8 or ($0C1E shl 16);
  PR_SENDER_ADDRTYPE_W = PT_UNICODE or ($0C1E shl 16);
  PR_SENDER_ADDRTYPE_A = PT_STRING8 or ($0C1E shl 16);

  PR_SENDER_EMAIL_ADDRESS   = PT_STRING8 or ($0C1F shl 16);
  PR_SENDER_EMAIL_ADDRESS_W = PT_UNICODE or ($0C1F shl 16);
  PR_SENDER_EMAIL_ADDRESS_A = PT_STRING8 or ($0C1F shl 16);

  PR_SENDER_NAME   = PT_STRING8 or ($0C1A shl 16);
  PR_SENDER_NAME_W = PT_UNICODE or ($0C1A shl 16);
  PR_SENDER_NAME_A = PT_STRING8 or ($0C1A shl 16);

  PR_RECEIVED_BY_EMAIL_ADDRESS   = PT_STRING8 or ($0076 shl 16);
  PR_RECEIVED_BY_EMAIL_ADDRESS_W = PT_UNICODE or ($0076 shl 16);
  PR_RECEIVED_BY_EMAIL_ADDRESS_A = PT_STRING8 or ($0076 shl 16);

  PR_DISPLAY_TO   = PT_STRING8 or ($0E04 shl 16);
  PR_DISPLAY_TO_W = PT_UNICODE or ($0E04 shl 16);
  PR_DISPLAY_TO_A = PT_STRING8 or ($0E04 shl 16);

  PR_ATTACH_NUM         = PT_LONG or ($0E21 shl 16);
  PR_ATTACH_DATA_BIN    = PT_BINARY or ($3701 shl 16);
  PR_ATTACH_DATA_OBJ    = PT_OBJECT or ($3701 shl 16);
  PR_ATTACH_METHOD      = PT_LONG or ($3705 shl 16);
  PR_RENDERING_POSITION = PT_LONG or ($370B shl 16);

  NO_ATTACHMENT         = ULONG($00000000);
  ATTACH_BY_VALUE       = ULONG($00000001);
  ATTACH_BY_REFERENCE   = ULONG($00000002);
  ATTACH_BY_REF_RESOLVE = ULONG($00000003);
  ATTACH_BY_REF_ONLY    = ULONG($00000004);
  ATTACH_EMBEDDED_MSG   = ULONG($00000005);
  ATTACH_OLE            = ULONG($00000006);

  MAPI_BEST_ACCESS = ULONG($00000010);

implementation

function GetSenderAddressViaMAPI(const MailItem: MailItem): string;
var
  AProp: PSPropValue;
  MAPIMail: IMessage;
  AdrType: string;
begin
  Result := '';
  if Assigned(HrGetOneProp) then
  try
    MAPIMail := IMessage(MailItem.MAPIObject);
    AdrType := 'SMTP';
    if HrGetOneProp(MAPIMail, PR_SENDER_ADDRTYPE, AProp) = S_OK then begin
      AdrType := StrPas(AProp^.Value.lpszA);
      MAPIFreeBuffer(AProp);
    end;
    // smtp
    if UpperCase(AdrType) = 'SMTP' then
      if HrGetOneProp(MAPIMail, PR_SENDER_EMAIL_ADDRESS, AProp) = S_OK then begin
        Result := StrPas(AProp^.Value.lpszA);
        MAPIFreeBuffer(AProp);
      end;
    // exchange
    if UpperCase(AdrType) = 'EX' then
      if HrGetOneProp(MAPIMail, PR_SENDER_NAME, AProp) = S_OK then begin
        Result := StrPas(AProp^.Value.lpszA);
        MAPIFreeBuffer(AProp);
      end;
  finally
    MAPIMail := nil;
  end;
end;

initialization
  MAPIDLLHandle := LoadLibrary(Mapi32Dll);
  if MAPIDLLHandle <> 0 then begin
    MAPIInitialize := GetProcAddress(MAPIDLLHandle, 'MAPIInitialize');
    MAPIUninitialize := GetProcAddress(MAPIDLLHandle, 'MAPIUninitialize');
    MAPILogonEx := GetProcAddress(MAPIDLLHandle, 'MAPILogonEx');
    HrGetOneProp := GetProcAddress(MAPIDLLHandle, 'HrGetOneProp@12');
    HrSetOneProp := GetProcAddress(MAPIDLLHandle, 'HrSetOneProp@8');
    MAPIAllocateBuffer := GetProcAddress(MAPIDLLHandle, 'MAPIAllocateBuffer');
    MAPIAllocateMore := GetProcAddress(MAPIDLLHandle, 'MAPIAllocateMore');
    MAPIFreeBuffer := GetProcAddress(MAPIDLLHandle, 'MAPIFreeBuffer');
    WrapCompressedRTFStream := GetProcAddress(MAPIDLLHandle, 'WrapCompressedRTFStream');
    RTFSync := GetProcAddress(MAPIDLLHandle, 'RTFSync');

    MAPIGetDefaultMalloc := GetProcAddress(MAPIDLLHandle, 'MAPIGetDefaultMalloc@0');
    OpenIMsgSession := GetProcAddress(MAPIDLLHandle, 'OpenIMsgSession@12');
    CloseIMsgSession := GetProcAddress(MAPIDLLHandle, 'CloseIMsgSession@4');
    OpenIMsgOnIStg := GetProcAddress(MAPIDLLHandle, 'OpenIMsgOnIStg@44');
  end;

finalization
  if MAPIDLLHandle <> INVALID_HANDLE_VALUE then
    FreeLibrary(MAPIDLLHandle);

end.
