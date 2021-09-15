// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// ApolloType namespace
public enum ApolloType {
  public struct AnalyticEvent: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - type
    ///   - action
    ///   - new
    ///   - old
    ///   - version
    ///   - timestamp
    public init(type: String, action: String, new: Swift.Optional<String?> = nil, old: Swift.Optional<String?> = nil, version: String, timestamp: String) {
      graphQLMap = ["type": type, "action": action, "new": new, "old": old, "version": version, "timestamp": timestamp]
    }

    public var type: String {
      get {
        return graphQLMap["type"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "type")
      }
    }

    public var action: String {
      get {
        return graphQLMap["action"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "action")
      }
    }

    public var new: Swift.Optional<String?> {
      get {
        return graphQLMap["new"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "new")
      }
    }

    public var old: Swift.Optional<String?> {
      get {
        return graphQLMap["old"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "old")
      }
    }

    public var version: String {
      get {
        return graphQLMap["version"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "version")
      }
    }

    public var timestamp: String {
      get {
        return graphQLMap["timestamp"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "timestamp")
      }
    }
  }

  public enum Language: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case bo
    case aa
    case ab
    case af
    case ak
    case als
    case am
    case an
    case ang
    case ar
    case arc
    case `as`
    case ast
    case av
    case awa
    case ay
    case az
    case ba
    case bar
    case bat
    case bcl
    case be
    case bg
    case bh
    case bi
    case bm
    case bn
    case bpy
    case br
    case bs
    case bug
    case bxr
    case ca
    case cdo
    case ce
    case ceb
    case ch
    case cho
    case chr
    case chy
    case ckb
    case co
    case cr
    case cs
    case csb
    case cu
    case cv
    case cy
    case da
    case de
    case diq
    case dsb
    case dv
    case dz
    case ee
    case el
    case en
    case eo
    case es
    case et
    case eu
    case ext
    case fa
    case ff
    case fi
    case fiu
    case fj
    case fo
    case fr
    case frp
    case fur
    case fy
    case ga
    case gan
    case gbm
    case gd
    case gil
    case gl
    case gn
    case got
    case gu
    case gv
    case ha
    case hak
    case haw
    case he
    case hi
    case ho
    case hr
    case ht
    case hu
    case hy
    case hz
    case ia
    case id
    case ie
    case ig
    case ii
    case ik
    case ilo
    case inh
    case io
    case `is`
    case it
    case iu
    case ja
    case jbo
    case jv
    case ka
    case kg
    case ki
    case kj
    case kk
    case kl
    case km
    case kn
    case khw
    case ko
    case kr
    case ks
    case ksh
    case ku
    case kv
    case kw
    case ky
    case la
    case lad
    case lan
    case lb
    case lg
    case li
    case lij
    case lmo
    case ln
    case lo
    case lzz
    case lt
    case lv
    case map
    case mg
    case man
    case mh
    case mi
    case min
    case mk
    case ml
    case mn
    case mo
    case mr
    case mrh
    case ms
    case mt
    case mus
    case mwl
    case my
    case na
    case nah
    case nap
    case nd
    case nds
    /// nds-nl
    case ne
    case new
    case ng
    case nl
    case nn
    case no
    case nr
    case nso
    case nrm
    case nv
    case ny
    case oc
    case oj
    case om
    case or
    case os
    case pa
    case pag
    case pam
    case pap
    case pdc
    case pi
    case pih
    case pl
    case pms
    case ps
    case pt
    case qu
    case rm
    case rmy
    case rn
    case ro
    case roa
    case ru
    case rw
    case sa
    case sc
    case scn
    case sco
    case sd
    case se
    case sg
    case sh
    case si
    case sk
    case sl
    case sm
    case sn
    case so
    case sq
    case sr
    case ss
    case st
    case su
    case sv
    case sw
    case ta
    case te
    case tet
    case tg
    case th
    case ti
    case tk
    case tl
    case tlh
    case tn
    case to
    case tpi
    case tr
    case ts
    case tt
    case tum
    case tw
    case ty
    case udm
    case ug
    case uk
    case ur
    case uz
    case uzAf
    case ve
    case vi
    case vec
    case vls
    case vo
    case wa
    case war
    case wo
    case xal
    case xh
    case xmf
    case yi
    case yo
    case za
    case zh
    case zu
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "bo": self = .bo
        case "aa": self = .aa
        case "ab": self = .ab
        case "af": self = .af
        case "ak": self = .ak
        case "als": self = .als
        case "am": self = .am
        case "an": self = .an
        case "ang": self = .ang
        case "ar": self = .ar
        case "arc": self = .arc
        case "as": self = .as
        case "ast": self = .ast
        case "av": self = .av
        case "awa": self = .awa
        case "ay": self = .ay
        case "az": self = .az
        case "ba": self = .ba
        case "bar": self = .bar
        case "bat": self = .bat
        case "bcl": self = .bcl
        case "be": self = .be
        case "bg": self = .bg
        case "bh": self = .bh
        case "bi": self = .bi
        case "bm": self = .bm
        case "bn": self = .bn
        case "bpy": self = .bpy
        case "br": self = .br
        case "bs": self = .bs
        case "bug": self = .bug
        case "bxr": self = .bxr
        case "ca": self = .ca
        case "cdo": self = .cdo
        case "ce": self = .ce
        case "ceb": self = .ceb
        case "ch": self = .ch
        case "cho": self = .cho
        case "chr": self = .chr
        case "chy": self = .chy
        case "ckb": self = .ckb
        case "co": self = .co
        case "cr": self = .cr
        case "cs": self = .cs
        case "csb": self = .csb
        case "cu": self = .cu
        case "cv": self = .cv
        case "cy": self = .cy
        case "da": self = .da
        case "de": self = .de
        case "diq": self = .diq
        case "dsb": self = .dsb
        case "dv": self = .dv
        case "dz": self = .dz
        case "ee": self = .ee
        case "el": self = .el
        case "en": self = .en
        case "eo": self = .eo
        case "es": self = .es
        case "et": self = .et
        case "eu": self = .eu
        case "ext": self = .ext
        case "fa": self = .fa
        case "ff": self = .ff
        case "fi": self = .fi
        case "fiu": self = .fiu
        case "fj": self = .fj
        case "fo": self = .fo
        case "fr": self = .fr
        case "frp": self = .frp
        case "fur": self = .fur
        case "fy": self = .fy
        case "ga": self = .ga
        case "gan": self = .gan
        case "gbm": self = .gbm
        case "gd": self = .gd
        case "gil": self = .gil
        case "gl": self = .gl
        case "gn": self = .gn
        case "got": self = .got
        case "gu": self = .gu
        case "gv": self = .gv
        case "ha": self = .ha
        case "hak": self = .hak
        case "haw": self = .haw
        case "he": self = .he
        case "hi": self = .hi
        case "ho": self = .ho
        case "hr": self = .hr
        case "ht": self = .ht
        case "hu": self = .hu
        case "hy": self = .hy
        case "hz": self = .hz
        case "ia": self = .ia
        case "id": self = .id
        case "ie": self = .ie
        case "ig": self = .ig
        case "ii": self = .ii
        case "ik": self = .ik
        case "ilo": self = .ilo
        case "inh": self = .inh
        case "io": self = .io
        case "is": self = .is
        case "it": self = .it
        case "iu": self = .iu
        case "ja": self = .ja
        case "jbo": self = .jbo
        case "jv": self = .jv
        case "ka": self = .ka
        case "kg": self = .kg
        case "ki": self = .ki
        case "kj": self = .kj
        case "kk": self = .kk
        case "kl": self = .kl
        case "km": self = .km
        case "kn": self = .kn
        case "khw": self = .khw
        case "ko": self = .ko
        case "kr": self = .kr
        case "ks": self = .ks
        case "ksh": self = .ksh
        case "ku": self = .ku
        case "kv": self = .kv
        case "kw": self = .kw
        case "ky": self = .ky
        case "la": self = .la
        case "lad": self = .lad
        case "lan": self = .lan
        case "lb": self = .lb
        case "lg": self = .lg
        case "li": self = .li
        case "lij": self = .lij
        case "lmo": self = .lmo
        case "ln": self = .ln
        case "lo": self = .lo
        case "lzz": self = .lzz
        case "lt": self = .lt
        case "lv": self = .lv
        case "map": self = .map
        case "mg": self = .mg
        case "man": self = .man
        case "mh": self = .mh
        case "mi": self = .mi
        case "min": self = .min
        case "mk": self = .mk
        case "ml": self = .ml
        case "mn": self = .mn
        case "mo": self = .mo
        case "mr": self = .mr
        case "mrh": self = .mrh
        case "ms": self = .ms
        case "mt": self = .mt
        case "mus": self = .mus
        case "mwl": self = .mwl
        case "my": self = .my
        case "na": self = .na
        case "nah": self = .nah
        case "nap": self = .nap
        case "nd": self = .nd
        case "nds": self = .nds
        case "ne": self = .ne
        case "new": self = .new
        case "ng": self = .ng
        case "nl": self = .nl
        case "nn": self = .nn
        case "no": self = .no
        case "nr": self = .nr
        case "nso": self = .nso
        case "nrm": self = .nrm
        case "nv": self = .nv
        case "ny": self = .ny
        case "oc": self = .oc
        case "oj": self = .oj
        case "om": self = .om
        case "or": self = .or
        case "os": self = .os
        case "pa": self = .pa
        case "pag": self = .pag
        case "pam": self = .pam
        case "pap": self = .pap
        case "pdc": self = .pdc
        case "pi": self = .pi
        case "pih": self = .pih
        case "pl": self = .pl
        case "pms": self = .pms
        case "ps": self = .ps
        case "pt": self = .pt
        case "qu": self = .qu
        case "rm": self = .rm
        case "rmy": self = .rmy
        case "rn": self = .rn
        case "ro": self = .ro
        case "roa": self = .roa
        case "ru": self = .ru
        case "rw": self = .rw
        case "sa": self = .sa
        case "sc": self = .sc
        case "scn": self = .scn
        case "sco": self = .sco
        case "sd": self = .sd
        case "se": self = .se
        case "sg": self = .sg
        case "sh": self = .sh
        case "si": self = .si
        case "sk": self = .sk
        case "sl": self = .sl
        case "sm": self = .sm
        case "sn": self = .sn
        case "so": self = .so
        case "sq": self = .sq
        case "sr": self = .sr
        case "ss": self = .ss
        case "st": self = .st
        case "su": self = .su
        case "sv": self = .sv
        case "sw": self = .sw
        case "ta": self = .ta
        case "te": self = .te
        case "tet": self = .tet
        case "tg": self = .tg
        case "th": self = .th
        case "ti": self = .ti
        case "tk": self = .tk
        case "tl": self = .tl
        case "tlh": self = .tlh
        case "tn": self = .tn
        case "to": self = .to
        case "tpi": self = .tpi
        case "tr": self = .tr
        case "ts": self = .ts
        case "tt": self = .tt
        case "tum": self = .tum
        case "tw": self = .tw
        case "ty": self = .ty
        case "udm": self = .udm
        case "ug": self = .ug
        case "uk": self = .uk
        case "ur": self = .ur
        case "uz": self = .uz
        case "uz_AF": self = .uzAf
        case "ve": self = .ve
        case "vi": self = .vi
        case "vec": self = .vec
        case "vls": self = .vls
        case "vo": self = .vo
        case "wa": self = .wa
        case "war": self = .war
        case "wo": self = .wo
        case "xal": self = .xal
        case "xh": self = .xh
        case "xmf": self = .xmf
        case "yi": self = .yi
        case "yo": self = .yo
        case "za": self = .za
        case "zh": self = .zh
        case "zu": self = .zu
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .bo: return "bo"
        case .aa: return "aa"
        case .ab: return "ab"
        case .af: return "af"
        case .ak: return "ak"
        case .als: return "als"
        case .am: return "am"
        case .an: return "an"
        case .ang: return "ang"
        case .ar: return "ar"
        case .arc: return "arc"
        case .as: return "as"
        case .ast: return "ast"
        case .av: return "av"
        case .awa: return "awa"
        case .ay: return "ay"
        case .az: return "az"
        case .ba: return "ba"
        case .bar: return "bar"
        case .bat: return "bat"
        case .bcl: return "bcl"
        case .be: return "be"
        case .bg: return "bg"
        case .bh: return "bh"
        case .bi: return "bi"
        case .bm: return "bm"
        case .bn: return "bn"
        case .bpy: return "bpy"
        case .br: return "br"
        case .bs: return "bs"
        case .bug: return "bug"
        case .bxr: return "bxr"
        case .ca: return "ca"
        case .cdo: return "cdo"
        case .ce: return "ce"
        case .ceb: return "ceb"
        case .ch: return "ch"
        case .cho: return "cho"
        case .chr: return "chr"
        case .chy: return "chy"
        case .ckb: return "ckb"
        case .co: return "co"
        case .cr: return "cr"
        case .cs: return "cs"
        case .csb: return "csb"
        case .cu: return "cu"
        case .cv: return "cv"
        case .cy: return "cy"
        case .da: return "da"
        case .de: return "de"
        case .diq: return "diq"
        case .dsb: return "dsb"
        case .dv: return "dv"
        case .dz: return "dz"
        case .ee: return "ee"
        case .el: return "el"
        case .en: return "en"
        case .eo: return "eo"
        case .es: return "es"
        case .et: return "et"
        case .eu: return "eu"
        case .ext: return "ext"
        case .fa: return "fa"
        case .ff: return "ff"
        case .fi: return "fi"
        case .fiu: return "fiu"
        case .fj: return "fj"
        case .fo: return "fo"
        case .fr: return "fr"
        case .frp: return "frp"
        case .fur: return "fur"
        case .fy: return "fy"
        case .ga: return "ga"
        case .gan: return "gan"
        case .gbm: return "gbm"
        case .gd: return "gd"
        case .gil: return "gil"
        case .gl: return "gl"
        case .gn: return "gn"
        case .got: return "got"
        case .gu: return "gu"
        case .gv: return "gv"
        case .ha: return "ha"
        case .hak: return "hak"
        case .haw: return "haw"
        case .he: return "he"
        case .hi: return "hi"
        case .ho: return "ho"
        case .hr: return "hr"
        case .ht: return "ht"
        case .hu: return "hu"
        case .hy: return "hy"
        case .hz: return "hz"
        case .ia: return "ia"
        case .id: return "id"
        case .ie: return "ie"
        case .ig: return "ig"
        case .ii: return "ii"
        case .ik: return "ik"
        case .ilo: return "ilo"
        case .inh: return "inh"
        case .io: return "io"
        case .is: return "is"
        case .it: return "it"
        case .iu: return "iu"
        case .ja: return "ja"
        case .jbo: return "jbo"
        case .jv: return "jv"
        case .ka: return "ka"
        case .kg: return "kg"
        case .ki: return "ki"
        case .kj: return "kj"
        case .kk: return "kk"
        case .kl: return "kl"
        case .km: return "km"
        case .kn: return "kn"
        case .khw: return "khw"
        case .ko: return "ko"
        case .kr: return "kr"
        case .ks: return "ks"
        case .ksh: return "ksh"
        case .ku: return "ku"
        case .kv: return "kv"
        case .kw: return "kw"
        case .ky: return "ky"
        case .la: return "la"
        case .lad: return "lad"
        case .lan: return "lan"
        case .lb: return "lb"
        case .lg: return "lg"
        case .li: return "li"
        case .lij: return "lij"
        case .lmo: return "lmo"
        case .ln: return "ln"
        case .lo: return "lo"
        case .lzz: return "lzz"
        case .lt: return "lt"
        case .lv: return "lv"
        case .map: return "map"
        case .mg: return "mg"
        case .man: return "man"
        case .mh: return "mh"
        case .mi: return "mi"
        case .min: return "min"
        case .mk: return "mk"
        case .ml: return "ml"
        case .mn: return "mn"
        case .mo: return "mo"
        case .mr: return "mr"
        case .mrh: return "mrh"
        case .ms: return "ms"
        case .mt: return "mt"
        case .mus: return "mus"
        case .mwl: return "mwl"
        case .my: return "my"
        case .na: return "na"
        case .nah: return "nah"
        case .nap: return "nap"
        case .nd: return "nd"
        case .nds: return "nds"
        case .ne: return "ne"
        case .new: return "new"
        case .ng: return "ng"
        case .nl: return "nl"
        case .nn: return "nn"
        case .no: return "no"
        case .nr: return "nr"
        case .nso: return "nso"
        case .nrm: return "nrm"
        case .nv: return "nv"
        case .ny: return "ny"
        case .oc: return "oc"
        case .oj: return "oj"
        case .om: return "om"
        case .or: return "or"
        case .os: return "os"
        case .pa: return "pa"
        case .pag: return "pag"
        case .pam: return "pam"
        case .pap: return "pap"
        case .pdc: return "pdc"
        case .pi: return "pi"
        case .pih: return "pih"
        case .pl: return "pl"
        case .pms: return "pms"
        case .ps: return "ps"
        case .pt: return "pt"
        case .qu: return "qu"
        case .rm: return "rm"
        case .rmy: return "rmy"
        case .rn: return "rn"
        case .ro: return "ro"
        case .roa: return "roa"
        case .ru: return "ru"
        case .rw: return "rw"
        case .sa: return "sa"
        case .sc: return "sc"
        case .scn: return "scn"
        case .sco: return "sco"
        case .sd: return "sd"
        case .se: return "se"
        case .sg: return "sg"
        case .sh: return "sh"
        case .si: return "si"
        case .sk: return "sk"
        case .sl: return "sl"
        case .sm: return "sm"
        case .sn: return "sn"
        case .so: return "so"
        case .sq: return "sq"
        case .sr: return "sr"
        case .ss: return "ss"
        case .st: return "st"
        case .su: return "su"
        case .sv: return "sv"
        case .sw: return "sw"
        case .ta: return "ta"
        case .te: return "te"
        case .tet: return "tet"
        case .tg: return "tg"
        case .th: return "th"
        case .ti: return "ti"
        case .tk: return "tk"
        case .tl: return "tl"
        case .tlh: return "tlh"
        case .tn: return "tn"
        case .to: return "to"
        case .tpi: return "tpi"
        case .tr: return "tr"
        case .ts: return "ts"
        case .tt: return "tt"
        case .tum: return "tum"
        case .tw: return "tw"
        case .ty: return "ty"
        case .udm: return "udm"
        case .ug: return "ug"
        case .uk: return "uk"
        case .ur: return "ur"
        case .uz: return "uz"
        case .uzAf: return "uz_AF"
        case .ve: return "ve"
        case .vi: return "vi"
        case .vec: return "vec"
        case .vls: return "vls"
        case .vo: return "vo"
        case .wa: return "wa"
        case .war: return "war"
        case .wo: return "wo"
        case .xal: return "xal"
        case .xh: return "xh"
        case .xmf: return "xmf"
        case .yi: return "yi"
        case .yo: return "yo"
        case .za: return "za"
        case .zh: return "zh"
        case .zu: return "zu"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: Language, rhs: Language) -> Bool {
      switch (lhs, rhs) {
        case (.bo, .bo): return true
        case (.aa, .aa): return true
        case (.ab, .ab): return true
        case (.af, .af): return true
        case (.ak, .ak): return true
        case (.als, .als): return true
        case (.am, .am): return true
        case (.an, .an): return true
        case (.ang, .ang): return true
        case (.ar, .ar): return true
        case (.arc, .arc): return true
        case (.as, .as): return true
        case (.ast, .ast): return true
        case (.av, .av): return true
        case (.awa, .awa): return true
        case (.ay, .ay): return true
        case (.az, .az): return true
        case (.ba, .ba): return true
        case (.bar, .bar): return true
        case (.bat, .bat): return true
        case (.bcl, .bcl): return true
        case (.be, .be): return true
        case (.bg, .bg): return true
        case (.bh, .bh): return true
        case (.bi, .bi): return true
        case (.bm, .bm): return true
        case (.bn, .bn): return true
        case (.bpy, .bpy): return true
        case (.br, .br): return true
        case (.bs, .bs): return true
        case (.bug, .bug): return true
        case (.bxr, .bxr): return true
        case (.ca, .ca): return true
        case (.cdo, .cdo): return true
        case (.ce, .ce): return true
        case (.ceb, .ceb): return true
        case (.ch, .ch): return true
        case (.cho, .cho): return true
        case (.chr, .chr): return true
        case (.chy, .chy): return true
        case (.ckb, .ckb): return true
        case (.co, .co): return true
        case (.cr, .cr): return true
        case (.cs, .cs): return true
        case (.csb, .csb): return true
        case (.cu, .cu): return true
        case (.cv, .cv): return true
        case (.cy, .cy): return true
        case (.da, .da): return true
        case (.de, .de): return true
        case (.diq, .diq): return true
        case (.dsb, .dsb): return true
        case (.dv, .dv): return true
        case (.dz, .dz): return true
        case (.ee, .ee): return true
        case (.el, .el): return true
        case (.en, .en): return true
        case (.eo, .eo): return true
        case (.es, .es): return true
        case (.et, .et): return true
        case (.eu, .eu): return true
        case (.ext, .ext): return true
        case (.fa, .fa): return true
        case (.ff, .ff): return true
        case (.fi, .fi): return true
        case (.fiu, .fiu): return true
        case (.fj, .fj): return true
        case (.fo, .fo): return true
        case (.fr, .fr): return true
        case (.frp, .frp): return true
        case (.fur, .fur): return true
        case (.fy, .fy): return true
        case (.ga, .ga): return true
        case (.gan, .gan): return true
        case (.gbm, .gbm): return true
        case (.gd, .gd): return true
        case (.gil, .gil): return true
        case (.gl, .gl): return true
        case (.gn, .gn): return true
        case (.got, .got): return true
        case (.gu, .gu): return true
        case (.gv, .gv): return true
        case (.ha, .ha): return true
        case (.hak, .hak): return true
        case (.haw, .haw): return true
        case (.he, .he): return true
        case (.hi, .hi): return true
        case (.ho, .ho): return true
        case (.hr, .hr): return true
        case (.ht, .ht): return true
        case (.hu, .hu): return true
        case (.hy, .hy): return true
        case (.hz, .hz): return true
        case (.ia, .ia): return true
        case (.id, .id): return true
        case (.ie, .ie): return true
        case (.ig, .ig): return true
        case (.ii, .ii): return true
        case (.ik, .ik): return true
        case (.ilo, .ilo): return true
        case (.inh, .inh): return true
        case (.io, .io): return true
        case (.is, .is): return true
        case (.it, .it): return true
        case (.iu, .iu): return true
        case (.ja, .ja): return true
        case (.jbo, .jbo): return true
        case (.jv, .jv): return true
        case (.ka, .ka): return true
        case (.kg, .kg): return true
        case (.ki, .ki): return true
        case (.kj, .kj): return true
        case (.kk, .kk): return true
        case (.kl, .kl): return true
        case (.km, .km): return true
        case (.kn, .kn): return true
        case (.khw, .khw): return true
        case (.ko, .ko): return true
        case (.kr, .kr): return true
        case (.ks, .ks): return true
        case (.ksh, .ksh): return true
        case (.ku, .ku): return true
        case (.kv, .kv): return true
        case (.kw, .kw): return true
        case (.ky, .ky): return true
        case (.la, .la): return true
        case (.lad, .lad): return true
        case (.lan, .lan): return true
        case (.lb, .lb): return true
        case (.lg, .lg): return true
        case (.li, .li): return true
        case (.lij, .lij): return true
        case (.lmo, .lmo): return true
        case (.ln, .ln): return true
        case (.lo, .lo): return true
        case (.lzz, .lzz): return true
        case (.lt, .lt): return true
        case (.lv, .lv): return true
        case (.map, .map): return true
        case (.mg, .mg): return true
        case (.man, .man): return true
        case (.mh, .mh): return true
        case (.mi, .mi): return true
        case (.min, .min): return true
        case (.mk, .mk): return true
        case (.ml, .ml): return true
        case (.mn, .mn): return true
        case (.mo, .mo): return true
        case (.mr, .mr): return true
        case (.mrh, .mrh): return true
        case (.ms, .ms): return true
        case (.mt, .mt): return true
        case (.mus, .mus): return true
        case (.mwl, .mwl): return true
        case (.my, .my): return true
        case (.na, .na): return true
        case (.nah, .nah): return true
        case (.nap, .nap): return true
        case (.nd, .nd): return true
        case (.nds, .nds): return true
        case (.ne, .ne): return true
        case (.new, .new): return true
        case (.ng, .ng): return true
        case (.nl, .nl): return true
        case (.nn, .nn): return true
        case (.no, .no): return true
        case (.nr, .nr): return true
        case (.nso, .nso): return true
        case (.nrm, .nrm): return true
        case (.nv, .nv): return true
        case (.ny, .ny): return true
        case (.oc, .oc): return true
        case (.oj, .oj): return true
        case (.om, .om): return true
        case (.or, .or): return true
        case (.os, .os): return true
        case (.pa, .pa): return true
        case (.pag, .pag): return true
        case (.pam, .pam): return true
        case (.pap, .pap): return true
        case (.pdc, .pdc): return true
        case (.pi, .pi): return true
        case (.pih, .pih): return true
        case (.pl, .pl): return true
        case (.pms, .pms): return true
        case (.ps, .ps): return true
        case (.pt, .pt): return true
        case (.qu, .qu): return true
        case (.rm, .rm): return true
        case (.rmy, .rmy): return true
        case (.rn, .rn): return true
        case (.ro, .ro): return true
        case (.roa, .roa): return true
        case (.ru, .ru): return true
        case (.rw, .rw): return true
        case (.sa, .sa): return true
        case (.sc, .sc): return true
        case (.scn, .scn): return true
        case (.sco, .sco): return true
        case (.sd, .sd): return true
        case (.se, .se): return true
        case (.sg, .sg): return true
        case (.sh, .sh): return true
        case (.si, .si): return true
        case (.sk, .sk): return true
        case (.sl, .sl): return true
        case (.sm, .sm): return true
        case (.sn, .sn): return true
        case (.so, .so): return true
        case (.sq, .sq): return true
        case (.sr, .sr): return true
        case (.ss, .ss): return true
        case (.st, .st): return true
        case (.su, .su): return true
        case (.sv, .sv): return true
        case (.sw, .sw): return true
        case (.ta, .ta): return true
        case (.te, .te): return true
        case (.tet, .tet): return true
        case (.tg, .tg): return true
        case (.th, .th): return true
        case (.ti, .ti): return true
        case (.tk, .tk): return true
        case (.tl, .tl): return true
        case (.tlh, .tlh): return true
        case (.tn, .tn): return true
        case (.to, .to): return true
        case (.tpi, .tpi): return true
        case (.tr, .tr): return true
        case (.ts, .ts): return true
        case (.tt, .tt): return true
        case (.tum, .tum): return true
        case (.tw, .tw): return true
        case (.ty, .ty): return true
        case (.udm, .udm): return true
        case (.ug, .ug): return true
        case (.uk, .uk): return true
        case (.ur, .ur): return true
        case (.uz, .uz): return true
        case (.uzAf, .uzAf): return true
        case (.ve, .ve): return true
        case (.vi, .vi): return true
        case (.vec, .vec): return true
        case (.vls, .vls): return true
        case (.vo, .vo): return true
        case (.wa, .wa): return true
        case (.war, .war): return true
        case (.wo, .wo): return true
        case (.xal, .xal): return true
        case (.xh, .xh): return true
        case (.xmf, .xmf): return true
        case (.yi, .yi): return true
        case (.yo, .yo): return true
        case (.za, .za): return true
        case (.zh, .zh): return true
        case (.zu, .zu): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [Language] {
      return [
        .bo,
        .aa,
        .ab,
        .af,
        .ak,
        .als,
        .am,
        .an,
        .ang,
        .ar,
        .arc,
        .as,
        .ast,
        .av,
        .awa,
        .ay,
        .az,
        .ba,
        .bar,
        .bat,
        .bcl,
        .be,
        .bg,
        .bh,
        .bi,
        .bm,
        .bn,
        .bpy,
        .br,
        .bs,
        .bug,
        .bxr,
        .ca,
        .cdo,
        .ce,
        .ceb,
        .ch,
        .cho,
        .chr,
        .chy,
        .ckb,
        .co,
        .cr,
        .cs,
        .csb,
        .cu,
        .cv,
        .cy,
        .da,
        .de,
        .diq,
        .dsb,
        .dv,
        .dz,
        .ee,
        .el,
        .en,
        .eo,
        .es,
        .et,
        .eu,
        .ext,
        .fa,
        .ff,
        .fi,
        .fiu,
        .fj,
        .fo,
        .fr,
        .frp,
        .fur,
        .fy,
        .ga,
        .gan,
        .gbm,
        .gd,
        .gil,
        .gl,
        .gn,
        .got,
        .gu,
        .gv,
        .ha,
        .hak,
        .haw,
        .he,
        .hi,
        .ho,
        .hr,
        .ht,
        .hu,
        .hy,
        .hz,
        .ia,
        .id,
        .ie,
        .ig,
        .ii,
        .ik,
        .ilo,
        .inh,
        .io,
        .is,
        .it,
        .iu,
        .ja,
        .jbo,
        .jv,
        .ka,
        .kg,
        .ki,
        .kj,
        .kk,
        .kl,
        .km,
        .kn,
        .khw,
        .ko,
        .kr,
        .ks,
        .ksh,
        .ku,
        .kv,
        .kw,
        .ky,
        .la,
        .lad,
        .lan,
        .lb,
        .lg,
        .li,
        .lij,
        .lmo,
        .ln,
        .lo,
        .lzz,
        .lt,
        .lv,
        .map,
        .mg,
        .man,
        .mh,
        .mi,
        .min,
        .mk,
        .ml,
        .mn,
        .mo,
        .mr,
        .mrh,
        .ms,
        .mt,
        .mus,
        .mwl,
        .my,
        .na,
        .nah,
        .nap,
        .nd,
        .nds,
        .ne,
        .new,
        .ng,
        .nl,
        .nn,
        .no,
        .nr,
        .nso,
        .nrm,
        .nv,
        .ny,
        .oc,
        .oj,
        .om,
        .or,
        .os,
        .pa,
        .pag,
        .pam,
        .pap,
        .pdc,
        .pi,
        .pih,
        .pl,
        .pms,
        .ps,
        .pt,
        .qu,
        .rm,
        .rmy,
        .rn,
        .ro,
        .roa,
        .ru,
        .rw,
        .sa,
        .sc,
        .scn,
        .sco,
        .sd,
        .se,
        .sg,
        .sh,
        .si,
        .sk,
        .sl,
        .sm,
        .sn,
        .so,
        .sq,
        .sr,
        .ss,
        .st,
        .su,
        .sv,
        .sw,
        .ta,
        .te,
        .tet,
        .tg,
        .th,
        .ti,
        .tk,
        .tl,
        .tlh,
        .tn,
        .to,
        .tpi,
        .tr,
        .ts,
        .tt,
        .tum,
        .tw,
        .ty,
        .udm,
        .ug,
        .uk,
        .ur,
        .uz,
        .uzAf,
        .ve,
        .vi,
        .vec,
        .vls,
        .vo,
        .wa,
        .war,
        .wo,
        .xal,
        .xh,
        .xmf,
        .yi,
        .yo,
        .za,
        .zh,
        .zu,
      ]
    }
  }

  public enum ScreenType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case discover
    case shop
    case events
    case wallet
    case booking
    case lineup
    case social
    case generic
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "discover": self = .discover
        case "shop": self = .shop
        case "events": self = .events
        case "wallet": self = .wallet
        case "booking": self = .booking
        case "lineup": self = .lineup
        case "social": self = .social
        case "generic": self = .generic
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .discover: return "discover"
        case .shop: return "shop"
        case .events: return "events"
        case .wallet: return "wallet"
        case .booking: return "booking"
        case .lineup: return "lineup"
        case .social: return "social"
        case .generic: return "generic"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: ScreenType, rhs: ScreenType) -> Bool {
      switch (lhs, rhs) {
        case (.discover, .discover): return true
        case (.shop, .shop): return true
        case (.events, .events): return true
        case (.wallet, .wallet): return true
        case (.booking, .booking): return true
        case (.lineup, .lineup): return true
        case (.social, .social): return true
        case (.generic, .generic): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [ScreenType] {
      return [
        .discover,
        .shop,
        .events,
        .wallet,
        .booking,
        .lineup,
        .social,
        .generic,
      ]
    }
  }

  public enum WebPageType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case audioGuidesHelp
    case tAndC
    case privacy
    case about
    case aboutCompany
    case important
    case info
    case times
    case event
    case welcome
    case travel
    case faq
    case food
    case program
    case social
    case menu
    case legal
    case quizHelp
    case quizTerms
    case quizWinner
    case ntpTerms
    case purchasesHelp
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "audioGuidesHelp": self = .audioGuidesHelp
        case "tAndC": self = .tAndC
        case "privacy": self = .privacy
        case "about": self = .about
        case "aboutCompany": self = .aboutCompany
        case "important": self = .important
        case "info": self = .info
        case "times": self = .times
        case "event": self = .event
        case "welcome": self = .welcome
        case "travel": self = .travel
        case "faq": self = .faq
        case "food": self = .food
        case "program": self = .program
        case "social": self = .social
        case "menu": self = .menu
        case "legal": self = .legal
        case "quizHelp": self = .quizHelp
        case "quizTerms": self = .quizTerms
        case "quizWinner": self = .quizWinner
        case "ntpTerms": self = .ntpTerms
        case "purchasesHelp": self = .purchasesHelp
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .audioGuidesHelp: return "audioGuidesHelp"
        case .tAndC: return "tAndC"
        case .privacy: return "privacy"
        case .about: return "about"
        case .aboutCompany: return "aboutCompany"
        case .important: return "important"
        case .info: return "info"
        case .times: return "times"
        case .event: return "event"
        case .welcome: return "welcome"
        case .travel: return "travel"
        case .faq: return "faq"
        case .food: return "food"
        case .program: return "program"
        case .social: return "social"
        case .menu: return "menu"
        case .legal: return "legal"
        case .quizHelp: return "quizHelp"
        case .quizTerms: return "quizTerms"
        case .quizWinner: return "quizWinner"
        case .ntpTerms: return "ntpTerms"
        case .purchasesHelp: return "purchasesHelp"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WebPageType, rhs: WebPageType) -> Bool {
      switch (lhs, rhs) {
        case (.audioGuidesHelp, .audioGuidesHelp): return true
        case (.tAndC, .tAndC): return true
        case (.privacy, .privacy): return true
        case (.about, .about): return true
        case (.aboutCompany, .aboutCompany): return true
        case (.important, .important): return true
        case (.info, .info): return true
        case (.times, .times): return true
        case (.event, .event): return true
        case (.welcome, .welcome): return true
        case (.travel, .travel): return true
        case (.faq, .faq): return true
        case (.food, .food): return true
        case (.program, .program): return true
        case (.social, .social): return true
        case (.menu, .menu): return true
        case (.legal, .legal): return true
        case (.quizHelp, .quizHelp): return true
        case (.quizTerms, .quizTerms): return true
        case (.quizWinner, .quizWinner): return true
        case (.ntpTerms, .ntpTerms): return true
        case (.purchasesHelp, .purchasesHelp): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WebPageType] {
      return [
        .audioGuidesHelp,
        .tAndC,
        .privacy,
        .about,
        .aboutCompany,
        .important,
        .info,
        .times,
        .event,
        .welcome,
        .travel,
        .faq,
        .food,
        .program,
        .social,
        .menu,
        .legal,
        .quizHelp,
        .quizTerms,
        .quizWinner,
        .ntpTerms,
        .purchasesHelp,
      ]
    }
  }

  public struct PaymentSourceInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - id
    ///   - billingDetails
    ///   - card
    public init(id: Swift.Optional<GraphQLID?> = nil, billingDetails: Swift.Optional<PaymentSourceBillingDetailsInput?> = nil, card: Swift.Optional<CardInput?> = nil) {
      graphQLMap = ["id": id, "billingDetails": billingDetails, "card": card]
    }

    public var id: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "id")
      }
    }

    public var billingDetails: Swift.Optional<PaymentSourceBillingDetailsInput?> {
      get {
        return graphQLMap["billingDetails"] as? Swift.Optional<PaymentSourceBillingDetailsInput?> ?? Swift.Optional<PaymentSourceBillingDetailsInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "billingDetails")
      }
    }

    public var card: Swift.Optional<CardInput?> {
      get {
        return graphQLMap["card"] as? Swift.Optional<CardInput?> ?? Swift.Optional<CardInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "card")
      }
    }
  }

  public struct PaymentSourceBillingDetailsInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - address
    ///   - email
    ///   - name
    ///   - phone
    public init(address: Swift.Optional<PaymentSourceAddressInput?> = nil, email: Swift.Optional<String?> = nil, name: Swift.Optional<String?> = nil, phone: Swift.Optional<String?> = nil) {
      graphQLMap = ["address": address, "email": email, "name": name, "phone": phone]
    }

    public var address: Swift.Optional<PaymentSourceAddressInput?> {
      get {
        return graphQLMap["address"] as? Swift.Optional<PaymentSourceAddressInput?> ?? Swift.Optional<PaymentSourceAddressInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "address")
      }
    }

    public var email: Swift.Optional<String?> {
      get {
        return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "email")
      }
    }

    public var name: Swift.Optional<String?> {
      get {
        return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "name")
      }
    }

    public var phone: Swift.Optional<String?> {
      get {
        return graphQLMap["phone"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "phone")
      }
    }
  }

  public struct PaymentSourceAddressInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - city
    ///   - country
    ///   - line1
    ///   - line2
    ///   - postalCode
    ///   - state
    public init(city: Swift.Optional<String?> = nil, country: Swift.Optional<String?> = nil, line1: Swift.Optional<String?> = nil, line2: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, state: Swift.Optional<String?> = nil) {
      graphQLMap = ["city": city, "country": country, "line1": line1, "line2": line2, "postalCode": postalCode, "state": state]
    }

    public var city: Swift.Optional<String?> {
      get {
        return graphQLMap["city"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "city")
      }
    }

    public var country: Swift.Optional<String?> {
      get {
        return graphQLMap["country"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "country")
      }
    }

    public var line1: Swift.Optional<String?> {
      get {
        return graphQLMap["line1"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "line1")
      }
    }

    public var line2: Swift.Optional<String?> {
      get {
        return graphQLMap["line2"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "line2")
      }
    }

    public var postalCode: Swift.Optional<String?> {
      get {
        return graphQLMap["postalCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "postalCode")
      }
    }

    public var state: Swift.Optional<String?> {
      get {
        return graphQLMap["state"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "state")
      }
    }
  }

  public struct CardInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - brand
    ///   - numberToken
    ///   - expMonth
    ///   - expYear
    ///   - securityCodeToken
    ///   - last4
    public init(brand: String, numberToken: String, expMonth: String, expYear: String, securityCodeToken: String, last4: String) {
      graphQLMap = ["brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "securityCodeToken": securityCodeToken, "last4": last4]
    }

    public var brand: String {
      get {
        return graphQLMap["brand"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "brand")
      }
    }

    public var numberToken: String {
      get {
        return graphQLMap["numberToken"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "numberToken")
      }
    }

    public var expMonth: String {
      get {
        return graphQLMap["expMonth"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "expMonth")
      }
    }

    public var expYear: String {
      get {
        return graphQLMap["expYear"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "expYear")
      }
    }

    public var securityCodeToken: String {
      get {
        return graphQLMap["securityCodeToken"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "securityCodeToken")
      }
    }

    public var last4: String {
      get {
        return graphQLMap["last4"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "last4")
      }
    }
  }

  public struct CheckoutInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - netAmount
    ///   - language
    public init(netAmount: Swift.Optional<Int?> = nil, language: Swift.Optional<Language?> = nil) {
      graphQLMap = ["netAmount": netAmount, "language": language]
    }

    public var netAmount: Swift.Optional<Int?> {
      get {
        return graphQLMap["netAmount"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "netAmount")
      }
    }

    public var language: Swift.Optional<Language?> {
      get {
        return graphQLMap["language"] as? Swift.Optional<Language?> ?? Swift.Optional<Language?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "language")
      }
    }
  }

  public struct BasketInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - collectionDate
    ///   - collectionPreferenceType
    ///   - timeslot
    ///   - fulfilmentPoint
    ///   - seatInfo
    ///   - items
    public init(collectionDate: Swift.Optional<String?> = nil, collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> = nil, timeslot: Swift.Optional<GraphQLID?> = nil, fulfilmentPoint: GraphQLID, seatInfo: Swift.Optional<JSON?> = nil, items: [BasketItemInput?]) {
      graphQLMap = ["collectionDate": collectionDate, "collectionPreferenceType": collectionPreferenceType, "timeslot": timeslot, "fulfilmentPoint": fulfilmentPoint, "seatInfo": seatInfo, "items": items]
    }

    public var collectionDate: Swift.Optional<String?> {
      get {
        return graphQLMap["collectionDate"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionDate")
      }
    }

    public var collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> {
      get {
        return graphQLMap["collectionPreferenceType"] as? Swift.Optional<CollectionPreferenceType?> ?? Swift.Optional<CollectionPreferenceType?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var timeslot: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["timeslot"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "timeslot")
      }
    }

    public var fulfilmentPoint: GraphQLID {
      get {
        return graphQLMap["fulfilmentPoint"] as! GraphQLID
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoint")
      }
    }

    public var seatInfo: Swift.Optional<JSON?> {
      get {
        return graphQLMap["seatInfo"] as? Swift.Optional<JSON?> ?? Swift.Optional<JSON?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "seatInfo")
      }
    }

    public var items: [BasketItemInput?] {
      get {
        return graphQLMap["items"] as! [BasketItemInput?]
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "items")
      }
    }
  }

  public enum CollectionPreferenceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case checkin
    case asap
    case preorder
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "CHECKIN": self = .checkin
        case "ASAP": self = .asap
        case "PREORDER": self = .preorder
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .checkin: return "CHECKIN"
        case .asap: return "ASAP"
        case .preorder: return "PREORDER"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CollectionPreferenceType, rhs: CollectionPreferenceType) -> Bool {
      switch (lhs, rhs) {
        case (.checkin, .checkin): return true
        case (.asap, .asap): return true
        case (.preorder, .preorder): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [CollectionPreferenceType] {
      return [
        .checkin,
        .asap,
        .preorder,
      ]
    }
  }

  public struct BasketItemInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - product
    ///   - productVariant
    ///   - fulfilmentPoint
    ///   - quantity
    ///   - productModifierItems
    public init(product: Swift.Optional<GraphQLID?> = nil, productVariant: Swift.Optional<GraphQLID?> = nil, fulfilmentPoint: Swift.Optional<GraphQLID?> = nil, quantity: Swift.Optional<Int?> = nil, productModifierItems: Swift.Optional<[ProductModifierItemSelectionInput?]?> = nil) {
      graphQLMap = ["product": product, "productVariant": productVariant, "fulfilmentPoint": fulfilmentPoint, "quantity": quantity, "productModifierItems": productModifierItems]
    }

    public var product: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["product"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "product")
      }
    }

    public var productVariant: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["productVariant"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productVariant")
      }
    }

    public var fulfilmentPoint: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["fulfilmentPoint"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoint")
      }
    }

    public var quantity: Swift.Optional<Int?> {
      get {
        return graphQLMap["quantity"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "quantity")
      }
    }

    public var productModifierItems: Swift.Optional<[ProductModifierItemSelectionInput?]?> {
      get {
        return graphQLMap["productModifierItems"] as? Swift.Optional<[ProductModifierItemSelectionInput?]?> ?? Swift.Optional<[ProductModifierItemSelectionInput?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productModifierItems")
      }
    }
  }

  public struct ProductModifierItemSelectionInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - productModifierItemId
    ///   - quantity
    public init(productModifierItemId: Swift.Optional<GraphQLID?> = nil, quantity: Swift.Optional<Int?> = nil) {
      graphQLMap = ["productModifierItemId": productModifierItemId, "quantity": quantity]
    }

    public var productModifierItemId: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["productModifierItemId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "productModifierItemId")
      }
    }

    public var quantity: Swift.Optional<Int?> {
      get {
        return graphQLMap["quantity"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "quantity")
      }
    }
  }

  public struct PaymentIntentInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - orderType
    ///   - orderId
    ///   - paymentSource
    ///   - amount
    ///   - currency
    ///   - savePaymentSource
    ///   - livemode
    ///   - cancellationReason
    ///   - receiptEmail
    public init(orderType: OrderType, orderId: GraphQLID, paymentSource: Swift.Optional<PaymentSourceInput?> = nil, amount: Int, currency: String, savePaymentSource: Bool, livemode: Bool, cancellationReason: Swift.Optional<CancellationReason?> = nil, receiptEmail: Swift.Optional<String?> = nil) {
      graphQLMap = ["orderType": orderType, "orderId": orderId, "paymentSource": paymentSource, "amount": amount, "currency": currency, "savePaymentSource": savePaymentSource, "livemode": livemode, "cancellationReason": cancellationReason, "receiptEmail": receiptEmail]
    }

    public var orderType: OrderType {
      get {
        return graphQLMap["orderType"] as! OrderType
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "orderType")
      }
    }

    public var orderId: GraphQLID {
      get {
        return graphQLMap["orderId"] as! GraphQLID
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "orderId")
      }
    }

    public var paymentSource: Swift.Optional<PaymentSourceInput?> {
      get {
        return graphQLMap["paymentSource"] as? Swift.Optional<PaymentSourceInput?> ?? Swift.Optional<PaymentSourceInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "paymentSource")
      }
    }

    public var amount: Int {
      get {
        return graphQLMap["amount"] as! Int
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "amount")
      }
    }

    public var currency: String {
      get {
        return graphQLMap["currency"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "currency")
      }
    }

    public var savePaymentSource: Bool {
      get {
        return graphQLMap["savePaymentSource"] as! Bool
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }

    public var livemode: Bool {
      get {
        return graphQLMap["livemode"] as! Bool
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "livemode")
      }
    }

    public var cancellationReason: Swift.Optional<CancellationReason?> {
      get {
        return graphQLMap["cancellationReason"] as? Swift.Optional<CancellationReason?> ?? Swift.Optional<CancellationReason?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "cancellationReason")
      }
    }

    public var receiptEmail: Swift.Optional<String?> {
      get {
        return graphQLMap["receiptEmail"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "receiptEmail")
      }
    }
  }

  public enum OrderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case foodAndBeverage
    case ticket
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "food_and_beverage": self = .foodAndBeverage
        case "ticket": self = .ticket
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .foodAndBeverage: return "food_and_beverage"
        case .ticket: return "ticket"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: OrderType, rhs: OrderType) -> Bool {
      switch (lhs, rhs) {
        case (.foodAndBeverage, .foodAndBeverage): return true
        case (.ticket, .ticket): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [OrderType] {
      return [
        .foodAndBeverage,
        .ticket,
      ]
    }
  }

  public enum CancellationReason: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case duplicate
    case fraudulent
    case requestedByCustomer
    case abandoned
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "duplicate": self = .duplicate
        case "fraudulent": self = .fraudulent
        case "requested_by_customer": self = .requestedByCustomer
        case "abandoned": self = .abandoned
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .duplicate: return "duplicate"
        case .fraudulent: return "fraudulent"
        case .requestedByCustomer: return "requested_by_customer"
        case .abandoned: return "abandoned"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: CancellationReason, rhs: CancellationReason) -> Bool {
      switch (lhs, rhs) {
        case (.duplicate, .duplicate): return true
        case (.fraudulent, .fraudulent): return true
        case (.requestedByCustomer, .requestedByCustomer): return true
        case (.abandoned, .abandoned): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [CancellationReason] {
      return [
        .duplicate,
        .fraudulent,
        .requestedByCustomer,
        .abandoned,
      ]
    }
  }

  public struct FilterParam: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - key
    ///   - value
    public init(key: Swift.Optional<String?> = nil, value: String) {
      graphQLMap = ["key": key, "value": value]
    }

    public var key: Swift.Optional<String?> {
      get {
        return graphQLMap["key"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "key")
      }
    }

    public var value: String {
      get {
        return graphQLMap["value"] as! String
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "value")
      }
    }
  }

  public struct FulfilmentPointFilter: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - categories
    public init(categories: Swift.Optional<[GraphQLID]?> = nil) {
      graphQLMap = ["categories": categories]
    }

    public var categories: Swift.Optional<[GraphQLID]?> {
      get {
        return graphQLMap["categories"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "categories")
      }
    }
  }

  public struct ProductFilter: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - fulfilmentPoints
    ///   - categories
    public init(fulfilmentPoints: Swift.Optional<[GraphQLID?]?> = nil, categories: Swift.Optional<[GraphQLID?]?> = nil) {
      graphQLMap = ["fulfilmentPoints": fulfilmentPoints, "categories": categories]
    }

    public var fulfilmentPoints: Swift.Optional<[GraphQLID?]?> {
      get {
        return graphQLMap["fulfilmentPoints"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "fulfilmentPoints")
      }
    }

    public var categories: Swift.Optional<[GraphQLID?]?> {
      get {
        return graphQLMap["categories"] as? Swift.Optional<[GraphQLID?]?> ?? Swift.Optional<[GraphQLID?]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "categories")
      }
    }
  }

  public struct OrderUpdateInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - status
    ///   - collectionPreferenceType
    ///   - checkInTime
    public init(status: Swift.Optional<String?> = nil, collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> = nil, checkInTime: Swift.Optional<String?> = nil) {
      graphQLMap = ["status": status, "collectionPreferenceType": collectionPreferenceType, "checkInTime": checkInTime]
    }

    public var status: Swift.Optional<String?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }

    public var collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> {
      get {
        return graphQLMap["collectionPreferenceType"] as? Swift.Optional<CollectionPreferenceType?> ?? Swift.Optional<CollectionPreferenceType?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var checkInTime: Swift.Optional<String?> {
      get {
        return graphQLMap["checkInTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "checkInTime")
      }
    }
  }

  public struct PaymentIntentUpdateInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - status
    ///   - paymentSource
    ///   - savePaymentSource
    public init(status: Swift.Optional<UpdatePaymentStatus?> = nil, paymentSource: Swift.Optional<PaymentSourceInput?> = nil, savePaymentSource: Swift.Optional<Bool?> = nil) {
      graphQLMap = ["status": status, "paymentSource": paymentSource, "savePaymentSource": savePaymentSource]
    }

    public var status: Swift.Optional<UpdatePaymentStatus?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<UpdatePaymentStatus?> ?? Swift.Optional<UpdatePaymentStatus?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }

    public var paymentSource: Swift.Optional<PaymentSourceInput?> {
      get {
        return graphQLMap["paymentSource"] as? Swift.Optional<PaymentSourceInput?> ?? Swift.Optional<PaymentSourceInput?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "paymentSource")
      }
    }

    public var savePaymentSource: Swift.Optional<Bool?> {
      get {
        return graphQLMap["savePaymentSource"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }
  }

  public enum UpdatePaymentStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case canceled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "canceled": self = .canceled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .canceled: return "canceled"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: UpdatePaymentStatus, rhs: UpdatePaymentStatus) -> Bool {
      switch (lhs, rhs) {
        case (.canceled, .canceled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [UpdatePaymentStatus] {
      return [
        .canceled,
      ]
    }
  }

  public enum StyleType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case pager
    case carousel
    case list
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "PAGER": self = .pager
        case "CAROUSEL": self = .carousel
        case "LIST": self = .list
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .pager: return "PAGER"
        case .carousel: return "CAROUSEL"
        case .list: return "LIST"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: StyleType, rhs: StyleType) -> Bool {
      switch (lhs, rhs) {
        case (.pager, .pager): return true
        case (.carousel, .carousel): return true
        case (.list, .list): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [StyleType] {
      return [
        .pager,
        .carousel,
        .list,
      ]
    }
  }

  public enum StyleSize: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case small
    case medium
    case large
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "SMALL": self = .small
        case "MEDIUM": self = .medium
        case "LARGE": self = .large
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .small: return "SMALL"
        case .medium: return "MEDIUM"
        case .large: return "LARGE"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: StyleSize, rhs: StyleSize) -> Bool {
      switch (lhs, rhs) {
        case (.small, .small): return true
        case (.medium, .medium): return true
        case (.large, .large): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [StyleSize] {
      return [
        .small,
        .medium,
        .large,
      ]
    }
  }

  public enum WidgetType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case product
    case button
    case banner
    case event
    case fixture
    case countdownClock
    case galleryCoverImage
    case news
    case ticket
    case ticketProduct
    case fulfilmentPoint
    case socialPost
    case fulfilmentPointCategorySelector
    case selectedEvent
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "Product": self = .product
        case "Button": self = .button
        case "Banner": self = .banner
        case "Event": self = .event
        case "Fixture": self = .fixture
        case "CountdownClock": self = .countdownClock
        case "GalleryCoverImage": self = .galleryCoverImage
        case "News": self = .news
        case "Ticket": self = .ticket
        case "TicketProduct": self = .ticketProduct
        case "FulfilmentPoint": self = .fulfilmentPoint
        case "SocialPost": self = .socialPost
        case "FulfilmentPointCategorySelector": self = .fulfilmentPointCategorySelector
        case "SelectedEvent": self = .selectedEvent
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .product: return "Product"
        case .button: return "Button"
        case .banner: return "Banner"
        case .event: return "Event"
        case .fixture: return "Fixture"
        case .countdownClock: return "CountdownClock"
        case .galleryCoverImage: return "GalleryCoverImage"
        case .news: return "News"
        case .ticket: return "Ticket"
        case .ticketProduct: return "TicketProduct"
        case .fulfilmentPoint: return "FulfilmentPoint"
        case .socialPost: return "SocialPost"
        case .fulfilmentPointCategorySelector: return "FulfilmentPointCategorySelector"
        case .selectedEvent: return "SelectedEvent"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WidgetType, rhs: WidgetType) -> Bool {
      switch (lhs, rhs) {
        case (.product, .product): return true
        case (.button, .button): return true
        case (.banner, .banner): return true
        case (.event, .event): return true
        case (.fixture, .fixture): return true
        case (.countdownClock, .countdownClock): return true
        case (.galleryCoverImage, .galleryCoverImage): return true
        case (.news, .news): return true
        case (.ticket, .ticket): return true
        case (.ticketProduct, .ticketProduct): return true
        case (.fulfilmentPoint, .fulfilmentPoint): return true
        case (.socialPost, .socialPost): return true
        case (.fulfilmentPointCategorySelector, .fulfilmentPointCategorySelector): return true
        case (.selectedEvent, .selectedEvent): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WidgetType] {
      return [
        .product,
        .button,
        .banner,
        .event,
        .fixture,
        .countdownClock,
        .galleryCoverImage,
        .news,
        .ticket,
        .ticketProduct,
        .fulfilmentPoint,
        .socialPost,
        .fulfilmentPointCategorySelector,
        .selectedEvent,
      ]
    }
  }

  public enum WidgetFetchType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case featured
    case feed
    case `static`
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "featured": self = .featured
        case "feed": self = .feed
        case "static": self = .static
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .featured: return "featured"
        case .feed: return "feed"
        case .static: return "static"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: WidgetFetchType, rhs: WidgetFetchType) -> Bool {
      switch (lhs, rhs) {
        case (.featured, .featured): return true
        case (.feed, .feed): return true
        case (.static, .static): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [WidgetFetchType] {
      return [
        .featured,
        .feed,
        .static,
      ]
    }
  }

  public enum FulfilmentPointType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case homeDelivery
    case collection
    case seatDelivery
    case digitalRedemption
    case virtualQueue
    case collectWhenReady
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "HOME_DELIVERY": self = .homeDelivery
        case "COLLECTION": self = .collection
        case "SEAT_DELIVERY": self = .seatDelivery
        case "DIGITAL_REDEMPTION": self = .digitalRedemption
        case "VIRTUAL_QUEUE": self = .virtualQueue
        case "COLLECT_WHEN_READY": self = .collectWhenReady
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .homeDelivery: return "HOME_DELIVERY"
        case .collection: return "COLLECTION"
        case .seatDelivery: return "SEAT_DELIVERY"
        case .digitalRedemption: return "DIGITAL_REDEMPTION"
        case .virtualQueue: return "VIRTUAL_QUEUE"
        case .collectWhenReady: return "COLLECT_WHEN_READY"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: FulfilmentPointType, rhs: FulfilmentPointType) -> Bool {
      switch (lhs, rhs) {
        case (.homeDelivery, .homeDelivery): return true
        case (.collection, .collection): return true
        case (.seatDelivery, .seatDelivery): return true
        case (.digitalRedemption, .digitalRedemption): return true
        case (.virtualQueue, .virtualQueue): return true
        case (.collectWhenReady, .collectWhenReady): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [FulfilmentPointType] {
      return [
        .homeDelivery,
        .collection,
        .seatDelivery,
        .digitalRedemption,
        .virtualQueue,
        .collectWhenReady,
      ]
    }
  }

  public enum OrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case confirmed
    case onHold
    case inProgress
    case prepComplete
    case readyToCollect
    case cancelled
    case complete
    case onTheWay
    case paymentPending
    case payInProgress
    case refunded
    case refundRequested
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "CONFIRMED": self = .confirmed
        case "ON_HOLD": self = .onHold
        case "IN_PROGRESS": self = .inProgress
        case "PREP_COMPLETE": self = .prepComplete
        case "READY_TO_COLLECT": self = .readyToCollect
        case "CANCELLED": self = .cancelled
        case "COMPLETE": self = .complete
        case "ON_THE_WAY": self = .onTheWay
        case "PAYMENT_PENDING": self = .paymentPending
        case "PAY_IN_PROGRESS": self = .payInProgress
        case "REFUNDED": self = .refunded
        case "REFUND_REQUESTED": self = .refundRequested
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .confirmed: return "CONFIRMED"
        case .onHold: return "ON_HOLD"
        case .inProgress: return "IN_PROGRESS"
        case .prepComplete: return "PREP_COMPLETE"
        case .readyToCollect: return "READY_TO_COLLECT"
        case .cancelled: return "CANCELLED"
        case .complete: return "COMPLETE"
        case .onTheWay: return "ON_THE_WAY"
        case .paymentPending: return "PAYMENT_PENDING"
        case .payInProgress: return "PAY_IN_PROGRESS"
        case .refunded: return "REFUNDED"
        case .refundRequested: return "REFUND_REQUESTED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
      switch (lhs, rhs) {
        case (.confirmed, .confirmed): return true
        case (.onHold, .onHold): return true
        case (.inProgress, .inProgress): return true
        case (.prepComplete, .prepComplete): return true
        case (.readyToCollect, .readyToCollect): return true
        case (.cancelled, .cancelled): return true
        case (.complete, .complete): return true
        case (.onTheWay, .onTheWay): return true
        case (.paymentPending, .paymentPending): return true
        case (.payInProgress, .payInProgress): return true
        case (.refunded, .refunded): return true
        case (.refundRequested, .refundRequested): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [OrderStatus] {
      return [
        .confirmed,
        .onHold,
        .inProgress,
        .prepComplete,
        .readyToCollect,
        .cancelled,
        .complete,
        .onTheWay,
        .paymentPending,
        .payInProgress,
        .refunded,
        .refundRequested,
      ]
    }
  }

  public enum PaymentStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case requiresPaymentMethod
    case requiresAction
    case processing
    case succeeded
    case canceled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "requires_payment_method": self = .requiresPaymentMethod
        case "requires_action": self = .requiresAction
        case "processing": self = .processing
        case "succeeded": self = .succeeded
        case "canceled": self = .canceled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .requiresPaymentMethod: return "requires_payment_method"
        case .requiresAction: return "requires_action"
        case .processing: return "processing"
        case .succeeded: return "succeeded"
        case .canceled: return "canceled"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentStatus, rhs: PaymentStatus) -> Bool {
      switch (lhs, rhs) {
        case (.requiresPaymentMethod, .requiresPaymentMethod): return true
        case (.requiresAction, .requiresAction): return true
        case (.processing, .processing): return true
        case (.succeeded, .succeeded): return true
        case (.canceled, .canceled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentStatus] {
      return [
        .requiresPaymentMethod,
        .requiresAction,
        .processing,
        .succeeded,
        .canceled,
      ]
    }
  }

  public enum PaymentActionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case redirectToUrl
    case collectCvc
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "redirect_to_url": self = .redirectToUrl
        case "collect_cvc": self = .collectCvc
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .redirectToUrl: return "redirect_to_url"
        case .collectCvc: return "collect_cvc"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentActionType, rhs: PaymentActionType) -> Bool {
      switch (lhs, rhs) {
        case (.redirectToUrl, .redirectToUrl): return true
        case (.collectCvc, .collectCvc): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentActionType] {
      return [
        .redirectToUrl,
        .collectCvc,
      ]
    }
  }

  public enum PaymentSourceType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case card
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "card": self = .card
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .card: return "card"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentSourceType, rhs: PaymentSourceType) -> Bool {
      switch (lhs, rhs) {
        case (.card, .card): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentSourceType] {
      return [
        .card,
      ]
    }
  }

  public enum ProductModifierItemStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case active
    case disabled
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "ACTIVE": self = .active
        case "DISABLED": self = .disabled
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .active: return "ACTIVE"
        case .disabled: return "DISABLED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: ProductModifierItemStatus, rhs: ProductModifierItemStatus) -> Bool {
      switch (lhs, rhs) {
        case (.active, .active): return true
        case (.disabled, .disabled): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [ProductModifierItemStatus] {
      return [
        .active,
        .disabled,
      ]
    }
  }
}
