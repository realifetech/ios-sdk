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
    ///   - userId
    public init(type: String, action: String, new: Swift.Optional<String?> = nil, old: Swift.Optional<String?> = nil, version: Swift.Optional<String?> = nil, timestamp: String, userId: Swift.Optional<String?> = nil) {
      graphQLMap = ["type": type, "action": action, "new": new, "old": old, "version": version, "timestamp": timestamp, "userId": userId]
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

    public var version: Swift.Optional<String?> {
      get {
        return graphQLMap["version"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
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

    public var userId: Swift.Optional<String?> {
      get {
        return graphQLMap["userId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "userId")
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
    case nb
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
        case "nb": self = .nb
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
        case .nb: return "nb"
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
        case (.nb, .nb): return true
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
        .nb,
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
    ///   - tokenProvider
    ///   - type
    ///   - billingDetails
    ///   - card
    public init(id: Swift.Optional<GraphQLID?> = nil, tokenProvider: Swift.Optional<String?> = nil, type: Swift.Optional<PaymentSourceType?> = nil, billingDetails: Swift.Optional<PaymentSourceBillingDetailsInput?> = nil, card: Swift.Optional<CardInput?> = nil) {
      graphQLMap = ["id": id, "tokenProvider": tokenProvider, "type": type, "billingDetails": billingDetails, "card": card]
    }

    public var id: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "id")
      }
    }

    public var tokenProvider: Swift.Optional<String?> {
      get {
        return graphQLMap["tokenProvider"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "tokenProvider")
      }
    }

    public var type: Swift.Optional<PaymentSourceType?> {
      get {
        return graphQLMap["type"] as? Swift.Optional<PaymentSourceType?> ?? Swift.Optional<PaymentSourceType?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "type")
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
    ///   - id
    ///   - product
    ///   - productVariant
    ///   - fulfilmentPoint
    ///   - quantity
    ///   - productModifierItems
    public init(id: Swift.Optional<GraphQLID?> = nil, product: Swift.Optional<GraphQLID?> = nil, productVariant: Swift.Optional<GraphQLID?> = nil, fulfilmentPoint: Swift.Optional<GraphQLID?> = nil, quantity: Swift.Optional<Int?> = nil, productModifierItems: Swift.Optional<[ProductModifierItemSelectionInput?]?> = nil) {
      graphQLMap = ["id": id, "product": product, "productVariant": productVariant, "fulfilmentPoint": fulfilmentPoint, "quantity": quantity, "productModifierItems": productModifierItems]
    }

    public var id: Swift.Optional<GraphQLID?> {
      get {
        return graphQLMap["id"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "id")
      }
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
    ///   - status
    public init(categories: Swift.Optional<[GraphQLID]?> = nil, status: Swift.Optional<String?> = nil) {
      graphQLMap = ["categories": categories, "status": status]
    }

    public var categories: Swift.Optional<[GraphQLID]?> {
      get {
        return graphQLMap["categories"] as? Swift.Optional<[GraphQLID]?> ?? Swift.Optional<[GraphQLID]?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "categories")
      }
    }

    public var status: Swift.Optional<String?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }
  }

  public struct ProductFilter: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - fulfilmentPoints
    ///   - categories
    ///   - status
    public init(fulfilmentPoints: Swift.Optional<[GraphQLID?]?> = nil, categories: Swift.Optional<[GraphQLID?]?> = nil, status: Swift.Optional<String?> = nil) {
      graphQLMap = ["fulfilmentPoints": fulfilmentPoints, "categories": categories, "status": status]
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

    public var status: Swift.Optional<String?> {
      get {
        return graphQLMap["status"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "status")
      }
    }
  }

  public struct OrderUpdateInput: GraphQLMapConvertible {
    public var graphQLMap: GraphQLMap

    /// - Parameters:
    ///   - status
    ///   - collectionPreferenceType
    ///   - checkInTime
    ///   - paymentStatus
    public init(status: Swift.Optional<String?> = nil, collectionPreferenceType: Swift.Optional<CollectionPreferenceType?> = nil, checkInTime: Swift.Optional<String?> = nil, paymentStatus: Swift.Optional<PaymentOrderStatus?> = nil) {
      graphQLMap = ["status": status, "collectionPreferenceType": collectionPreferenceType, "checkInTime": checkInTime, "paymentStatus": paymentStatus]
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

    public var paymentStatus: Swift.Optional<PaymentOrderStatus?> {
      get {
        return graphQLMap["paymentStatus"] as? Swift.Optional<PaymentOrderStatus?> ?? Swift.Optional<PaymentOrderStatus?>.none
      }
      set {
        graphQLMap.updateValue(newValue, forKey: "paymentStatus")
      }
    }
  }

  public enum PaymentOrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
    public typealias RawValue = String
    case standing
    case succeed
    case declined
    /// Auto generated constant for unknown enum values
    case __unknown(RawValue)

    public init?(rawValue: RawValue) {
      switch rawValue {
        case "STANDING": self = .standing
        case "SUCCEED": self = .succeed
        case "DECLINED": self = .declined
        default: self = .__unknown(rawValue)
      }
    }

    public var rawValue: RawValue {
      switch self {
        case .standing: return "STANDING"
        case .succeed: return "SUCCEED"
        case .declined: return "DECLINED"
        case .__unknown(let value): return value
      }
    }

    public static func == (lhs: PaymentOrderStatus, rhs: PaymentOrderStatus) -> Bool {
      switch (lhs, rhs) {
        case (.standing, .standing): return true
        case (.succeed, .succeed): return true
        case (.declined, .declined): return true
        case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
        default: return false
      }
    }

    public static var allCases: [PaymentOrderStatus] {
      return [
        .standing,
        .succeed,
        .declined,
      ]
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
    case paymentError
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
        case "PAYMENT_ERROR": self = .paymentError
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
        case .paymentError: return "PAYMENT_ERROR"
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
        case (.paymentError, .paymentError): return true
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
        .paymentError,
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

  public final class PutAnalyticEventMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation PutAnalyticEvent($input: AnalyticEvent!) {
        putAnalyticEvent(input: $input) {
          __typename
          success
          message
        }
      }
      """

    public let operationName: String = "PutAnalyticEvent"

    public var input: AnalyticEvent

    public init(input: AnalyticEvent) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("putAnalyticEvent", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(PutAnalyticEvent.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(putAnalyticEvent: PutAnalyticEvent) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "putAnalyticEvent": putAnalyticEvent.resultMap])
      }

      public var putAnalyticEvent: PutAnalyticEvent {
        get {
          return PutAnalyticEvent(unsafeResultMap: resultMap["putAnalyticEvent"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "putAnalyticEvent")
        }
      }

      public struct PutAnalyticEvent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PutAnalyticEventResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("message", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(success: Bool, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PutAnalyticEventResponse", "success": success, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var success: Bool {
          get {
            return resultMap["success"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "success")
          }
        }

        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }

  public final class BelongsToAudienceWithExternalIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query belongsToAudienceWithExternalId($externalAudienceId: String!) {
        me {
          __typename
          device {
            __typename
            belongsToAudienceWithExternalId(externalAudienceId: $externalAudienceId)
          }
        }
      }
      """

    public let operationName: String = "belongsToAudienceWithExternalId"

    public var externalAudienceId: String

    public init(externalAudienceId: String) {
      self.externalAudienceId = externalAudienceId
    }

    public var variables: GraphQLMap? {
      return ["externalAudienceId": externalAudienceId]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("me", type: .object(Me.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(me: Me? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
      }

      public var me: Me? {
        get {
          return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "me")
        }
      }

      public struct Me: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Context"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("device", type: .object(Device.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(device: Device? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "device": device.flatMap { (value: Device) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var device: Device? {
          get {
            return (resultMap["device"] as? ResultMap).flatMap { Device(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "device")
          }
        }

        public struct Device: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Device"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("belongsToAudienceWithExternalId", arguments: ["externalAudienceId": GraphQLVariable("externalAudienceId")], type: .scalar(Bool.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(belongsToAudienceWithExternalId: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Device", "belongsToAudienceWithExternalId": belongsToAudienceWithExternalId])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          @available(*, deprecated, message: "Field is deprecated!. Use getDeviceBelongsToAudience")
          public var belongsToAudienceWithExternalId: Bool? {
            get {
              return resultMap["belongsToAudienceWithExternalId"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "belongsToAudienceWithExternalId")
            }
          }
        }
      }
    }
  }

  public final class GetScreenByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getScreenById($id: ID!) {
        getScreenById(id: $id) {
          __typename
          translations {
            __typename
            language
            title
          }
        }
      }
      """

    public let operationName: String = "getScreenById"

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getScreenById", arguments: ["id": GraphQLVariable("id")], type: .object(GetScreenById.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getScreenById: GetScreenById? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getScreenById": getScreenById.flatMap { (value: GetScreenById) -> ResultMap in value.resultMap }])
      }

      public var getScreenById: GetScreenById? {
        get {
          return (resultMap["getScreenById"] as? ResultMap).flatMap { GetScreenById(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getScreenById")
        }
      }

      public struct GetScreenById: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Screen"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("translations", type: .nonNull(.list(.nonNull(.object(Translation.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(translations: [Translation]) {
          self.init(unsafeResultMap: ["__typename": "Screen", "translations": translations.map { (value: Translation) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var translations: [Translation] {
          get {
            return (resultMap["translations"] as! [ResultMap]).map { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Translation) -> ResultMap in value.resultMap }, forKey: "translations")
          }
        }

        public struct Translation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ScreenTranslation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("language", type: .nonNull(.scalar(Language.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(language: Language, title: String) {
            self.init(unsafeResultMap: ["__typename": "ScreenTranslation", "language": language, "title": title])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var language: Language {
            get {
              return resultMap["language"]! as! Language
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }

          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }
        }
      }
    }
  }

  public final class GetScreenByScreenTypeQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getScreenByScreenType($type: ScreenType!) {
        getScreenByScreenType(type: $type) {
          __typename
          translations {
            __typename
            language
            title
          }
        }
      }
      """

    public let operationName: String = "getScreenByScreenType"

    public var type: ScreenType

    public init(type: ScreenType) {
      self.type = type
    }

    public var variables: GraphQLMap? {
      return ["type": type]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getScreenByScreenType", arguments: ["type": GraphQLVariable("type")], type: .object(GetScreenByScreenType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getScreenByScreenType: GetScreenByScreenType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getScreenByScreenType": getScreenByScreenType.flatMap { (value: GetScreenByScreenType) -> ResultMap in value.resultMap }])
      }

      public var getScreenByScreenType: GetScreenByScreenType? {
        get {
          return (resultMap["getScreenByScreenType"] as? ResultMap).flatMap { GetScreenByScreenType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getScreenByScreenType")
        }
      }

      public struct GetScreenByScreenType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Screen"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("translations", type: .nonNull(.list(.nonNull(.object(Translation.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(translations: [Translation]) {
          self.init(unsafeResultMap: ["__typename": "Screen", "translations": translations.map { (value: Translation) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var translations: [Translation] {
          get {
            return (resultMap["translations"] as! [ResultMap]).map { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Translation) -> ResultMap in value.resultMap }, forKey: "translations")
          }
        }

        public struct Translation: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ScreenTranslation"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("language", type: .nonNull(.scalar(Language.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(language: Language, title: String) {
            self.init(unsafeResultMap: ["__typename": "ScreenTranslation", "language": language, "title": title])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var language: Language {
            get {
              return resultMap["language"]! as! Language
            }
            set {
              resultMap.updateValue(newValue, forKey: "language")
            }
          }

          public var title: String {
            get {
              return resultMap["title"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "title")
            }
          }
        }
      }
    }
  }

  public final class GetWidgetsByScreenIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getWidgetsByScreenId($screenId: ID!, $pageSize: Int!, $page: Int = 1) {
        getWidgetsByScreenId(screenId: $screenId, pageSize: $pageSize, page: $page) {
          __typename
          edges {
            __typename
            ...FragmentWidget
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getWidgetsByScreenId"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentWidget.fragmentDefinition)
      return document
    }

    public var screenId: GraphQLID
    public var pageSize: Int
    public var page: Int?

    public init(screenId: GraphQLID, pageSize: Int, page: Int? = nil) {
      self.screenId = screenId
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["screenId": screenId, "pageSize": pageSize, "page": page]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getWidgetsByScreenId", arguments: ["screenId": GraphQLVariable("screenId"), "pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(GetWidgetsByScreenId.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getWidgetsByScreenId: GetWidgetsByScreenId? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getWidgetsByScreenId": getWidgetsByScreenId.flatMap { (value: GetWidgetsByScreenId) -> ResultMap in value.resultMap }])
      }

      public var getWidgetsByScreenId: GetWidgetsByScreenId? {
        get {
          return (resultMap["getWidgetsByScreenId"] as? ResultMap).flatMap { GetWidgetsByScreenId(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getWidgetsByScreenId")
        }
      }

      public struct GetWidgetsByScreenId: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WidgetEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "WidgetEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Widget"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentWidget.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentWidget: FragmentWidget {
              get {
                return FragmentWidget(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetWidgetsByScreenTypeQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getWidgetsByScreenType($type: ScreenType!, $pageSize: Int!, $page: Int = 1) {
        getWidgetsByScreenType(type: $type, pageSize: $pageSize, page: $page) {
          __typename
          edges {
            __typename
            ...FragmentWidget
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getWidgetsByScreenType"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentWidget.fragmentDefinition)
      return document
    }

    public var type: ScreenType
    public var pageSize: Int
    public var page: Int?

    public init(type: ScreenType, pageSize: Int, page: Int? = nil) {
      self.type = type
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["type": type, "pageSize": pageSize, "page": page]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getWidgetsByScreenType", arguments: ["type": GraphQLVariable("type"), "pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(GetWidgetsByScreenType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getWidgetsByScreenType: GetWidgetsByScreenType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getWidgetsByScreenType": getWidgetsByScreenType.flatMap { (value: GetWidgetsByScreenType) -> ResultMap in value.resultMap }])
      }

      public var getWidgetsByScreenType: GetWidgetsByScreenType? {
        get {
          return (resultMap["getWidgetsByScreenType"] as? ResultMap).flatMap { GetWidgetsByScreenType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getWidgetsByScreenType")
        }
      }

      public struct GetWidgetsByScreenType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WidgetEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "WidgetEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Widget"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentWidget.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentWidget: FragmentWidget {
              get {
                return FragmentWidget(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetWebPageByTypeQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getWebPageByType($type: WebPageType) {
        getWebPageByType(type: $type) {
          __typename
          url
        }
      }
      """

    public let operationName: String = "getWebPageByType"

    public var type: WebPageType?

    public init(type: WebPageType? = nil) {
      self.type = type
    }

    public var variables: GraphQLMap? {
      return ["type": type]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getWebPageByType", arguments: ["type": GraphQLVariable("type")], type: .object(GetWebPageByType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getWebPageByType: GetWebPageByType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getWebPageByType": getWebPageByType.flatMap { (value: GetWebPageByType) -> ResultMap in value.resultMap }])
      }

      public var getWebPageByType: GetWebPageByType? {
        get {
          return (resultMap["getWebPageByType"] as? ResultMap).flatMap { GetWebPageByType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getWebPageByType")
        }
      }

      public struct GetWebPageByType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WebPage"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(url: String) {
          self.init(unsafeResultMap: ["__typename": "WebPage", "url": url])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var url: String {
          get {
            return resultMap["url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }
      }
    }
  }

  public final class GetUserAliasesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getUserAliases {
        me {
          __typename
          user {
            __typename
            userAliases {
              __typename
              userAliasType {
                __typename
                userAliasType
              }
              value
            }
          }
        }
      }
      """

    public let operationName: String = "getUserAliases"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("me", type: .object(Me.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(me: Me? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
      }

      public var me: Me? {
        get {
          return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "me")
        }
      }

      public struct Me: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Context"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .object(User.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User? = nil) {
          self.init(unsafeResultMap: ["__typename": "Context", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("userAliases", type: .list(.object(UserAlias.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userAliases: [UserAlias?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "userAliases": userAliases.flatMap { (value: [UserAlias?]) -> [ResultMap?] in value.map { (value: UserAlias?) -> ResultMap? in value.flatMap { (value: UserAlias) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userAliases: [UserAlias?]? {
            get {
              return (resultMap["userAliases"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [UserAlias?] in value.map { (value: ResultMap?) -> UserAlias? in value.flatMap { (value: ResultMap) -> UserAlias in UserAlias(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [UserAlias?]) -> [ResultMap?] in value.map { (value: UserAlias?) -> ResultMap? in value.flatMap { (value: UserAlias) -> ResultMap in value.resultMap } } }, forKey: "userAliases")
            }
          }

          public struct UserAlias: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserAlias"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("userAliasType", type: .object(UserAliasType.selections)),
                GraphQLField("value", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(userAliasType: UserAliasType? = nil, value: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserAlias", "userAliasType": userAliasType.flatMap { (value: UserAliasType) -> ResultMap in value.resultMap }, "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var userAliasType: UserAliasType? {
              get {
                return (resultMap["userAliasType"] as? ResultMap).flatMap { UserAliasType(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "userAliasType")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public struct UserAliasType: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserAliasType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("userAliasType", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(userAliasType: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserAliasType", "userAliasType": userAliasType])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var userAliasType: String? {
                get {
                  return resultMap["userAliasType"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userAliasType")
                }
              }
            }
          }
        }
      }
    }
  }

  public final class AddPaymentSourceToMyWalletMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation addPaymentSourceToMyWallet($input: PaymentSourceInput!) {
        addPaymentSourceToMyWallet(input: $input) {
          __typename
          ...FragmentPaymentSource
        }
      }
      """

    public let operationName: String = "addPaymentSourceToMyWallet"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var input: PaymentSourceInput

    public init(input: PaymentSourceInput) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("addPaymentSourceToMyWallet", arguments: ["input": GraphQLVariable("input")], type: .object(AddPaymentSourceToMyWallet.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(addPaymentSourceToMyWallet: AddPaymentSourceToMyWallet? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "addPaymentSourceToMyWallet": addPaymentSourceToMyWallet.flatMap { (value: AddPaymentSourceToMyWallet) -> ResultMap in value.resultMap }])
      }

      public var addPaymentSourceToMyWallet: AddPaymentSourceToMyWallet? {
        get {
          return (resultMap["addPaymentSourceToMyWallet"] as? ResultMap).flatMap { AddPaymentSourceToMyWallet(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "addPaymentSourceToMyWallet")
        }
      }

      public struct AddPaymentSourceToMyWallet: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentSource.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentPaymentSource: FragmentPaymentSource {
            get {
              return FragmentPaymentSource(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class CheckoutMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation checkoutMyBasket($input: CheckoutInput) {
        checkoutMyBasket(input: $input) {
          __typename
          ...FragmentOrder
        }
      }
      """

    public let operationName: String = "checkoutMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
      return document
    }

    public var input: CheckoutInput?

    public init(input: CheckoutInput? = nil) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("checkoutMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(CheckoutMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(checkoutMyBasket: CheckoutMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "checkoutMyBasket": checkoutMyBasket.flatMap { (value: CheckoutMyBasket) -> ResultMap in value.resultMap }])
      }

      public var checkoutMyBasket: CheckoutMyBasket? {
        get {
          return (resultMap["checkoutMyBasket"] as? ResultMap).flatMap { CheckoutMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "checkoutMyBasket")
        }
      }

      public struct CheckoutMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentOrder.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentOrder: FragmentOrder {
            get {
              return FragmentOrder(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class CreateMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation createMyBasket($input: BasketInput) {
        createMyBasket(input: $input) {
          __typename
          ...FragmentBasket
        }
      }
      """

    public let operationName: String = "createMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentBasket.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      return document
    }

    public var input: BasketInput?

    public init(input: BasketInput? = nil) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("createMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(CreateMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createMyBasket: CreateMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "createMyBasket": createMyBasket.flatMap { (value: CreateMyBasket) -> ResultMap in value.resultMap }])
      }

      public var createMyBasket: CreateMyBasket? {
        get {
          return (resultMap["createMyBasket"] as? ResultMap).flatMap { CreateMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createMyBasket")
        }
      }

      public struct CreateMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Basket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentBasket.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentBasket: FragmentBasket {
            get {
              return FragmentBasket(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class CreateMyPaymentIntentMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation createMyPaymentIntent($input: PaymentIntentInput!) {
        createMyPaymentIntent(input: $input) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "createMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentIntent.fragmentDefinition)
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var input: PaymentIntentInput

    public init(input: PaymentIntentInput) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("createMyPaymentIntent", arguments: ["input": GraphQLVariable("input")], type: .object(CreateMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(createMyPaymentIntent: CreateMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "createMyPaymentIntent": createMyPaymentIntent.flatMap { (value: CreateMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var createMyPaymentIntent: CreateMyPaymentIntent? {
        get {
          return (resultMap["createMyPaymentIntent"] as? ResultMap).flatMap { CreateMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "createMyPaymentIntent")
        }
      }

      public struct CreateMyPaymentIntent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentIntent"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentIntent.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentPaymentIntent: FragmentPaymentIntent {
            get {
              return FragmentPaymentIntent(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class DeleteMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation deleteMyBasket {
        deleteMyBasket {
          __typename
          success
          message
        }
      }
      """

    public let operationName: String = "deleteMyBasket"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("deleteMyBasket", type: .nonNull(.object(DeleteMyBasket.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleteMyBasket: DeleteMyBasket) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMyBasket": deleteMyBasket.resultMap])
      }

      public var deleteMyBasket: DeleteMyBasket {
        get {
          return DeleteMyBasket(unsafeResultMap: resultMap["deleteMyBasket"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "deleteMyBasket")
        }
      }

      public struct DeleteMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MutationResponse"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("success", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("message", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(success: Bool, message: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MutationResponse", "success": success, "message": message])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var success: Bool {
          get {
            return resultMap["success"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "success")
          }
        }

        public var message: String? {
          get {
            return resultMap["message"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "message")
          }
        }
      }
    }
  }

  public final class DeleteMyPaymentSourceMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation deleteMyPaymentSource($id: ID!) {
        deleteMyPaymentSource(id: $id) {
          __typename
          ...FragmentPaymentSource
        }
      }
      """

    public let operationName: String = "deleteMyPaymentSource"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("deleteMyPaymentSource", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteMyPaymentSource.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(deleteMyPaymentSource: DeleteMyPaymentSource? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMyPaymentSource": deleteMyPaymentSource.flatMap { (value: DeleteMyPaymentSource) -> ResultMap in value.resultMap }])
      }

      public var deleteMyPaymentSource: DeleteMyPaymentSource? {
        get {
          return (resultMap["deleteMyPaymentSource"] as? ResultMap).flatMap { DeleteMyPaymentSource(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "deleteMyPaymentSource")
        }
      }

      public struct DeleteMyPaymentSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSource"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentSource.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentPaymentSource: FragmentPaymentSource {
            get {
              return FragmentPaymentSource(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetFulfilmentPointByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointById($id: ID!, $params: [FilterParam!]) {
        getFulfilmentPoint(id: $id, params: $params) {
          __typename
          ...FragmentFulfilmentPoint
        }
      }
      """

    public let operationName: String = "getFulfilmentPointById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var params: [FilterParam]?

    public init(id: GraphQLID, params: [FilterParam]?) {
      self.id = id
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["id": id, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPoint", arguments: ["id": GraphQLVariable("id"), "params": GraphQLVariable("params")], type: .object(GetFulfilmentPoint.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPoint: GetFulfilmentPoint? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPoint": getFulfilmentPoint.flatMap { (value: GetFulfilmentPoint) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPoint: GetFulfilmentPoint? {
        get {
          return (resultMap["getFulfilmentPoint"] as? ResultMap).flatMap { GetFulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPoint")
        }
      }

      public struct GetFulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPoint"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
            get {
              return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetFulfilmentPointCategoriesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointCategories($pageSize: Int!, $page: Int = 1) {
        getFulfilmentPointCategories(pageSize: $pageSize, page: $page) {
          __typename
          edges {
            __typename
            ...FragmentFulfilmentPointCategory
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getFulfilmentPointCategories"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?

    public init(pageSize: Int, page: Int? = nil) {
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPointCategories", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(GetFulfilmentPointCategory.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPointCategories: GetFulfilmentPointCategory? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPointCategories": getFulfilmentPointCategories.flatMap { (value: GetFulfilmentPointCategory) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPointCategories: GetFulfilmentPointCategory? {
        get {
          return (resultMap["getFulfilmentPointCategories"] as? ResultMap).flatMap { GetFulfilmentPointCategory(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPointCategories")
        }
      }

      public struct GetFulfilmentPointCategory: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPointCategoryEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategoryEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentFulfilmentPointCategory.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentFulfilmentPointCategory: FragmentFulfilmentPointCategory {
              get {
                return FragmentFulfilmentPointCategory(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetFulfilmentPointCategoryByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPointCategoryById($id: ID!) {
        getFulfilmentPointCategory(id: $id) {
          __typename
          ...FragmentFulfilmentPointCategory
        }
      }
      """

    public let operationName: String = "getFulfilmentPointCategoryById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPointCategory", arguments: ["id": GraphQLVariable("id")], type: .object(GetFulfilmentPointCategory.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPointCategory: GetFulfilmentPointCategory? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPointCategory": getFulfilmentPointCategory.flatMap { (value: GetFulfilmentPointCategory) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPointCategory: GetFulfilmentPointCategory? {
        get {
          return (resultMap["getFulfilmentPointCategory"] as? ResultMap).flatMap { GetFulfilmentPointCategory(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPointCategory")
        }
      }

      public struct GetFulfilmentPointCategory: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentFulfilmentPointCategory.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentFulfilmentPointCategory: FragmentFulfilmentPointCategory {
            get {
              return FragmentFulfilmentPointCategory(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetFulfilmentPointsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getFulfilmentPoints($pageSize: Int!, $page: Int = 1, $filters: FulfilmentPointFilter, $params: [FilterParam!]) {
        getFulfilmentPoints(
          page: $page
          pageSize: $pageSize
          filters: $filters
          params: $params
        ) {
          __typename
          edges {
            __typename
            ...FragmentFulfilmentPoint
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getFulfilmentPoints"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?
    public var filters: FulfilmentPointFilter?
    public var params: [FilterParam]?

    public init(pageSize: Int, page: Int? = nil, filters: FulfilmentPointFilter? = nil, params: [FilterParam]?) {
      self.pageSize = pageSize
      self.page = page
      self.filters = filters
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page, "filters": filters, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getFulfilmentPoints", arguments: ["page": GraphQLVariable("page"), "pageSize": GraphQLVariable("pageSize"), "filters": GraphQLVariable("filters"), "params": GraphQLVariable("params")], type: .object(GetFulfilmentPoint.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getFulfilmentPoints: GetFulfilmentPoint? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getFulfilmentPoints": getFulfilmentPoints.flatMap { (value: GetFulfilmentPoint) -> ResultMap in value.resultMap }])
      }

      public var getFulfilmentPoints: GetFulfilmentPoint? {
        get {
          return (resultMap["getFulfilmentPoints"] as? ResultMap).flatMap { GetFulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getFulfilmentPoints")
        }
      }

      public struct GetFulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPointEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "FulfilmentPointEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FulfilmentPoint"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
              get {
                return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetMyBasketQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyBasket {
        getMyBasket {
          __typename
          ...FragmentBasket
        }
      }
      """

    public let operationName: String = "getMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentBasket.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      return document
    }

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyBasket", type: .object(GetMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyBasket: GetMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyBasket": getMyBasket.flatMap { (value: GetMyBasket) -> ResultMap in value.resultMap }])
      }

      public var getMyBasket: GetMyBasket? {
        get {
          return (resultMap["getMyBasket"] as? ResultMap).flatMap { GetMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyBasket")
        }
      }

      public struct GetMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Basket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentBasket.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentBasket: FragmentBasket {
            get {
              return FragmentBasket(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetMyOrderByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyOrderById($id: ID!) {
        getMyOrder(id: $id) {
          __typename
          ...FragmentOrder
        }
      }
      """

    public let operationName: String = "getMyOrderById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyOrder", arguments: ["id": GraphQLVariable("id")], type: .object(GetMyOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyOrder: GetMyOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyOrder": getMyOrder.flatMap { (value: GetMyOrder) -> ResultMap in value.resultMap }])
      }

      public var getMyOrder: GetMyOrder? {
        get {
          return (resultMap["getMyOrder"] as? ResultMap).flatMap { GetMyOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyOrder")
        }
      }

      public struct GetMyOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentOrder.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentOrder: FragmentOrder {
            get {
              return FragmentOrder(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetMyOrdersQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyOrders($pageSize: Int!, $page: Int = 1) {
        getMyOrders(pageSize: $pageSize, page: $page) {
          __typename
          edges {
            __typename
            ...FragmentOrder
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getMyOrders"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?

    public init(pageSize: Int, page: Int? = nil) {
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyOrders", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page")], type: .object(GetMyOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyOrders: GetMyOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyOrders": getMyOrders.flatMap { (value: GetMyOrder) -> ResultMap in value.resultMap }])
      }

      public var getMyOrders: GetMyOrder? {
        get {
          return (resultMap["getMyOrders"] as? ResultMap).flatMap { GetMyOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyOrders")
        }
      }

      public struct GetMyOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "OrderEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentOrder.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentOrder: FragmentOrder {
              get {
                return FragmentOrder(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetMyPaymentIntentQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyPaymentIntent($id: ID!) {
        getMyPaymentIntent(id: $id) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "getMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentIntent.fragmentDefinition)
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var id: GraphQLID

    public init(id: GraphQLID) {
      self.id = id
    }

    public var variables: GraphQLMap? {
      return ["id": id]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyPaymentIntent", arguments: ["id": GraphQLVariable("id")], type: .object(GetMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyPaymentIntent: GetMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyPaymentIntent": getMyPaymentIntent.flatMap { (value: GetMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var getMyPaymentIntent: GetMyPaymentIntent? {
        get {
          return (resultMap["getMyPaymentIntent"] as? ResultMap).flatMap { GetMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyPaymentIntent")
        }
      }

      public struct GetMyPaymentIntent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentIntent"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentIntent.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentPaymentIntent: FragmentPaymentIntent {
            get {
              return FragmentPaymentIntent(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetMyPaymentSourcesQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getMyPaymentSources($pageSize: Int!, $page: Int = 1) {
        getMyPaymentSources(page: $page, pageSize: $pageSize) {
          __typename
          edges {
            __typename
            ...FragmentPaymentSource
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getMyPaymentSources"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?

    public init(pageSize: Int, page: Int? = nil) {
      self.pageSize = pageSize
      self.page = page
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getMyPaymentSources", arguments: ["page": GraphQLVariable("page"), "pageSize": GraphQLVariable("pageSize")], type: .object(GetMyPaymentSource.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getMyPaymentSources: GetMyPaymentSource? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getMyPaymentSources": getMyPaymentSources.flatMap { (value: GetMyPaymentSource) -> ResultMap in value.resultMap }])
      }

      public var getMyPaymentSources: GetMyPaymentSource? {
        get {
          return (resultMap["getMyPaymentSources"] as? ResultMap).flatMap { GetMyPaymentSource(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getMyPaymentSources")
        }
      }

      public struct GetMyPaymentSource: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSourceEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "PaymentSourceEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PaymentSource"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentPaymentSource.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentPaymentSource: FragmentPaymentSource {
              get {
                return FragmentPaymentSource(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class GetProductByIdQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getProductById($id: ID!, $params: [FilterParam!]) {
        getProduct(id: $id, params: $params) {
          __typename
          ...FragmentProduct
        }
      }
      """

    public let operationName: String = "getProductById"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var params: [FilterParam]?

    public init(id: GraphQLID, params: [FilterParam]?) {
      self.id = id
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["id": id, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getProduct", arguments: ["id": GraphQLVariable("id"), "params": GraphQLVariable("params")], type: .object(GetProduct.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getProduct: GetProduct? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getProduct": getProduct.flatMap { (value: GetProduct) -> ResultMap in value.resultMap }])
      }

      public var getProduct: GetProduct? {
        get {
          return (resultMap["getProduct"] as? ResultMap).flatMap { GetProduct(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getProduct")
        }
      }

      public struct GetProduct: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProduct.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProduct: FragmentProduct {
            get {
              return FragmentProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class GetProductsQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query getProducts($pageSize: Int!, $page: Int, $filters: ProductFilter, $params: [FilterParam!]) {
        getProducts(
          pageSize: $pageSize
          page: $page
          filters: $filters
          params: $params
        ) {
          __typename
          edges {
            __typename
            ...FragmentProduct
          }
          nextPage
        }
      }
      """

    public let operationName: String = "getProducts"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      return document
    }

    public var pageSize: Int
    public var page: Int?
    public var filters: ProductFilter?
    public var params: [FilterParam]?

    public init(pageSize: Int, page: Int? = nil, filters: ProductFilter? = nil, params: [FilterParam]?) {
      self.pageSize = pageSize
      self.page = page
      self.filters = filters
      self.params = params
    }

    public var variables: GraphQLMap? {
      return ["pageSize": pageSize, "page": page, "filters": filters, "params": params]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("getProducts", arguments: ["pageSize": GraphQLVariable("pageSize"), "page": GraphQLVariable("page"), "filters": GraphQLVariable("filters"), "params": GraphQLVariable("params")], type: .object(GetProduct.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(getProducts: GetProduct? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "getProducts": getProducts.flatMap { (value: GetProduct) -> ResultMap in value.resultMap }])
      }

      public var getProducts: GetProduct? {
        get {
          return (resultMap["getProducts"] as? ResultMap).flatMap { GetProduct(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "getProducts")
        }
      }

      public struct GetProduct: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .list(.object(Edge.selections))),
            GraphQLField("nextPage", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public var nextPage: Int? {
          get {
            return resultMap["nextPage"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "nextPage")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Product"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(FragmentProduct.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var fragmentProduct: FragmentProduct {
              get {
                return FragmentProduct(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }

  public final class UpdateMyBasketMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyBasket($input: BasketInput) {
        updateMyBasket(input: $input) {
          __typename
          ...FragmentBasket
        }
      }
      """

    public let operationName: String = "updateMyBasket"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentBasket.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      return document
    }

    public var input: BasketInput?

    public init(input: BasketInput? = nil) {
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("updateMyBasket", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateMyBasket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyBasket: UpdateMyBasket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyBasket": updateMyBasket.flatMap { (value: UpdateMyBasket) -> ResultMap in value.resultMap }])
      }

      public var updateMyBasket: UpdateMyBasket? {
        get {
          return (resultMap["updateMyBasket"] as? ResultMap).flatMap { UpdateMyBasket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyBasket")
        }
      }

      public struct UpdateMyBasket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Basket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentBasket.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentBasket: FragmentBasket {
            get {
              return FragmentBasket(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class UpdateMyOrderMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyOrder($id: ID!, $input: OrderUpdateInput) {
        updateMyOrder(id: $id, input: $input) {
          __typename
          ...FragmentOrder
        }
      }
      """

    public let operationName: String = "updateMyOrder"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentOrder.fragmentDefinition)
      document.append("\n" + FragmentProduct.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItem.fragmentDefinition)
      document.append("\n" + FragmentProductVariant.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPoint.fragmentDefinition)
      document.append("\n" + FragmentForm.fragmentDefinition)
      document.append("\n" + FragmentFulfilmentPointCategory.fragmentDefinition)
      document.append("\n" + FragmentVenue.fragmentDefinition)
      document.append("\n" + FragmentTimeslot.fragmentDefinition)
      document.append("\n" + FragmentProductModifierItemSelection.fragmentDefinition)
      document.append("\n" + FragmentUser.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var input: OrderUpdateInput?

    public init(id: GraphQLID, input: OrderUpdateInput? = nil) {
      self.id = id
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["id": id, "input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("updateMyOrder", arguments: ["id": GraphQLVariable("id"), "input": GraphQLVariable("input")], type: .object(UpdateMyOrder.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyOrder: UpdateMyOrder? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyOrder": updateMyOrder.flatMap { (value: UpdateMyOrder) -> ResultMap in value.resultMap }])
      }

      public var updateMyOrder: UpdateMyOrder? {
        get {
          return (resultMap["updateMyOrder"] as? ResultMap).flatMap { UpdateMyOrder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyOrder")
        }
      }

      public struct UpdateMyOrder: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentOrder.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentOrder: FragmentOrder {
            get {
              return FragmentOrder(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public final class UpdateMyPaymentIntentMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      mutation updateMyPaymentIntent($id: ID!, $input: PaymentIntentUpdateInput!) {
        updateMyPaymentIntent(id: $id, input: $input) {
          __typename
          ...FragmentPaymentIntent
        }
      }
      """

    public let operationName: String = "updateMyPaymentIntent"

    public var queryDocument: String {
      var document: String = operationDefinition
      document.append("\n" + FragmentPaymentIntent.fragmentDefinition)
      document.append("\n" + FragmentPaymentSource.fragmentDefinition)
      document.append("\n" + FragmentCard.fragmentDefinition)
      return document
    }

    public var id: GraphQLID
    public var input: PaymentIntentUpdateInput

    public init(id: GraphQLID, input: PaymentIntentUpdateInput) {
      self.id = id
      self.input = input
    }

    public var variables: GraphQLMap? {
      return ["id": id, "input": input]
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Mutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("updateMyPaymentIntent", arguments: ["id": GraphQLVariable("id"), "input": GraphQLVariable("input")], type: .object(UpdateMyPaymentIntent.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(updateMyPaymentIntent: UpdateMyPaymentIntent? = nil) {
        self.init(unsafeResultMap: ["__typename": "Mutation", "updateMyPaymentIntent": updateMyPaymentIntent.flatMap { (value: UpdateMyPaymentIntent) -> ResultMap in value.resultMap }])
      }

      public var updateMyPaymentIntent: UpdateMyPaymentIntent? {
        get {
          return (resultMap["updateMyPaymentIntent"] as? ResultMap).flatMap { UpdateMyPaymentIntent(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "updateMyPaymentIntent")
        }
      }

      public struct UpdateMyPaymentIntent: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentIntent"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentPaymentIntent.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentPaymentIntent: FragmentPaymentIntent {
            get {
              return FragmentPaymentIntent(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public struct ScreenTranslation: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment screenTranslation on ScreenTranslation {
        __typename
        language
        title
      }
      """

    public static let possibleTypes: [String] = ["ScreenTranslation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("language", type: .nonNull(.scalar(Language.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(language: Language, title: String) {
      self.init(unsafeResultMap: ["__typename": "ScreenTranslation", "language": language, "title": title])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var language: Language {
      get {
        return resultMap["language"]! as! Language
      }
      set {
        resultMap.updateValue(newValue, forKey: "language")
      }
    }

    public var title: String {
      get {
        return resultMap["title"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "title")
      }
    }
  }

  public struct FragmentWidget: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentWidget on Widget {
        __typename
        id
        style {
          __typename
          type
          size
          padded
        }
        viewAllUrl
        widgetType
        variation {
          __typename
          fetchType
          contentIds
          params {
            __typename
            key
            value
          }
          engagementParams {
            __typename
            key
            value
          }
          translations {
            __typename
            language
            title
          }
        }
      }
      """

    public static let possibleTypes: [String] = ["Widget"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("style", type: .object(Style.selections)),
        GraphQLField("viewAllUrl", type: .scalar(String.self)),
        GraphQLField("widgetType", type: .scalar(WidgetType.self)),
        GraphQLField("variation", type: .object(Variation.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, style: Style? = nil, viewAllUrl: String? = nil, widgetType: WidgetType? = nil, variation: Variation? = nil) {
      self.init(unsafeResultMap: ["__typename": "Widget", "id": id, "style": style.flatMap { (value: Style) -> ResultMap in value.resultMap }, "viewAllUrl": viewAllUrl, "widgetType": widgetType, "variation": variation.flatMap { (value: Variation) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var style: Style? {
      get {
        return (resultMap["style"] as? ResultMap).flatMap { Style(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "style")
      }
    }

    public var viewAllUrl: String? {
      get {
        return resultMap["viewAllUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "viewAllUrl")
      }
    }

    public var widgetType: WidgetType? {
      get {
        return resultMap["widgetType"] as? WidgetType
      }
      set {
        resultMap.updateValue(newValue, forKey: "widgetType")
      }
    }

    public var variation: Variation? {
      get {
        return (resultMap["variation"] as? ResultMap).flatMap { Variation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "variation")
      }
    }

    public struct Style: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Style"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(StyleType.self)),
          GraphQLField("size", type: .scalar(StyleSize.self)),
          GraphQLField("padded", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: StyleType? = nil, size: StyleSize? = nil, padded: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Style", "type": type, "size": size, "padded": padded])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: StyleType? {
        get {
          return resultMap["type"] as? StyleType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var size: StyleSize? {
        get {
          return resultMap["size"] as? StyleSize
        }
        set {
          resultMap.updateValue(newValue, forKey: "size")
        }
      }

      public var padded: Bool? {
        get {
          return resultMap["padded"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "padded")
        }
      }
    }

    public struct Variation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["WidgetVariation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("fetchType", type: .scalar(WidgetFetchType.self)),
          GraphQLField("contentIds", type: .list(.scalar(GraphQLID.self))),
          GraphQLField("params", type: .list(.object(Param.selections))),
          GraphQLField("engagementParams", type: .list(.object(EngagementParam.selections))),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(fetchType: WidgetFetchType? = nil, contentIds: [GraphQLID?]? = nil, params: [Param?]? = nil, engagementParams: [EngagementParam?]? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "WidgetVariation", "fetchType": fetchType, "contentIds": contentIds, "params": params.flatMap { (value: [Param?]) -> [ResultMap?] in value.map { (value: Param?) -> ResultMap? in value.flatMap { (value: Param) -> ResultMap in value.resultMap } } }, "engagementParams": engagementParams.flatMap { (value: [EngagementParam?]) -> [ResultMap?] in value.map { (value: EngagementParam?) -> ResultMap? in value.flatMap { (value: EngagementParam) -> ResultMap in value.resultMap } } }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fetchType: WidgetFetchType? {
        get {
          return resultMap["fetchType"] as? WidgetFetchType
        }
        set {
          resultMap.updateValue(newValue, forKey: "fetchType")
        }
      }

      public var contentIds: [GraphQLID?]? {
        get {
          return resultMap["contentIds"] as? [GraphQLID?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "contentIds")
        }
      }

      public var params: [Param?]? {
        get {
          return (resultMap["params"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Param?] in value.map { (value: ResultMap?) -> Param? in value.flatMap { (value: ResultMap) -> Param in Param(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Param?]) -> [ResultMap?] in value.map { (value: Param?) -> ResultMap? in value.flatMap { (value: Param) -> ResultMap in value.resultMap } } }, forKey: "params")
        }
      }

      public var engagementParams: [EngagementParam?]? {
        get {
          return (resultMap["engagementParams"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EngagementParam?] in value.map { (value: ResultMap?) -> EngagementParam? in value.flatMap { (value: ResultMap) -> EngagementParam in EngagementParam(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [EngagementParam?]) -> [ResultMap?] in value.map { (value: EngagementParam?) -> ResultMap? in value.flatMap { (value: EngagementParam) -> ResultMap in value.resultMap } } }, forKey: "engagementParams")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Param: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WidgetParam"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("key", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(key: String, value: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "WidgetParam", "key": key, "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var key: String {
          get {
            return resultMap["key"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "key")
          }
        }

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }

      public struct EngagementParam: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WidgetParam"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("key", type: .nonNull(.scalar(String.self))),
            GraphQLField("value", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(key: String, value: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "WidgetParam", "key": key, "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var key: String {
          get {
            return resultMap["key"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "key")
          }
        }

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["WidgetVariationTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .nonNull(.scalar(Language.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: Language, title: String) {
          self.init(unsafeResultMap: ["__typename": "WidgetVariationTranslation", "language": language, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: Language {
          get {
            return resultMap["language"]! as! Language
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }
    }
  }

  public struct FragmentBasket: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentBasket on Basket {
        __typename
        grossAmount
        discountAmount
        netAmount
        seatInfo
        timeslot {
          __typename
          ...FragmentTimeslot
        }
        collectionDate
        collectionPreferenceType
        items {
          __typename
          id
          price
          modifierItemsPrice
          quantity
          totalPrice
          fulfilmentPoint {
            __typename
            ...FragmentFulfilmentPoint
          }
          productVariant {
            __typename
            ...FragmentProductVariant
          }
          product {
            __typename
            ...FragmentProduct
          }
          productModifierItems {
            __typename
            ...FragmentProductModifierItemSelection
          }
        }
      }
      """

    public static let possibleTypes: [String] = ["Basket"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("grossAmount", type: .scalar(Int.self)),
        GraphQLField("discountAmount", type: .scalar(Int.self)),
        GraphQLField("netAmount", type: .scalar(Int.self)),
        GraphQLField("seatInfo", type: .scalar(JSON.self)),
        GraphQLField("timeslot", type: .object(Timeslot.selections)),
        GraphQLField("collectionDate", type: .scalar(String.self)),
        GraphQLField("collectionPreferenceType", type: .scalar(CollectionPreferenceType.self)),
        GraphQLField("items", type: .list(.object(Item.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(grossAmount: Int? = nil, discountAmount: Int? = nil, netAmount: Int? = nil, seatInfo: JSON? = nil, timeslot: Timeslot? = nil, collectionDate: String? = nil, collectionPreferenceType: CollectionPreferenceType? = nil, items: [Item?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Basket", "grossAmount": grossAmount, "discountAmount": discountAmount, "netAmount": netAmount, "seatInfo": seatInfo, "timeslot": timeslot.flatMap { (value: Timeslot) -> ResultMap in value.resultMap }, "collectionDate": collectionDate, "collectionPreferenceType": collectionPreferenceType, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var grossAmount: Int? {
      get {
        return resultMap["grossAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "grossAmount")
      }
    }

    public var discountAmount: Int? {
      get {
        return resultMap["discountAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "discountAmount")
      }
    }

    public var netAmount: Int? {
      get {
        return resultMap["netAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "netAmount")
      }
    }

    public var seatInfo: JSON? {
      get {
        return resultMap["seatInfo"] as? JSON
      }
      set {
        resultMap.updateValue(newValue, forKey: "seatInfo")
      }
    }

    public var timeslot: Timeslot? {
      get {
        return (resultMap["timeslot"] as? ResultMap).flatMap { Timeslot(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "timeslot")
      }
    }

    public var collectionDate: String? {
      get {
        return resultMap["collectionDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionDate")
      }
    }

    public var collectionPreferenceType: CollectionPreferenceType? {
      get {
        return resultMap["collectionPreferenceType"] as? CollectionPreferenceType
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var items: [Item?]? {
      get {
        return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
      }
    }

    public struct Timeslot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Timeslot"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentTimeslot.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentTimeslot: FragmentTimeslot {
          get {
            return FragmentTimeslot(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Item: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["BasketItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("price", type: .scalar(Int.self)),
          GraphQLField("modifierItemsPrice", type: .scalar(Int.self)),
          GraphQLField("quantity", type: .scalar(Int.self)),
          GraphQLField("totalPrice", type: .scalar(Int.self)),
          GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
          GraphQLField("productVariant", type: .object(ProductVariant.selections)),
          GraphQLField("product", type: .object(Product.selections)),
          GraphQLField("productModifierItems", type: .list(.object(ProductModifierItem.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, price: Int? = nil, modifierItemsPrice: Int? = nil, quantity: Int? = nil, totalPrice: Int? = nil, fulfilmentPoint: FulfilmentPoint? = nil, productVariant: ProductVariant? = nil, product: Product? = nil, productModifierItems: [ProductModifierItem?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "BasketItem", "id": id, "price": price, "modifierItemsPrice": modifierItemsPrice, "quantity": quantity, "totalPrice": totalPrice, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "productVariant": productVariant.flatMap { (value: ProductVariant) -> ResultMap in value.resultMap }, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }, "productModifierItems": productModifierItems.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var price: Int? {
        get {
          return resultMap["price"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var modifierItemsPrice: Int? {
        get {
          return resultMap["modifierItemsPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "modifierItemsPrice")
        }
      }

      public var quantity: Int? {
        get {
          return resultMap["quantity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "quantity")
        }
      }

      public var totalPrice: Int? {
        get {
          return resultMap["totalPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPrice")
        }
      }

      public var fulfilmentPoint: FulfilmentPoint? {
        get {
          return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
        }
      }

      public var productVariant: ProductVariant? {
        get {
          return (resultMap["productVariant"] as? ResultMap).flatMap { ProductVariant(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "productVariant")
        }
      }

      public var product: Product? {
        get {
          return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "product")
        }
      }

      public var productModifierItems: [ProductModifierItem?]? {
        get {
          return (resultMap["productModifierItems"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductModifierItem?] in value.map { (value: ResultMap?) -> ProductModifierItem? in value.flatMap { (value: ResultMap) -> ProductModifierItem in ProductModifierItem(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }, forKey: "productModifierItems")
        }
      }

      public struct FulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPoint"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
            get {
              return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductVariant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProductVariant.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProductVariant: FragmentProductVariant {
            get {
              return FragmentProductVariant(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProduct.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProduct: FragmentProduct {
            get {
              return FragmentProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductModifierItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierItemSelection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProductModifierItemSelection.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProductModifierItemSelection: FragmentProductModifierItemSelection {
            get {
              return FragmentProductModifierItemSelection(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }

  public struct FragmentForm: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentForm on Form {
        __typename
        id
        reference
        imageUrl
        completionButtonUrl
        completionButtonTitle
        showCompletionDate
        allowUpdate
        refreshOnSuccess
        validationIntegration
        expiresIn
        translations {
          __typename
          language
          title
          description
          submitButtonTitle
          skipButtonTitle
          completionButtonTitle
          completionTitle
          completionDescription
        }
        fields {
          __typename
          type
          key
          validationRegex
          required
          sortId
          autoFill {
            __typename
            type
            field
          }
          translations {
            __typename
            title
            language
            description
            completionDescription
            skipButtonTitle
            completionTitle
            completionButtonTitle
            submitButtonTitle
          }
          selectOptions {
            __typename
            title
            value
            iconUrl
          }
        }
      }
      """

    public static let possibleTypes: [String] = ["Form"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("imageUrl", type: .scalar(String.self)),
        GraphQLField("completionButtonUrl", type: .scalar(String.self)),
        GraphQLField("completionButtonTitle", type: .scalar(String.self)),
        GraphQLField("showCompletionDate", type: .scalar(Bool.self)),
        GraphQLField("allowUpdate", type: .scalar(Bool.self)),
        GraphQLField("refreshOnSuccess", type: .scalar(Bool.self)),
        GraphQLField("validationIntegration", type: .scalar(String.self)),
        GraphQLField("expiresIn", type: .scalar(Int.self)),
        GraphQLField("translations", type: .nonNull(.list(.object(Translation.selections)))),
        GraphQLField("fields", type: .list(.object(Field.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, reference: String? = nil, imageUrl: String? = nil, completionButtonUrl: String? = nil, completionButtonTitle: String? = nil, showCompletionDate: Bool? = nil, allowUpdate: Bool? = nil, refreshOnSuccess: Bool? = nil, validationIntegration: String? = nil, expiresIn: Int? = nil, translations: [Translation?], fields: [Field?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Form", "id": id, "reference": reference, "imageUrl": imageUrl, "completionButtonUrl": completionButtonUrl, "completionButtonTitle": completionButtonTitle, "showCompletionDate": showCompletionDate, "allowUpdate": allowUpdate, "refreshOnSuccess": refreshOnSuccess, "validationIntegration": validationIntegration, "expiresIn": expiresIn, "translations": translations.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } }, "fields": fields.flatMap { (value: [Field?]) -> [ResultMap?] in value.map { (value: Field?) -> ResultMap? in value.flatMap { (value: Field) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var imageUrl: String? {
      get {
        return resultMap["imageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "imageUrl")
      }
    }

    public var completionButtonUrl: String? {
      get {
        return resultMap["completionButtonUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "completionButtonUrl")
      }
    }

    public var completionButtonTitle: String? {
      get {
        return resultMap["completionButtonTitle"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "completionButtonTitle")
      }
    }

    public var showCompletionDate: Bool? {
      get {
        return resultMap["showCompletionDate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "showCompletionDate")
      }
    }

    public var allowUpdate: Bool? {
      get {
        return resultMap["allowUpdate"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "allowUpdate")
      }
    }

    public var refreshOnSuccess: Bool? {
      get {
        return resultMap["refreshOnSuccess"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "refreshOnSuccess")
      }
    }

    public var validationIntegration: String? {
      get {
        return resultMap["validationIntegration"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "validationIntegration")
      }
    }

    public var expiresIn: Int? {
      get {
        return resultMap["expiresIn"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "expiresIn")
      }
    }

    public var translations: [Translation?] {
      get {
        return (resultMap["translations"] as! [ResultMap?]).map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } }, forKey: "translations")
      }
    }

    public var fields: [Field?]? {
      get {
        return (resultMap["fields"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Field?] in value.map { (value: ResultMap?) -> Field? in value.flatMap { (value: ResultMap) -> Field in Field(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Field?]) -> [ResultMap?] in value.map { (value: Field?) -> ResultMap? in value.flatMap { (value: Field) -> ResultMap in value.resultMap } } }, forKey: "fields")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FormTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("submitButtonTitle", type: .scalar(String.self)),
          GraphQLField("skipButtonTitle", type: .scalar(String.self)),
          GraphQLField("completionButtonTitle", type: .scalar(String.self)),
          GraphQLField("completionTitle", type: .scalar(String.self)),
          GraphQLField("completionDescription", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: String, title: String? = nil, description: String? = nil, submitButtonTitle: String? = nil, skipButtonTitle: String? = nil, completionButtonTitle: String? = nil, completionTitle: String? = nil, completionDescription: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "FormTranslation", "language": language, "title": title, "description": description, "submitButtonTitle": submitButtonTitle, "skipButtonTitle": skipButtonTitle, "completionButtonTitle": completionButtonTitle, "completionTitle": completionTitle, "completionDescription": completionDescription])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: String {
        get {
          return resultMap["language"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var submitButtonTitle: String? {
        get {
          return resultMap["submitButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "submitButtonTitle")
        }
      }

      public var skipButtonTitle: String? {
        get {
          return resultMap["skipButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "skipButtonTitle")
        }
      }

      public var completionButtonTitle: String? {
        get {
          return resultMap["completionButtonTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionButtonTitle")
        }
      }

      public var completionTitle: String? {
        get {
          return resultMap["completionTitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionTitle")
        }
      }

      public var completionDescription: String? {
        get {
          return resultMap["completionDescription"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completionDescription")
        }
      }
    }

    public struct Field: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FormField"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("key", type: .scalar(String.self)),
          GraphQLField("validationRegex", type: .scalar(String.self)),
          GraphQLField("required", type: .scalar(Bool.self)),
          GraphQLField("sortId", type: .scalar(Int.self)),
          GraphQLField("autoFill", type: .object(AutoFill.selections)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
          GraphQLField("selectOptions", type: .list(.object(SelectOption.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: String? = nil, key: String? = nil, validationRegex: String? = nil, `required`: Bool? = nil, sortId: Int? = nil, autoFill: AutoFill? = nil, translations: [Translation?]? = nil, selectOptions: [SelectOption?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "FormField", "type": type, "key": key, "validationRegex": validationRegex, "required": `required`, "sortId": sortId, "autoFill": autoFill.flatMap { (value: AutoFill) -> ResultMap in value.resultMap }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, "selectOptions": selectOptions.flatMap { (value: [SelectOption?]) -> [ResultMap?] in value.map { (value: SelectOption?) -> ResultMap? in value.flatMap { (value: SelectOption) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var key: String? {
        get {
          return resultMap["key"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "key")
        }
      }

      public var validationRegex: String? {
        get {
          return resultMap["validationRegex"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "validationRegex")
        }
      }

      public var `required`: Bool? {
        get {
          return resultMap["required"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "required")
        }
      }

      public var sortId: Int? {
        get {
          return resultMap["sortId"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "sortId")
        }
      }

      public var autoFill: AutoFill? {
        get {
          return (resultMap["autoFill"] as? ResultMap).flatMap { AutoFill(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "autoFill")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public var selectOptions: [SelectOption?]? {
        get {
          return (resultMap["selectOptions"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SelectOption?] in value.map { (value: ResultMap?) -> SelectOption? in value.flatMap { (value: ResultMap) -> SelectOption in SelectOption(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SelectOption?]) -> [ResultMap?] in value.map { (value: SelectOption?) -> ResultMap? in value.flatMap { (value: SelectOption) -> ResultMap in value.resultMap } } }, forKey: "selectOptions")
        }
      }

      public struct AutoFill: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AutoFill"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("field", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(type: String? = nil, field: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "AutoFill", "type": type, "field": field])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        public var field: String? {
          get {
            return resultMap["field"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "field")
          }
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FormTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("language", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("completionDescription", type: .scalar(String.self)),
            GraphQLField("skipButtonTitle", type: .scalar(String.self)),
            GraphQLField("completionTitle", type: .scalar(String.self)),
            GraphQLField("completionButtonTitle", type: .scalar(String.self)),
            GraphQLField("submitButtonTitle", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, language: String, description: String? = nil, completionDescription: String? = nil, skipButtonTitle: String? = nil, completionTitle: String? = nil, completionButtonTitle: String? = nil, submitButtonTitle: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FormTranslation", "title": title, "language": language, "description": description, "completionDescription": completionDescription, "skipButtonTitle": skipButtonTitle, "completionTitle": completionTitle, "completionButtonTitle": completionButtonTitle, "submitButtonTitle": submitButtonTitle])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var language: String {
          get {
            return resultMap["language"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var completionDescription: String? {
          get {
            return resultMap["completionDescription"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionDescription")
          }
        }

        public var skipButtonTitle: String? {
          get {
            return resultMap["skipButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "skipButtonTitle")
          }
        }

        public var completionTitle: String? {
          get {
            return resultMap["completionTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionTitle")
          }
        }

        public var completionButtonTitle: String? {
          get {
            return resultMap["completionButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completionButtonTitle")
          }
        }

        public var submitButtonTitle: String? {
          get {
            return resultMap["submitButtonTitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "submitButtonTitle")
          }
        }
      }

      public struct SelectOption: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FormSelectOption"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("iconUrl", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String? = nil, value: String? = nil, iconUrl: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "FormSelectOption", "title": title, "value": value, "iconUrl": iconUrl])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var iconUrl: String? {
          get {
            return resultMap["iconUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "iconUrl")
          }
        }
      }
    }
  }

  public struct FragmentFulfilmentPoint: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentFulfilmentPoint on FulfilmentPoint {
        __typename
        id
        externalId
        reference
        type
        status
        imageUrl
        mapImageUrl
        lat
        long
        waitTime
        prepTime
        position
        translations {
          __typename
          language
          title
          description
          collectionNote
          collectionNotes {
            __typename
            VIRTUAL_QUEUE_PREORDER
            VIRTUAL_QUEUE_CHECKIN
          }
        }
        seatForm {
          __typename
          ...FragmentForm
        }
        categories {
          __typename
          ...FragmentFulfilmentPointCategory
        }
        venue {
          __typename
          ...FragmentVenue
        }
        timeslots {
          __typename
          ...FragmentTimeslot
        }
      }
      """

    public static let possibleTypes: [String] = ["FulfilmentPoint"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(FulfilmentPointType.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("imageUrl", type: .scalar(String.self)),
        GraphQLField("mapImageUrl", type: .scalar(String.self)),
        GraphQLField("lat", type: .scalar(Double.self)),
        GraphQLField("long", type: .scalar(Double.self)),
        GraphQLField("waitTime", type: .scalar(Int.self)),
        GraphQLField("prepTime", type: .scalar(Int.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
        GraphQLField("seatForm", type: .object(SeatForm.selections)),
        GraphQLField("categories", type: .list(.object(Category.selections))),
        GraphQLField("venue", type: .object(Venue.selections)),
        GraphQLField("timeslots", type: .list(.object(Timeslot.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, type: FulfilmentPointType? = nil, status: String? = nil, imageUrl: String? = nil, mapImageUrl: String? = nil, lat: Double? = nil, long: Double? = nil, waitTime: Int? = nil, prepTime: Int? = nil, position: Int? = nil, translations: [Translation?]? = nil, seatForm: SeatForm? = nil, categories: [Category?]? = nil, venue: Venue? = nil, timeslots: [Timeslot?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "FulfilmentPoint", "id": id, "externalId": externalId, "reference": reference, "type": type, "status": status, "imageUrl": imageUrl, "mapImageUrl": mapImageUrl, "lat": lat, "long": long, "waitTime": waitTime, "prepTime": prepTime, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, "seatForm": seatForm.flatMap { (value: SeatForm) -> ResultMap in value.resultMap }, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "venue": venue.flatMap { (value: Venue) -> ResultMap in value.resultMap }, "timeslots": timeslots.flatMap { (value: [Timeslot?]) -> [ResultMap?] in value.map { (value: Timeslot?) -> ResultMap? in value.flatMap { (value: Timeslot) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var type: FulfilmentPointType? {
      get {
        return resultMap["type"] as? FulfilmentPointType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var imageUrl: String? {
      get {
        return resultMap["imageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "imageUrl")
      }
    }

    public var mapImageUrl: String? {
      get {
        return resultMap["mapImageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mapImageUrl")
      }
    }

    public var lat: Double? {
      get {
        return resultMap["lat"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lat")
      }
    }

    public var long: Double? {
      get {
        return resultMap["long"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "long")
      }
    }

    public var waitTime: Int? {
      get {
        return resultMap["waitTime"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "waitTime")
      }
    }

    public var prepTime: Int? {
      get {
        return resultMap["prepTime"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "prepTime")
      }
    }

    public var position: Int? {
      get {
        return resultMap["position"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "position")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public var seatForm: SeatForm? {
      get {
        return (resultMap["seatForm"] as? ResultMap).flatMap { SeatForm(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "seatForm")
      }
    }

    public var categories: [Category?]? {
      get {
        return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
      }
    }

    public var venue: Venue? {
      get {
        return (resultMap["venue"] as? ResultMap).flatMap { Venue(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "venue")
      }
    }

    public var timeslots: [Timeslot?]? {
      get {
        return (resultMap["timeslots"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Timeslot?] in value.map { (value: ResultMap?) -> Timeslot? in value.flatMap { (value: ResultMap) -> Timeslot in Timeslot(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Timeslot?]) -> [ResultMap?] in value.map { (value: Timeslot?) -> ResultMap? in value.flatMap { (value: Timeslot) -> ResultMap in value.resultMap } } }, forKey: "timeslots")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPointTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("collectionNote", type: .scalar(String.self)),
          GraphQLField("collectionNotes", type: .object(CollectionNote.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil, description: String? = nil, collectionNote: String? = nil, collectionNotes: CollectionNote? = nil) {
        self.init(unsafeResultMap: ["__typename": "FulfilmentPointTranslation", "language": language, "title": title, "description": description, "collectionNote": collectionNote, "collectionNotes": collectionNotes.flatMap { (value: CollectionNote) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var collectionNote: String? {
        get {
          return resultMap["collectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "collectionNote")
        }
      }

      public var collectionNotes: CollectionNote? {
        get {
          return (resultMap["collectionNotes"] as? ResultMap).flatMap { CollectionNote(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "collectionNotes")
        }
      }

      public struct CollectionNote: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CollectionNotes"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("VIRTUAL_QUEUE_PREORDER", type: .scalar(String.self)),
            GraphQLField("VIRTUAL_QUEUE_CHECKIN", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(virtualQueuePreorder: String? = nil, virtualQueueCheckin: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "CollectionNotes", "VIRTUAL_QUEUE_PREORDER": virtualQueuePreorder, "VIRTUAL_QUEUE_CHECKIN": virtualQueueCheckin])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var virtualQueuePreorder: String? {
          get {
            return resultMap["VIRTUAL_QUEUE_PREORDER"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "VIRTUAL_QUEUE_PREORDER")
          }
        }

        public var virtualQueueCheckin: String? {
          get {
            return resultMap["VIRTUAL_QUEUE_CHECKIN"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "VIRTUAL_QUEUE_CHECKIN")
          }
        }
      }
    }

    public struct SeatForm: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Form"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentForm.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentForm: FragmentForm {
          get {
            return FragmentForm(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentFulfilmentPointCategory.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentFulfilmentPointCategory: FragmentFulfilmentPointCategory {
          get {
            return FragmentFulfilmentPointCategory(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Venue: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Venue"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentVenue.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, label: String? = nil, name: String? = nil, status: String? = nil, isDefault: Bool? = nil, description: String? = nil, imageUrl: String? = nil, mapImageUrl: String? = nil, geoLat: Double? = nil, geoLong: Double? = nil, geoLatNorthWest: Double? = nil, geoLongNorthWest: Double? = nil, geoLatSouthEast: Double? = nil, geoLongSouthEast: Double? = nil, city: String? = nil, externalId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, venueIconUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Venue", "id": id, "label": label, "name": name, "status": status, "isDefault": isDefault, "description": description, "imageUrl": imageUrl, "mapImageUrl": mapImageUrl, "geoLat": geoLat, "geoLong": geoLong, "geoLatNorthWest": geoLatNorthWest, "geoLongNorthWest": geoLongNorthWest, "geoLatSouthEast": geoLatSouthEast, "geoLongSouthEast": geoLongSouthEast, "city": city, "externalId": externalId, "createdAt": createdAt, "updatedAt": updatedAt, "venueIconUrl": venueIconUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentVenue: FragmentVenue {
          get {
            return FragmentVenue(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Timeslot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Timeslot"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentTimeslot.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentTimeslot: FragmentTimeslot {
          get {
            return FragmentTimeslot(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct FragmentFulfilmentPointCategory: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentFulfilmentPointCategory on FulfilmentPointCategory {
        __typename
        id
        reference
        status
        iconImageUrl
        position
        createdAt
        updatedAt
        translations {
          __typename
          language
          title
        }
      }
      """

    public static let possibleTypes: [String] = ["FulfilmentPointCategory"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("iconImageUrl", type: .scalar(String.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, reference: String? = nil, status: String? = nil, iconImageUrl: String? = nil, position: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategory", "id": id, "reference": reference, "status": status, "iconImageUrl": iconImageUrl, "position": position, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var iconImageUrl: String? {
      get {
        return resultMap["iconImageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "iconImageUrl")
      }
    }

    public var position: Int? {
      get {
        return resultMap["position"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "position")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPointCategoryTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "FulfilmentPointCategoryTranslation", "language": language, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }

  public struct FragmentOrder: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentOrder on Order {
        __typename
        id
        orderNumber
        qrCodeUrl
        collectionDate
        status
        state {
          __typename
          workingState
          status
          translations {
            __typename
            language
            title
            description
          }
        }
        paymentStatus
        grossAmount
        discountAmount
        netAmount
        estimatedAt
        createdAt
        updatedAt
        items {
          __typename
          id
          product {
            __typename
            ...FragmentProduct
          }
          productVariant {
            __typename
            ...FragmentProductVariant
          }
          fulfilmentPoint {
            __typename
            ...FragmentFulfilmentPoint
          }
          productModifierItems {
            __typename
            ...FragmentProductModifierItemSelection
          }
          price
          modifierItemsPrice
          quantity
          totalPrice
          title
          subtitle
          imageUrl
        }
        orderNotes {
          __typename
          id
          note
          author
          createdAt
          updatedAt
        }
        timeslot {
          __typename
          ...FragmentTimeslot
        }
        fulfilmentPoint {
          __typename
          ...FragmentFulfilmentPoint
        }
        user {
          __typename
          ...FragmentUser
        }
        collectionPreferenceType
        seatInfo
      }
      """

    public static let possibleTypes: [String] = ["Order"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("orderNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("qrCodeUrl", type: .scalar(String.self)),
        GraphQLField("collectionDate", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(OrderStatus.self)),
        GraphQLField("state", type: .object(State.selections)),
        GraphQLField("paymentStatus", type: .scalar(PaymentOrderStatus.self)),
        GraphQLField("grossAmount", type: .scalar(Int.self)),
        GraphQLField("discountAmount", type: .scalar(Int.self)),
        GraphQLField("netAmount", type: .scalar(Int.self)),
        GraphQLField("estimatedAt", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("orderNotes", type: .list(.object(OrderNote.selections))),
        GraphQLField("timeslot", type: .object(Timeslot.selections)),
        GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
        GraphQLField("user", type: .object(User.selections)),
        GraphQLField("collectionPreferenceType", type: .scalar(CollectionPreferenceType.self)),
        GraphQLField("seatInfo", type: .scalar(JSON.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, orderNumber: String, qrCodeUrl: String? = nil, collectionDate: String? = nil, status: OrderStatus? = nil, state: State? = nil, paymentStatus: PaymentOrderStatus? = nil, grossAmount: Int? = nil, discountAmount: Int? = nil, netAmount: Int? = nil, estimatedAt: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, items: [Item?]? = nil, orderNotes: [OrderNote?]? = nil, timeslot: Timeslot? = nil, fulfilmentPoint: FulfilmentPoint? = nil, user: User? = nil, collectionPreferenceType: CollectionPreferenceType? = nil, seatInfo: JSON? = nil) {
      self.init(unsafeResultMap: ["__typename": "Order", "id": id, "orderNumber": orderNumber, "qrCodeUrl": qrCodeUrl, "collectionDate": collectionDate, "status": status, "state": state.flatMap { (value: State) -> ResultMap in value.resultMap }, "paymentStatus": paymentStatus, "grossAmount": grossAmount, "discountAmount": discountAmount, "netAmount": netAmount, "estimatedAt": estimatedAt, "createdAt": createdAt, "updatedAt": updatedAt, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, "orderNotes": orderNotes.flatMap { (value: [OrderNote?]) -> [ResultMap?] in value.map { (value: OrderNote?) -> ResultMap? in value.flatMap { (value: OrderNote) -> ResultMap in value.resultMap } } }, "timeslot": timeslot.flatMap { (value: Timeslot) -> ResultMap in value.resultMap }, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "collectionPreferenceType": collectionPreferenceType, "seatInfo": seatInfo])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var orderNumber: String {
      get {
        return resultMap["orderNumber"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderNumber")
      }
    }

    public var qrCodeUrl: String? {
      get {
        return resultMap["qrCodeUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "qrCodeUrl")
      }
    }

    public var collectionDate: String? {
      get {
        return resultMap["collectionDate"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionDate")
      }
    }

    public var status: OrderStatus? {
      get {
        return resultMap["status"] as? OrderStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var state: State? {
      get {
        return (resultMap["state"] as? ResultMap).flatMap { State(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "state")
      }
    }

    public var paymentStatus: PaymentOrderStatus? {
      get {
        return resultMap["paymentStatus"] as? PaymentOrderStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "paymentStatus")
      }
    }

    public var grossAmount: Int? {
      get {
        return resultMap["grossAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "grossAmount")
      }
    }

    public var discountAmount: Int? {
      get {
        return resultMap["discountAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "discountAmount")
      }
    }

    public var netAmount: Int? {
      get {
        return resultMap["netAmount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "netAmount")
      }
    }

    public var estimatedAt: String? {
      get {
        return resultMap["estimatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "estimatedAt")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var items: [Item?]? {
      get {
        return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
      }
    }

    public var orderNotes: [OrderNote?]? {
      get {
        return (resultMap["orderNotes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [OrderNote?] in value.map { (value: ResultMap?) -> OrderNote? in value.flatMap { (value: ResultMap) -> OrderNote in OrderNote(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [OrderNote?]) -> [ResultMap?] in value.map { (value: OrderNote?) -> ResultMap? in value.flatMap { (value: OrderNote) -> ResultMap in value.resultMap } } }, forKey: "orderNotes")
      }
    }

    public var timeslot: Timeslot? {
      get {
        return (resultMap["timeslot"] as? ResultMap).flatMap { Timeslot(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "timeslot")
      }
    }

    public var fulfilmentPoint: FulfilmentPoint? {
      get {
        return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
      }
    }

    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public var collectionPreferenceType: CollectionPreferenceType? {
      get {
        return resultMap["collectionPreferenceType"] as? CollectionPreferenceType
      }
      set {
        resultMap.updateValue(newValue, forKey: "collectionPreferenceType")
      }
    }

    public var seatInfo: JSON? {
      get {
        return resultMap["seatInfo"] as? JSON
      }
      set {
        resultMap.updateValue(newValue, forKey: "seatInfo")
      }
    }

    public struct State: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderState"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("workingState", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(workingState: String? = nil, status: String? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderState", "workingState": workingState, "status": status, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var workingState: String? {
        get {
          return resultMap["workingState"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "workingState")
        }
      }

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderStateTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: String? = nil, title: String? = nil, description: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "OrderStateTranslation", "language": language, "title": title, "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: String? {
          get {
            return resultMap["language"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }
      }
    }

    public struct Item: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("product", type: .object(Product.selections)),
          GraphQLField("productVariant", type: .object(ProductVariant.selections)),
          GraphQLField("fulfilmentPoint", type: .object(FulfilmentPoint.selections)),
          GraphQLField("productModifierItems", type: .list(.object(ProductModifierItem.selections))),
          GraphQLField("price", type: .scalar(Int.self)),
          GraphQLField("modifierItemsPrice", type: .scalar(Int.self)),
          GraphQLField("quantity", type: .scalar(Int.self)),
          GraphQLField("totalPrice", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("imageUrl", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, product: Product? = nil, productVariant: ProductVariant? = nil, fulfilmentPoint: FulfilmentPoint? = nil, productModifierItems: [ProductModifierItem?]? = nil, price: Int? = nil, modifierItemsPrice: Int? = nil, quantity: Int? = nil, totalPrice: Int? = nil, title: String? = nil, subtitle: String? = nil, imageUrl: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderItem", "id": id, "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }, "productVariant": productVariant.flatMap { (value: ProductVariant) -> ResultMap in value.resultMap }, "fulfilmentPoint": fulfilmentPoint.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap }, "productModifierItems": productModifierItems.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }, "price": price, "modifierItemsPrice": modifierItemsPrice, "quantity": quantity, "totalPrice": totalPrice, "title": title, "subtitle": subtitle, "imageUrl": imageUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var product: Product? {
        get {
          return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "product")
        }
      }

      public var productVariant: ProductVariant? {
        get {
          return (resultMap["productVariant"] as? ResultMap).flatMap { ProductVariant(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "productVariant")
        }
      }

      public var fulfilmentPoint: FulfilmentPoint? {
        get {
          return (resultMap["fulfilmentPoint"] as? ResultMap).flatMap { FulfilmentPoint(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "fulfilmentPoint")
        }
      }

      public var productModifierItems: [ProductModifierItem?]? {
        get {
          return (resultMap["productModifierItems"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ProductModifierItem?] in value.map { (value: ResultMap?) -> ProductModifierItem? in value.flatMap { (value: ResultMap) -> ProductModifierItem in ProductModifierItem(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ProductModifierItem?]) -> [ResultMap?] in value.map { (value: ProductModifierItem?) -> ResultMap? in value.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap } } }, forKey: "productModifierItems")
        }
      }

      public var price: Int? {
        get {
          return resultMap["price"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public var modifierItemsPrice: Int? {
        get {
          return resultMap["modifierItemsPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "modifierItemsPrice")
        }
      }

      public var quantity: Int? {
        get {
          return resultMap["quantity"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "quantity")
        }
      }

      public var totalPrice: Int? {
        get {
          return resultMap["totalPrice"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalPrice")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var subtitle: String? {
        get {
          return resultMap["subtitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtitle")
        }
      }

      public var imageUrl: String? {
        get {
          return resultMap["imageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }

      public struct Product: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Product"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProduct.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProduct: FragmentProduct {
            get {
              return FragmentProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductVariant: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductVariant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProductVariant.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProductVariant: FragmentProductVariant {
            get {
              return FragmentProductVariant(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct FulfilmentPoint: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["FulfilmentPoint"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
            get {
              return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct ProductModifierItem: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierItemSelection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProductModifierItemSelection.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProductModifierItemSelection: FragmentProductModifierItemSelection {
            get {
              return FragmentProductModifierItemSelection(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }

    public struct OrderNote: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderNote"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("note", type: .scalar(String.self)),
          GraphQLField("author", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int? = nil, note: String? = nil, author: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "OrderNote", "id": id, "note": note, "author": author, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var note: String? {
        get {
          return resultMap["note"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "note")
        }
      }

      public var author: String? {
        get {
          return resultMap["author"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "author")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }

    public struct Timeslot: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Timeslot"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentTimeslot.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentTimeslot: FragmentTimeslot {
          get {
            return FragmentTimeslot(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct FulfilmentPoint: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPoint"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
          get {
            return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentUser.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentUser: FragmentUser {
          get {
            return FragmentUser(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct FragmentPaymentIntent: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentPaymentIntent on PaymentIntent {
        __typename
        id
        orderType
        orderId
        status
        paymentSource {
          __typename
          ...FragmentPaymentSource
        }
        amount
        currency
        livemode
        cancellationReason
        savePaymentSource
        nextAction {
          __typename
          type
          url
        }
        lastPaymentError
      }
      """

    public static let possibleTypes: [String] = ["PaymentIntent"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("orderType", type: .nonNull(.scalar(OrderType.self))),
        GraphQLField("orderId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .nonNull(.scalar(PaymentStatus.self))),
        GraphQLField("paymentSource", type: .object(PaymentSource.selections)),
        GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
        GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        GraphQLField("livemode", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("cancellationReason", type: .scalar(CancellationReason.self)),
        GraphQLField("savePaymentSource", type: .scalar(Bool.self)),
        GraphQLField("nextAction", type: .object(NextAction.selections)),
        GraphQLField("lastPaymentError", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, orderType: OrderType, orderId: GraphQLID, status: PaymentStatus, paymentSource: PaymentSource? = nil, amount: Int, currency: String, livemode: Bool, cancellationReason: CancellationReason? = nil, savePaymentSource: Bool? = nil, nextAction: NextAction? = nil, lastPaymentError: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "PaymentIntent", "id": id, "orderType": orderType, "orderId": orderId, "status": status, "paymentSource": paymentSource.flatMap { (value: PaymentSource) -> ResultMap in value.resultMap }, "amount": amount, "currency": currency, "livemode": livemode, "cancellationReason": cancellationReason, "savePaymentSource": savePaymentSource, "nextAction": nextAction.flatMap { (value: NextAction) -> ResultMap in value.resultMap }, "lastPaymentError": lastPaymentError])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var orderType: OrderType {
      get {
        return resultMap["orderType"]! as! OrderType
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderType")
      }
    }

    public var orderId: GraphQLID {
      get {
        return resultMap["orderId"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "orderId")
      }
    }

    public var status: PaymentStatus {
      get {
        return resultMap["status"]! as! PaymentStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var paymentSource: PaymentSource? {
      get {
        return (resultMap["paymentSource"] as? ResultMap).flatMap { PaymentSource(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "paymentSource")
      }
    }

    public var amount: Int {
      get {
        return resultMap["amount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "amount")
      }
    }

    public var currency: String {
      get {
        return resultMap["currency"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "currency")
      }
    }

    public var livemode: Bool {
      get {
        return resultMap["livemode"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "livemode")
      }
    }

    public var cancellationReason: CancellationReason? {
      get {
        return resultMap["cancellationReason"] as? CancellationReason
      }
      set {
        resultMap.updateValue(newValue, forKey: "cancellationReason")
      }
    }

    public var savePaymentSource: Bool? {
      get {
        return resultMap["savePaymentSource"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "savePaymentSource")
      }
    }

    public var nextAction: NextAction? {
      get {
        return (resultMap["nextAction"] as? ResultMap).flatMap { NextAction(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "nextAction")
      }
    }

    public var lastPaymentError: String? {
      get {
        return resultMap["lastPaymentError"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastPaymentError")
      }
    }

    public struct PaymentSource: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentSource"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentPaymentSource.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentPaymentSource: FragmentPaymentSource {
          get {
            return FragmentPaymentSource(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct NextAction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentAction"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(PaymentActionType.self)),
          GraphQLField("url", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(type: PaymentActionType? = nil, url: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentAction", "type": type, "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var type: PaymentActionType? {
        get {
          return resultMap["type"] as? PaymentActionType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var url: String? {
        get {
          return resultMap["url"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }

  public struct FragmentPaymentSource: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentPaymentSource on PaymentSource {
        __typename
        id
        type
        default
        billingDetails {
          __typename
          address {
            __typename
            city
            country
            line1
            line2
            postalCode
            state
          }
          email
          name
          phone
        }
        card {
          __typename
          ...FragmentCard
        }
      }
      """

    public static let possibleTypes: [String] = ["PaymentSource"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("type", type: .nonNull(.scalar(PaymentSourceType.self))),
        GraphQLField("default", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("billingDetails", type: .object(BillingDetail.selections)),
        GraphQLField("card", type: .object(Card.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, type: PaymentSourceType, `default`: Bool, billingDetails: BillingDetail? = nil, card: Card? = nil) {
      self.init(unsafeResultMap: ["__typename": "PaymentSource", "id": id, "type": type, "default": `default`, "billingDetails": billingDetails.flatMap { (value: BillingDetail) -> ResultMap in value.resultMap }, "card": card.flatMap { (value: Card) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var type: PaymentSourceType {
      get {
        return resultMap["type"]! as! PaymentSourceType
      }
      set {
        resultMap.updateValue(newValue, forKey: "type")
      }
    }

    public var `default`: Bool {
      get {
        return resultMap["default"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "default")
      }
    }

    public var billingDetails: BillingDetail? {
      get {
        return (resultMap["billingDetails"] as? ResultMap).flatMap { BillingDetail(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "billingDetails")
      }
    }

    public var card: Card? {
      get {
        return (resultMap["card"] as? ResultMap).flatMap { Card(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "card")
      }
    }

    public struct BillingDetail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentSourceBillingDetails"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .object(Address.selections)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(address: Address? = nil, email: String? = nil, name: String? = nil, phone: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentSourceBillingDetails", "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }, "email": email, "name": name, "phone": phone])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var address: Address? {
        get {
          return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "address")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentSourceAddress"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("city", type: .scalar(String.self)),
            GraphQLField("country", type: .scalar(String.self)),
            GraphQLField("line1", type: .scalar(String.self)),
            GraphQLField("line2", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("state", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(city: String? = nil, country: String? = nil, line1: String? = nil, line2: String? = nil, postalCode: String? = nil, state: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PaymentSourceAddress", "city": city, "country": country, "line1": line1, "line2": line2, "postalCode": postalCode, "state": state])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var city: String? {
          get {
            return resultMap["city"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "city")
          }
        }

        public var country: String? {
          get {
            return resultMap["country"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "country")
          }
        }

        public var line1: String? {
          get {
            return resultMap["line1"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "line1")
          }
        }

        public var line2: String? {
          get {
            return resultMap["line2"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "line2")
          }
        }

        public var postalCode: String? {
          get {
            return resultMap["postalCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "postalCode")
          }
        }

        public var state: String? {
          get {
            return resultMap["state"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "state")
          }
        }
      }
    }

    public struct Card: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Card"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentCard.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(brand: String, numberToken: String? = nil, expMonth: String? = nil, expYear: String? = nil, last4: String, fingerprint: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Card", "brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "last4": last4, "fingerprint": fingerprint])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentCard: FragmentCard {
          get {
            return FragmentCard(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct FragmentCard: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentCard on Card {
        __typename
        brand
        numberToken
        expMonth
        expYear
        last4
        fingerprint
      }
      """

    public static let possibleTypes: [String] = ["Card"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("brand", type: .nonNull(.scalar(String.self))),
        GraphQLField("numberToken", type: .scalar(String.self)),
        GraphQLField("expMonth", type: .scalar(String.self)),
        GraphQLField("expYear", type: .scalar(String.self)),
        GraphQLField("last4", type: .nonNull(.scalar(String.self))),
        GraphQLField("fingerprint", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(brand: String, numberToken: String? = nil, expMonth: String? = nil, expYear: String? = nil, last4: String, fingerprint: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Card", "brand": brand, "numberToken": numberToken, "expMonth": expMonth, "expYear": expYear, "last4": last4, "fingerprint": fingerprint])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var brand: String {
      get {
        return resultMap["brand"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "brand")
      }
    }

    public var numberToken: String? {
      get {
        return resultMap["numberToken"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "numberToken")
      }
    }

    public var expMonth: String? {
      get {
        return resultMap["expMonth"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "expMonth")
      }
    }

    public var expYear: String? {
      get {
        return resultMap["expYear"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "expYear")
      }
    }

    public var last4: String {
      get {
        return resultMap["last4"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "last4")
      }
    }

    public var fingerprint: String? {
      get {
        return resultMap["fingerprint"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "fingerprint")
      }
    }
  }

  public struct FragmentProduct: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProduct on Product {
        __typename
        id
        status
        reference
        externalId
        images {
          __typename
          imageUrl
          position
        }
        modifierLists {
          __typename
          id
          status
          externalId
          reference
          multipleSelect
          mandatorySelect
          maxAllowed
          items {
            __typename
            ...FragmentProductModifierItem
          }
          translations {
            __typename
            language
            title
          }
        }
        variants {
          __typename
          ...FragmentProductVariant
        }
        categories {
          __typename
          id
          externalId
          reference
          status
          position
          translations {
            __typename
            language
            title
          }
        }
        fulfilmentPoints {
          __typename
          ...FragmentFulfilmentPoint
        }
        translations {
          __typename
          id
          language
          title
          description
        }
      }
      """

    public static let possibleTypes: [String] = ["Product"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("modifierLists", type: .list(.object(ModifierList.selections))),
        GraphQLField("variants", type: .list(.object(Variant.selections))),
        GraphQLField("categories", type: .list(.object(Category.selections))),
        GraphQLField("fulfilmentPoints", type: .list(.object(FulfilmentPoint.selections))),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, status: String? = nil, reference: String? = nil, externalId: String? = nil, images: [Image?]? = nil, modifierLists: [ModifierList?]? = nil, variants: [Variant?]? = nil, categories: [Category?]? = nil, fulfilmentPoints: [FulfilmentPoint?]? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Product", "id": id, "status": status, "reference": reference, "externalId": externalId, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "modifierLists": modifierLists.flatMap { (value: [ModifierList?]) -> [ResultMap?] in value.map { (value: ModifierList?) -> ResultMap? in value.flatMap { (value: ModifierList) -> ResultMap in value.resultMap } } }, "variants": variants.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, "categories": categories.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, "fulfilmentPoints": fulfilmentPoints.flatMap { (value: [FulfilmentPoint?]) -> [ResultMap?] in value.map { (value: FulfilmentPoint?) -> ResultMap? in value.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap } } }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var images: [Image?]? {
      get {
        return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
      }
    }

    public var modifierLists: [ModifierList?]? {
      get {
        return (resultMap["modifierLists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ModifierList?] in value.map { (value: ResultMap?) -> ModifierList? in value.flatMap { (value: ResultMap) -> ModifierList in ModifierList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ModifierList?]) -> [ResultMap?] in value.map { (value: ModifierList?) -> ResultMap? in value.flatMap { (value: ModifierList) -> ResultMap in value.resultMap } } }, forKey: "modifierLists")
      }
    }

    public var variants: [Variant?]? {
      get {
        return (resultMap["variants"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Variant?] in value.map { (value: ResultMap?) -> Variant? in value.flatMap { (value: ResultMap) -> Variant in Variant(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Variant?]) -> [ResultMap?] in value.map { (value: Variant?) -> ResultMap? in value.flatMap { (value: Variant) -> ResultMap in value.resultMap } } }, forKey: "variants")
      }
    }

    public var categories: [Category?]? {
      get {
        return (resultMap["categories"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Category?] in value.map { (value: ResultMap?) -> Category? in value.flatMap { (value: ResultMap) -> Category in Category(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Category?]) -> [ResultMap?] in value.map { (value: Category?) -> ResultMap? in value.flatMap { (value: Category) -> ResultMap in value.resultMap } } }, forKey: "categories")
      }
    }

    public var fulfilmentPoints: [FulfilmentPoint?]? {
      get {
        return (resultMap["fulfilmentPoints"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FulfilmentPoint?] in value.map { (value: ResultMap?) -> FulfilmentPoint? in value.flatMap { (value: ResultMap) -> FulfilmentPoint in FulfilmentPoint(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FulfilmentPoint?]) -> [ResultMap?] in value.map { (value: FulfilmentPoint?) -> ResultMap? in value.flatMap { (value: FulfilmentPoint) -> ResultMap in value.resultMap } } }, forKey: "fulfilmentPoints")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Image: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductImage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("imageUrl", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(imageUrl: String? = nil, position: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductImage", "imageUrl": imageUrl, "position": position])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var imageUrl: String? {
        get {
          return resultMap["imageUrl"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "imageUrl")
        }
      }

      public var position: Int? {
        get {
          return resultMap["position"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }
    }

    public struct ModifierList: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductModifierList"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("reference", type: .scalar(String.self)),
          GraphQLField("multipleSelect", type: .scalar(Bool.self)),
          GraphQLField("mandatorySelect", type: .scalar(Bool.self)),
          GraphQLField("maxAllowed", type: .scalar(Int.self)),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: String? = nil, externalId: String? = nil, reference: String? = nil, multipleSelect: Bool? = nil, mandatorySelect: Bool? = nil, maxAllowed: Int? = nil, items: [Item?]? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductModifierList", "id": id, "status": status, "externalId": externalId, "reference": reference, "multipleSelect": multipleSelect, "mandatorySelect": mandatorySelect, "maxAllowed": maxAllowed, "items": items.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var externalId: String? {
        get {
          return resultMap["externalId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "externalId")
        }
      }

      public var reference: String? {
        get {
          return resultMap["reference"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reference")
        }
      }

      public var multipleSelect: Bool? {
        get {
          return resultMap["multipleSelect"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "multipleSelect")
        }
      }

      public var mandatorySelect: Bool? {
        get {
          return resultMap["mandatorySelect"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "mandatorySelect")
        }
      }

      public var maxAllowed: Int? {
        get {
          return resultMap["maxAllowed"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "maxAllowed")
        }
      }

      public var items: [Item?]? {
        get {
          return (resultMap["items"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Item?] in value.map { (value: ResultMap?) -> Item? in value.flatMap { (value: ResultMap) -> Item in Item(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Item?]) -> [ResultMap?] in value.map { (value: Item?) -> ResultMap? in value.flatMap { (value: Item) -> ResultMap in value.resultMap } } }, forKey: "items")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierItem"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(FragmentProductModifierItem.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var fragmentProductModifierItem: FragmentProductModifierItem {
            get {
              return FragmentProductModifierItem(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductModifierListTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .scalar(Language.self)),
            GraphQLField("title", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: Language? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductModifierListTranslation", "language": language, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: Language? {
          get {
            return resultMap["language"] as? Language
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }
    }

    public struct Variant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductVariant"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentProductVariant.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentProductVariant: FragmentProductVariant {
          get {
            return FragmentProductVariant(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductCategory"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("externalId", type: .scalar(String.self)),
          GraphQLField("reference", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("position", type: .scalar(Int.self)),
          GraphQLField("translations", type: .list(.object(Translation.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, status: String? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductCategory", "id": id, "externalId": externalId, "reference": reference, "status": status, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var externalId: String? {
        get {
          return resultMap["externalId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "externalId")
        }
      }

      public var reference: String? {
        get {
          return resultMap["reference"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "reference")
        }
      }

      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var position: Int? {
        get {
          return resultMap["position"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }

      public var translations: [Translation?]? {
        get {
          return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
        }
      }

      public struct Translation: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ProductCategoryTranslation"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("language", type: .scalar(Language.self)),
            GraphQLField("title", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(language: Language? = nil, title: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ProductCategoryTranslation", "language": language, "title": title])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var language: Language? {
          get {
            return resultMap["language"] as? Language
          }
          set {
            resultMap.updateValue(newValue, forKey: "language")
          }
        }

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }
    }

    public struct FulfilmentPoint: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["FulfilmentPoint"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentFulfilmentPoint.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentFulfilmentPoint: FragmentFulfilmentPoint {
          get {
            return FragmentFulfilmentPoint(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("language", type: .scalar(String.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, language: String? = nil, title: String? = nil, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductTranslation", "id": id, "language": language, "title": title, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var language: String? {
        get {
          return resultMap["language"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }

  public struct FragmentProductModifierItem: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProductModifierItem on ProductModifierItem {
        __typename
        id
        status
        externalId
        additionalPrice
        position
        translations {
          __typename
          language
          title
        }
      }
      """

    public static let possibleTypes: [String] = ["ProductModifierItem"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("status", type: .scalar(ProductModifierItemStatus.self)),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("additionalPrice", type: .scalar(Int.self)),
        GraphQLField("position", type: .scalar(Int.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, status: ProductModifierItemStatus? = nil, externalId: String? = nil, additionalPrice: Int? = nil, position: Int? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "ProductModifierItem", "id": id, "status": status, "externalId": externalId, "additionalPrice": additionalPrice, "position": position, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var status: ProductModifierItemStatus? {
      get {
        return resultMap["status"] as? ProductModifierItemStatus
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var additionalPrice: Int? {
      get {
        return resultMap["additionalPrice"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "additionalPrice")
      }
    }

    public var position: Int? {
      get {
        return resultMap["position"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "position")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductModifierItemTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductModifierItemTranslation", "language": language, "title": title])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }

  public struct FragmentProductModifierItemSelection: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProductModifierItemSelection on ProductModifierItemSelection {
        __typename
        productModifierItem {
          __typename
          ...FragmentProductModifierItem
        }
        quantity
        totalPrice
      }
      """

    public static let possibleTypes: [String] = ["ProductModifierItemSelection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("productModifierItem", type: .object(ProductModifierItem.selections)),
        GraphQLField("quantity", type: .scalar(Int.self)),
        GraphQLField("totalPrice", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(productModifierItem: ProductModifierItem? = nil, quantity: Int? = nil, totalPrice: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "ProductModifierItemSelection", "productModifierItem": productModifierItem.flatMap { (value: ProductModifierItem) -> ResultMap in value.resultMap }, "quantity": quantity, "totalPrice": totalPrice])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var productModifierItem: ProductModifierItem? {
      get {
        return (resultMap["productModifierItem"] as? ResultMap).flatMap { ProductModifierItem(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "productModifierItem")
      }
    }

    public var quantity: Int? {
      get {
        return resultMap["quantity"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "quantity")
      }
    }

    public var totalPrice: Int? {
      get {
        return resultMap["totalPrice"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalPrice")
      }
    }

    public struct ProductModifierItem: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductModifierItem"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentProductModifierItem.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentProductModifierItem: FragmentProductModifierItem {
          get {
            return FragmentProductModifierItem(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct FragmentProducts: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProducts on ProductEdge {
        __typename
        edges {
          __typename
          ...FragmentProduct
        }
        nextPage
      }
      """

    public static let possibleTypes: [String] = ["ProductEdge"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
        GraphQLField("nextPage", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(edges: [Edge?]? = nil, nextPage: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "ProductEdge", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "nextPage": nextPage])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var edges: [Edge?]? {
      get {
        return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
      }
    }

    public var nextPage: Int? {
      get {
        return resultMap["nextPage"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "nextPage")
      }
    }

    public struct Edge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Product"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(FragmentProduct.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var fragmentProduct: FragmentProduct {
          get {
            return FragmentProduct(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }

  public struct FragmentProductVariant: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentProductVariant on ProductVariant {
        __typename
        id
        externalId
        price
        createdAt
        updatedAt
        translations {
          __typename
          title
          language
        }
      }
      """

    public static let possibleTypes: [String] = ["ProductVariant"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("price", type: .scalar(Int.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, externalId: String? = nil, price: Int? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "ProductVariant", "id": id, "externalId": externalId, "price": price, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var price: Int? {
      get {
        return resultMap["price"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "price")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ProductVariantTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("language", type: .scalar(Language.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String? = nil, language: Language? = nil) {
        self.init(unsafeResultMap: ["__typename": "ProductVariantTranslation", "title": title, "language": language])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }
    }
  }

  public struct FragmentTimeslot: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentTimeslot on Timeslot {
        __typename
        id
        externalId
        reference
        startTime
        endTime
        createdAt
        updatedAt
        translations {
          __typename
          language
          title
          description
          collectionNote
        }
      }
      """

    public static let possibleTypes: [String] = ["Timeslot"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("reference", type: .scalar(String.self)),
        GraphQLField("startTime", type: .scalar(String.self)),
        GraphQLField("endTime", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("translations", type: .list(.object(Translation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, externalId: String? = nil, reference: String? = nil, startTime: String? = nil, endTime: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, translations: [Translation?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Timeslot", "id": id, "externalId": externalId, "reference": reference, "startTime": startTime, "endTime": endTime, "createdAt": createdAt, "updatedAt": updatedAt, "translations": translations.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var reference: String? {
      get {
        return resultMap["reference"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "reference")
      }
    }

    public var startTime: String? {
      get {
        return resultMap["startTime"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "startTime")
      }
    }

    public var endTime: String? {
      get {
        return resultMap["endTime"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "endTime")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var translations: [Translation?]? {
      get {
        return (resultMap["translations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Translation?] in value.map { (value: ResultMap?) -> Translation? in value.flatMap { (value: ResultMap) -> Translation in Translation(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Translation?]) -> [ResultMap?] in value.map { (value: Translation?) -> ResultMap? in value.flatMap { (value: Translation) -> ResultMap in value.resultMap } } }, forKey: "translations")
      }
    }

    public struct Translation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TimeslotTranslation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("language", type: .scalar(Language.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("collectionNote", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(language: Language? = nil, title: String? = nil, description: String? = nil, collectionNote: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "TimeslotTranslation", "language": language, "title": title, "description": description, "collectionNote": collectionNote])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var language: Language? {
        get {
          return resultMap["language"] as? Language
        }
        set {
          resultMap.updateValue(newValue, forKey: "language")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var collectionNote: String? {
        get {
          return resultMap["collectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "collectionNote")
        }
      }
    }
  }

  public struct FragmentUser: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentUser on User {
        __typename
        id
        email
        token
        authType
        status
        lastLogin
        ticketsFetchedAt
        firstName
        lastName
        gender
        phone
        dob
        userConsent {
          __typename
          id
          marketingConsent
          analysisConsent
        }
      }
      """

    public static let possibleTypes: [String] = ["User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("token", type: .scalar(String.self)),
        GraphQLField("authType", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("lastLogin", type: .scalar(String.self)),
        GraphQLField("ticketsFetchedAt", type: .scalar(String.self)),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("dob", type: .scalar(String.self)),
        GraphQLField("userConsent", type: .object(UserConsent.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, email: String? = nil, token: String? = nil, authType: String? = nil, status: String? = nil, lastLogin: String? = nil, ticketsFetchedAt: String? = nil, firstName: String? = nil, lastName: String? = nil, gender: String? = nil, phone: String? = nil, dob: String? = nil, userConsent: UserConsent? = nil) {
      self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "token": token, "authType": authType, "status": status, "lastLogin": lastLogin, "ticketsFetchedAt": ticketsFetchedAt, "firstName": firstName, "lastName": lastName, "gender": gender, "phone": phone, "dob": dob, "userConsent": userConsent.flatMap { (value: UserConsent) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var email: String? {
      get {
        return resultMap["email"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "email")
      }
    }

    public var token: String? {
      get {
        return resultMap["token"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "token")
      }
    }

    public var authType: String? {
      get {
        return resultMap["authType"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "authType")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var lastLogin: String? {
      get {
        return resultMap["lastLogin"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastLogin")
      }
    }

    public var ticketsFetchedAt: String? {
      get {
        return resultMap["ticketsFetchedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "ticketsFetchedAt")
      }
    }

    public var firstName: String? {
      get {
        return resultMap["firstName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return resultMap["lastName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastName")
      }
    }

    public var gender: String? {
      get {
        return resultMap["gender"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "gender")
      }
    }

    public var phone: String? {
      get {
        return resultMap["phone"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "phone")
      }
    }

    public var dob: String? {
      get {
        return resultMap["dob"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "dob")
      }
    }

    public var userConsent: UserConsent? {
      get {
        return (resultMap["userConsent"] as? ResultMap).flatMap { UserConsent(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "userConsent")
      }
    }

    public struct UserConsent: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserConsent"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("marketingConsent", type: .scalar(Bool.self)),
          GraphQLField("analysisConsent", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, marketingConsent: Bool? = nil, analysisConsent: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "UserConsent", "id": id, "marketingConsent": marketingConsent, "analysisConsent": analysisConsent])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var marketingConsent: Bool? {
        get {
          return resultMap["marketingConsent"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "marketingConsent")
        }
      }

      public var analysisConsent: Bool? {
        get {
          return resultMap["analysisConsent"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "analysisConsent")
        }
      }
    }
  }

  public struct FragmentVenue: GraphQLFragment {
    /// The raw GraphQL definition of this fragment.
    public static let fragmentDefinition: String =
      """
      fragment FragmentVenue on Venue {
        __typename
        id
        label
        name
        status
        isDefault
        description
        imageUrl
        mapImageUrl
        geoLat
        geoLong
        geoLatNorthWest
        geoLongNorthWest
        geoLatSouthEast
        geoLongSouthEast
        city
        externalId
        createdAt
        updatedAt
        venueIconUrl
      }
      """

    public static let possibleTypes: [String] = ["Venue"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("label", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(String.self)),
        GraphQLField("isDefault", type: .scalar(Bool.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("imageUrl", type: .scalar(String.self)),
        GraphQLField("mapImageUrl", type: .scalar(String.self)),
        GraphQLField("geoLat", type: .scalar(Double.self)),
        GraphQLField("geoLong", type: .scalar(Double.self)),
        GraphQLField("geoLatNorthWest", type: .scalar(Double.self)),
        GraphQLField("geoLongNorthWest", type: .scalar(Double.self)),
        GraphQLField("geoLatSouthEast", type: .scalar(Double.self)),
        GraphQLField("geoLongSouthEast", type: .scalar(Double.self)),
        GraphQLField("city", type: .scalar(String.self)),
        GraphQLField("externalId", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("updatedAt", type: .scalar(String.self)),
        GraphQLField("venueIconUrl", type: .scalar(String.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, label: String? = nil, name: String? = nil, status: String? = nil, isDefault: Bool? = nil, description: String? = nil, imageUrl: String? = nil, mapImageUrl: String? = nil, geoLat: Double? = nil, geoLong: Double? = nil, geoLatNorthWest: Double? = nil, geoLongNorthWest: Double? = nil, geoLatSouthEast: Double? = nil, geoLongSouthEast: Double? = nil, city: String? = nil, externalId: String? = nil, createdAt: String? = nil, updatedAt: String? = nil, venueIconUrl: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Venue", "id": id, "label": label, "name": name, "status": status, "isDefault": isDefault, "description": description, "imageUrl": imageUrl, "mapImageUrl": mapImageUrl, "geoLat": geoLat, "geoLong": geoLong, "geoLatNorthWest": geoLatNorthWest, "geoLongNorthWest": geoLongNorthWest, "geoLatSouthEast": geoLatSouthEast, "geoLongSouthEast": geoLongSouthEast, "city": city, "externalId": externalId, "createdAt": createdAt, "updatedAt": updatedAt, "venueIconUrl": venueIconUrl])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    public var label: String? {
      get {
        return resultMap["label"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "label")
      }
    }

    public var name: String? {
      get {
        return resultMap["name"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var status: String? {
      get {
        return resultMap["status"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }

    public var isDefault: Bool? {
      get {
        return resultMap["isDefault"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "isDefault")
      }
    }

    public var description: String? {
      get {
        return resultMap["description"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "description")
      }
    }

    public var imageUrl: String? {
      get {
        return resultMap["imageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "imageUrl")
      }
    }

    public var mapImageUrl: String? {
      get {
        return resultMap["mapImageUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mapImageUrl")
      }
    }

    public var geoLat: Double? {
      get {
        return resultMap["geoLat"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLat")
      }
    }

    public var geoLong: Double? {
      get {
        return resultMap["geoLong"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLong")
      }
    }

    public var geoLatNorthWest: Double? {
      get {
        return resultMap["geoLatNorthWest"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLatNorthWest")
      }
    }

    public var geoLongNorthWest: Double? {
      get {
        return resultMap["geoLongNorthWest"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLongNorthWest")
      }
    }

    public var geoLatSouthEast: Double? {
      get {
        return resultMap["geoLatSouthEast"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLatSouthEast")
      }
    }

    public var geoLongSouthEast: Double? {
      get {
        return resultMap["geoLongSouthEast"] as? Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "geoLongSouthEast")
      }
    }

    public var city: String? {
      get {
        return resultMap["city"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "city")
      }
    }

    public var externalId: String? {
      get {
        return resultMap["externalId"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "externalId")
      }
    }

    public var createdAt: String? {
      get {
        return resultMap["createdAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "createdAt")
      }
    }

    public var updatedAt: String? {
      get {
        return resultMap["updatedAt"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "updatedAt")
      }
    }

    public var venueIconUrl: String? {
      get {
        return resultMap["venueIconUrl"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "venueIconUrl")
      }
    }
  }
}
