(module
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $i32_f32_=>_none (func (param i32 f32)))
 (type $i32_=>_f32 (func (param i32) (result f32)))
 (type $i32_=>_none (func (param i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_=>_f64 (func (param i32) (result f64)))
 (type $i32_f64_=>_none (func (param i32 f64)))
 (type $f64_=>_f64 (func (param f64) (result f64)))
 (type $i32_i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32 i32)))
 (type $i32_f32_i32_i32_i32_=>_none (func (param i32 f32 i32 i32 i32)))
 (type $f32_=>_f32 (func (param f32) (result f32)))
 (type $f32_f32_=>_f32 (func (param f32 f32) (result f32)))
 (type $none_=>_none (func))
 (type $i32_i32_=>_f32 (func (param i32 i32) (result f32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $f32_i32_i32_i32_i32_=>_none (func (param f32 i32 i32 i32 i32)))
 (type $i32_i32_i32_=>_f32 (func (param i32 i32 i32) (result f32)))
 (type $i32_i32_f32_=>_none (func (param i32 i32 f32)))
 (type $i64_=>_i32 (func (param i64) (result i32)))
 (type $i32_f64_f64_f64_i32_i32_i32_=>_none (func (param i32 f64 f64 f64 i32 i32 i32)))
 (type $i32_v128_=>_none (func (param i32 v128)))
 (type $f32_=>_none (func (param f32)))
 (type $f32_i32_i32_i32_=>_none (func (param f32 i32 i32 i32)))
 (type $i32_i32_i32_i32_i32_f32_f32_=>_none (func (param i32 i32 i32 i32 i32 f32 f32)))
 (type $i32_i32_i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32 i32 i32)))
 (type $f32_f32_f32_f32_=>_f32 (func (param f32 f32 f32 f32) (result f32)))
 (type $i32_f32_=>_f32 (func (param i32 f32) (result f32)))
 (type $f32_f32_f32_=>_f32 (func (param f32 f32 f32) (result f32)))
 (type $f64_f64_i32_=>_f64 (func (param f64 f64 i32) (result f64)))
 (type $i32_f32_=>_i32 (func (param i32 f32) (result i32)))
 (type $i32_f32_i32_=>_f32 (func (param i32 f32 i32) (result f32)))
 (type $i32_=>_v128 (func (param i32) (result v128)))
 (type $i32_i32_i32_i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_i32_f32_i32_=>_f32 (func (param i32 i32 f32 i32) (result f32)))
 (import "env" "memory" (memory $0 (shared 17 3000)))
 (import "env" "table" (table $0 10 funcref))
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "env" "setCtrlInstanceAt" (func $assembly/env/setCtrlInstanceAt (param i32 i32) (result i32)))
 (import "env" "resetCtrlInstance" (func $assembly/env/resetCtrlInstance (param i32) (result i32)))
 (import "env" "logf" (func $assembly/env/logf (param f32)))
 (global $assembly/core/constants/WAVETABLE_SIZE i32 (i32.const 8192))
 (global $assembly/core/constants/DELAY_MAX_SIZE i32 (i32.const 65536))
 (global $assembly/core/constants/SAMPLE_MAX_SIZE i32 (i32.const 65536))
 (global $assembly/core/constants/ANTIALIAS_WAVETABLE_OVERSAMPLING i32 (i32.const 1))
 (global $assembly/core/antialias-wavetable/Real.sign (mut f32) (f32.const 1))
 (global $assembly/core/wave/seed (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld0 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld1 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld2 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld3 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld4 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld5 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld6 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld7 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld8 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld9 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld10 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/ld11 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md0 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md1 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md2 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md3 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md4 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md5 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md6 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md7 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md8 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md9 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md10 (mut i32) (i32.const 0))
 (global $assembly/gen/daverb/md11 (mut i32) (i32.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/math/rempio2f_y (mut f64) (f64.const 0))
 (global $~lib/math/rempio2_y0 (mut f64) (f64.const 0))
 (global $~lib/math/rempio2_y1 (mut f64) (f64.const 0))
 (global $~lib/math/res128_hi (mut i64) (i64.const 0))
 (global $~lib/util/math/log_tail (mut f64) (f64.const 0))
 (data $0 (i32.const 1048588) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $1 (i32.const 1048620) ",\00\00\00\00\00\00\00\00\00\00\00\05\00\00\00\10\00\00\00 \00\10\00 \00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $2 (i32.const 1048668) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $3 (i32.const 1048700) ",\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\10\00\00\00p\00\10\00p\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $4 (i32.const 1048748) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data $5 (i32.const 1048796) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00s\00t\00a\00t\00i\00c\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00\00\00\00\00")
 (data $6 (i32.const 1048860) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00\00\00\00\00")
 (data $7 (i32.const 1048924) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $8 (i32.const 1048992) "\f8\ac\b1k($\f7?\00\b0\cd\ee_\t\e1\bf\a1\cc\d2f\f7\e1\f6?\00\d0v\bd\94\84\e0\bf\8a\d40\0e=\a1\f6?\00\f8\e8\aeC\01\e0\bf\85l\d02\eca\f6?\00@\0b6\c5\fe\de\bf\f8\98\11\95\fa#\f6?\00\e0\b7\1a\d9\fd\dd\bfl\02\cf\a4[\e7\f5?\00\90\c7\0c\ae\ff\dc\bf\b8O!Z\05\ac\f5?\00\a0\fd\118\04\dc\bf\1en\16\0f\edq\f5?\00\e0:2g\0b\db\bf5\f8\0bY\t9\f5?\00\b0-Z/\15\da\bf\dd\ada\edO\01\f5?\00`\f8Z\7f!\d9\bf\d0{H\8e\b8\ca\f4?\00\90q\b0M0\d8\bf\eeO3\b49\95\f4?\00\e0\a9\f9\89A\d7\bfi\d5\af\df\cb`\f4?\00\90\19\b5+U\d6\bfS\b9\e4Nf-\f4?\00\10\9b\a2#k\d5\bf\a6\d8\1d\11\01\fb\f3?\00\a0_\0fe\83\d4\bf6X\0c\b7\95\c9\f3?\00\a0\f67\e9\9d\d3\bfJ\fd\b6J\1c\99\f3?\00`\8dS\a1\ba\d2\bf\b5\99\e0\0c\8ei\f3?\00@\ca@\83\d9\d1\bf\b2\e7\13\82\e4:\f3?\00\e0@:\85\fa\d0\bf\b1\bd\85\19\19\r\f3?\000\e72\9c\1d\d0\bf\d7q\b2\ca%\e0\f2?\00`\fa\a2}\85\ce\bf\82\cd\13\cf\04\b4\f2?\00\80=c\c8\d3\cc\bfP\cb|,\b0\88\f2?\00\a0\14L\03&\cb\bf\e5M\94c\"^\f2?\00\e0O/\1c|\c9\bf\b1\15\86=V4\f2?\00\00\80?\02\d6\c7\bf8\af>\e3F\0b\f2?\00\e0\05\1a\a73\c6\bf\dd\a3\cd\fd\ee\e2\f1?\00\00W\e9\f5\94\c4\bf09\0bXJ\bb\f1?\00\a0\e0$\e4\f9\c2\bf\00\"\7f\84S\94\f1?\00\c0\fdZYb\c1\bf<\d7\d5\c0\06n\f1?\00\80\bdu\9a\9c\bf\bf\c2\e4\b7G_H\f1?\00\c0\f9[W{\bc\bf\d1\85\00\adX#\f1?\00\80\f4\0f\c6`\b9\bf\'\"S\0f\f0\fe\f0?\00\00\b6G\e2L\b6\bf\8f:\d0w \db\f0?\00@\01\b2x?\b3\bf\d9\80Y\d6\e6\b7\f0?\00\c0B\1a}8\b0\bf\8d@{\fe>\95\f0?\00\00\b5\08\92o\aa\bf\83;\c5\ca%s\f0?\00\00wO\95z\a4\bf\\\1b\r\e4\97Q\f0?\00\00\0c\c5\a8#\9d\bf\a2\8e \c1\910\f0?\00\00x)&j\91\bf!~\b3%\10\10\f0?\00\00\e8\d8\f8 w\bfk\a7\ca\f9~\c0\ef?\00\00P\b1S\fe\86?\84\f1\f6\d3eD\ef?\00\80\0f\e1\cc\1c\a1?\7f\10\84\9f\07\cc\ee?\00\80\8b\8c\fcM\ac?\e8Z\97\99:W\ee?\00@W\1e2\aa\b3?\e6=\bd\f0\d6\e5\ed?\00\80\8b\d0\a0\18\b9?\b38\ff\81\b6w\ed?\00@\04\da\e9r\be?C\e9Mr\b5\0c\ed?\00`\7fP\d2\dc\c1?cu\0e\dc\b2\a4\ec?\00\a0\de\03\abv\c4?Q\cb\d6\e8\8e?\ec?\00 \e2wC\07\c7?L\0c\02O+\dd\eb?\00@\a9\8b\de\8e\c9?\ca\15`\00l}\eb?\00\e0\d2j\b8\r\cc?\8f3.n6 \eb?\00\e0\ce\af\n\84\ce?9P)&p\c5\ea?\00\80g\b4\ny\d0?\dd1\'\bc\01m\ea?\00\c0\01h\05\ac\d1?\8b\f1?\bc\d3\16\ea?\00\e0\fe\d4\11\db\d2?\ad\fegI\d1\c2\e9?\00\80\c5NF\06\d4?\02\99|\f4\e4p\e9?\00\f0:\t\be-\d5?\f2\bc\829\fb \e9?\00\d0P \90Q\d6?\f1Y\f7\87\01\d3\e8?\00\f0\ea\cd\d2q\d7?m\f6\b9\eb\e5\86\e8?\00\90}\85\9c\8e\d8?\94\b9X\b6\97<\e8?\00`\e1U\01\a8\d9?\"\10\c6\ff\05\f4\e7?\00\d0\d3n\18\be\da?\ca\15\14\18\"\ad\e7?\00\e0\a0\ae\f2\d0\db?\8c\ff\9e\f9\dcg\e7?\00@\bf=\a4\e0\dc?")
 (data $9 (i32.const 1050016) "\8e\n\b9\12\00 \e6?\05\b6D\06\ab\04\89<\a64W\04\00`\e6?\a9\f7b\ea\9b\ffa<\c5\f2%\c3\ff\9f\e6?\ba\90<\cb\cf~\82<\04Z\b98\00\e0\e6?&\93sV\88\ff\88<\e3\94\99\e0\ff\1f\e7?\b1\82_\'@\fd\8a<\10\0eY\15\00`\e7?A\83#\b4u\fdr\bc\d5[e\12\00\a0\e7?v+$|\e6\08x<\a6\e9Y2\00\e0\e7?\b7\"\f6&\e4\08b\bc\d2\b2\b4\ed\ff\1f\e8?/\c9\a5\1eF\02\84\bc\c3\fc\fa-\00`\e8?\1f\9a\f2\a2\f4\f7m<Pk\8c\f7\ff\9f\e8?\fd\95I\tS\04\8e\bcf\15g9\00\e0\e8?E{\c7\be\f3\04\8a\bcE\17\bf\e2\ff\1f\e9?< \0e@4\faw\bc\d1\9f\\\cc\ff_\e9?]i\a0\05\80\ffv\bcgG\ba;\00\a0\e9?\03~\ec\c4\c4\f8p<\a5-\b9\e7\ff\df\e9?\02F\8cG\d9\7f\8e<\af\fd.\d7\ff\1f\ea?~\ae\cdMU\0cj\bc\95\ff\04\de\ff_\ea?k\b2\e9\8c\a9}\86<+\8d^\ca\ff\9f\ea?\de\13L\b5\c9\84\82\bc\ea\03\ad\dd\ff\df\ea?<.`\ea\c8\12X<M=\r\f1\ff\1f\eb?\9cx\'\ad\dd\fa\8e\bcZ\16!\ce\ff_\eb?7\12\c6\19\17\cbS<t\e6P\d9\ff\9f\eb?\00\ce\94A\d9\f7s<\af\a8\9c\13\00\e0\eb?\c0\9b]!\c4\nu<\99\dfF[\00 \ec?\c9\c1\e9S\a6\eek<\ae\f7\b9@\00`\ec?\d6pJ\'\9f\07|\bc\8a\fdUb\00\a0\ec?\1fL\e8v@\0bz\bc]\tL\d9\ff\df\ec?\d7\b5\9a\f93\f9\88<\cf\d6u\f9\ff\1f\ed?\be\e1_f\08,X\bc\93\1cV\a2\ff_\ed?\f3\95\d2\9b(\04{\bc\0c\8b\"\9d\ff\9f\ed?6\a2\0f4Q\02\87<\16~\bce\00\e0\ed?\0c\d8\a4\16\1e\01u\bc\91G\f6\02\00 \ee?\e0b\ef\t/\80\89<\d8\a6\d7W\00`\ee?\fa\f7\0cXu\0b~\bc\0c\c0\ed\'\00\a0\ee?\11\98E\t\83\84\8c\bc|\cb\f5l\00\e0\ee?\f4v\15\95\'\80\8f\bc\cc}+x\00 \ef?\8fStr\d9\81\8f\bc\nE\0c&\00`\ef?\dc\ff\'\'\00q@\bc3\d5\8c\e8\ff\9f\ef?\b0\a8\fd\e1\dc\1bX\bc\89\86\0f\d5\ff\df\ef?n\8e\91\cb\1a\f9\87<g#)\04\00 \f0?\81F2e\f3\7f\9b<h\d6\e3\e3\ff_\f0?{\95\ae\dd\08\fa\86<W\a7\85\n\00\a0\f0?\91\fb\d3\80\de\e2W\bc\cc?_\1a\00\e0\f0?\14\f0\c5\053\82\91\bc\f5\ba\af\f8\ff\1f\f1?\c2\ba\80f\bb\fa\8b\bc\ad\91M\e5\ff_\f1?\ef\e77\17\12\7f\9d\bc\e16\ac\11\00\a0\f1?\ff\f5\16\05\n\00\9c<HB\c8\19\00\e0\f1?\a0]\da\e4\fb\82\90\bcn^\fe\0f\00 \f2?C\fb\9cL\d0\fd\88\bc\91\d8\9f&\00`\f2?\82\d1\94y*\fe\8c<\da\e6\a6)\00\a0\f2?\c5\8b^qs\02p\bc9>)\e0\ff\df\f2?\f9\a6\b2\da9|\9b<\82\f0\dc\f7\ff\1f\f3?TR\dcn3\f1}<`\8bZ\f0\ff_\f3?\eb1\cdLV\03\9e\bc\cc\ae\0e.\00\a0\f3?w\a4\d3K\e7\f0u<6\b2;\04\00\e0\f3?3\88\9d\14\cb}\9c<\ff\87\d1\02\00 \f4?(=-\cf\af\08~<\b1|8\r\00`\f4?\a6\99e\857\08\82<\89\9fV\04\00\a0\f4?\d2\bcO\90\\\fa\89\bc\f3C5\04\00\e0\f4?)S\17\ed%\11x\bc\0f\7f\02\cc\ff\1f\f5?\dcTw\84\d8\83\98<o\b3\87\fd\ff_\f5?\07(\d01\e7\t\87\bc\ba\f7\1d\f2\ff\9f\f5?\02{rh\9f\f7\87<\814\fc\eb\ff\df\f5?>\e90.\90\80\91\bc")
 (data $10 (i32.const 1051052) "<\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00\00\00\00\00\00\00\00\00")
 (data $11 (i32.const 1051116) "\1c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\08\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00")
 (data $12 (i32.const 1051148) "|\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
 (data $13 (i32.const 1051280) ")\15DNn\83\f9\a2\c0\dd4\f5\d1W\'\fcA\90C<\99\95b\dba\c5\bb\de\abcQ\fe")
 (data $14 (i32.const 1051324) "\1c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\08\00\00\00\02\00\00\00\00\00\00\00\00\00\00\00")
 (data $15 (i32.const 1051356) "\1c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\08\00\00\00\03\00\00\00\00\00\00\00\00\00\00\00")
 (data $16 (i32.const 1051388) "\1c\00\00\00\00\00\00\00\00\00\00\00\13\00\00\00\08\00\00\00\04\00\00\00\00\00\00\00\00\00\00\00")
 (data $17 (i32.const 1051424) "n\83\f9\a2\00\00\00\00\d1W\'\fc)\15DN\99\95b\db\c0\dd4\f5\abcQ\feA\90C<:n$\b7a\c5\bb\de\ea.I\06\e0\d2MB\1c\eb\1d\fe\1c\92\d1\t\f55\82\e8>\a7)\b1&p\9c\e9\84D\bb.9\d6\919A~_\b4\8b_\84\9c\f49S\83\ff\97\f8\1f;(\f9\bd\8b\11/\ef\0f\98\05\de\cf~6m\1fm\nZf?FO\b7\t\cb\'\c7\ba\'u-\ea_\9e\f79\07={\f1\e5\eb\b1_\fbk\ea\92R\8aF0\03V\08]\8d\1f \bc\cf\f0\abk{\fca\91\e3\a9\1d6\f4\9a_\85\99e\08\1b\e6^\80\d8\ff\8d@h\a0\14W\15\06\061\'sM")
 (data $18 (i32.const 1051628) "\1c\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\08\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00")
 (data $19 (i32.const 1051660) "\1c\00\00\00\00\00\00\00\00\00\00\00\15\00\00\00\08\00\00\00\06\00\00\00\00\00\00\00\00\00\00\00")
 (data $20 (i32.const 1051692) "\1c\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\08\00\00\00\07\00\00\00\00\00\00\00\00\00\00\00")
 (data $21 (i32.const 1051728) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\f0?n\bf\88\1aO;\9b<53\fb\a9=\f6\ef?]\dc\d8\9c\13`q\bca\80w>\9a\ec\ef?\d1f\87\10z^\90\bc\85\7fn\e8\15\e3\ef?\13\f6g5R\d2\8c<t\85\15\d3\b0\d9\ef?\fa\8e\f9#\80\ce\8b\bc\de\f6\dd)k\d0\ef?a\c8\e6aN\f7`<\c8\9bu\18E\c7\ef?\99\d33[\e4\a3\90<\83\f3\c6\ca>\be\ef?m{\83]\a6\9a\97<\0f\89\f9lX\b5\ef?\fc\ef\fd\92\1a\b5\8e<\f7Gr+\92\ac\ef?\d1\9c/p=\be><\a2\d1\d32\ec\a3\ef?\0bn\90\894\03j\bc\1b\d3\fe\aff\9b\ef?\0e\bd/*RV\95\bcQ[\12\d0\01\93\ef?U\eaN\8c\ef\80P\bc\cc1l\c0\bd\8a\ef?\16\f4\d5\b9#\c9\91\bc\e0-\a9\ae\9a\82\ef?\afU\\\e9\e3\d3\80<Q\8e\a5\c8\98z\ef?H\93\a5\ea\15\1b\80\bc{Q}<\b8r\ef?=2\deU\f0\1f\8f\bc\ea\8d\8c8\f9j\ef?\bfS\13?\8c\89\8b<u\cbo\eb[c\ef?&\eb\11v\9c\d9\96\bc\d4\\\04\84\e0[\ef?`/:>\f7\ec\9a<\aa\b9h1\87T\ef?\9d8\86\cb\82\e7\8f\bc\1d\d9\fc\"PM\ef?\8d\c3\a6DAo\8a<\d6\8cb\88;F\ef?}\04\e4\b0\05z\80<\96\dc}\91I?\ef?\94\a8\a8\e3\fd\8e\96<8bunz8\ef?}Ht\f2\18^\87<?\a6\b2O\ce1\ef?\f2\e7\1f\98+G\80<\dd|\e2eE+\ef?^\08q?{\b8\96\bc\81c\f5\e1\df$\ef?1\ab\tm\e1\f7\82<\e1\de\1f\f5\9d\1e\ef?\fa\bfo\1a\9b!=\bc\90\d9\da\d0\7f\18\ef?\b4\n\0cr\827\8b<\0b\03\e4\a6\85\12\ef?\8f\cb\ce\89\92\14n<V/>\a9\af\0c\ef?\b6\ab\b0MuM\83<\15\b71\n\fe\06\ef?Lt\ac\e2\01B\86<1\d8L\fcp\01\ef?J\f8\d3]9\dd\8f<\ff\16d\b2\08\fc\ee?\04[\8e;\80\a3\86\bc\f1\9f\92_\c5\f6\ee?hPK\cc\edJ\92\bc\cb\a9:7\a7\f1\ee?\8e-Q\1b\f8\07\99\bcf\d8\05m\ae\ec\ee?\d26\94>\e8\d1q\bc\f7\9f\e54\db\e7\ee?\15\1b\ce\b3\19\19\99\bc\e5\a8\13\c3-\e3\ee?mL*\a7H\9f\85<\"4\12L\a6\de\ee?\8ai(z`\12\93\bc\1c\80\ac\04E\da\ee?[\89\17H\8f\a7X\bc*.\f7!\n\d6\ee?\1b\9aIg\9b,|\bc\97\a8P\d9\f5\d1\ee?\11\ac\c2`\edcC<-\89a`\08\ce\ee?\efd\06;\tf\96<W\00\1d\edA\ca\ee?y\03\a1\da\e1\ccn<\d0<\c1\b5\a2\c6\ee?0\12\0f?\8e\ff\93<\de\d3\d7\f0*\c3\ee?\b0\afz\bb\ce\90v<\'*6\d5\da\bf\ee?w\e0T\eb\bd\1d\93<\r\dd\fd\99\b2\bc\ee?\8e\a3q\004\94\8f\bc\a7,\9dv\b2\b9\ee?I\a3\93\dc\cc\de\87\bcBf\cf\a2\da\b6\ee?_8\0f\bd\c6\dex\bc\82O\9dV+\b4\ee?\f6\\{\ecF\12\86\bc\0f\92]\ca\a4\b1\ee?\8e\d7\fd\18\055\93<\da\'\b56G\af\ee?\05\9b\8a/\b7\98{<\fd\c7\97\d4\12\ad\ee?\tT\1c\e2\e1c\90<)TH\dd\07\ab\ee?\ea\c6\19P\85\c74<\b7FY\8a&\a9\ee?5\c0d+\e62\94<H!\ad\15o\a7\ee?\9fv\99aJ\e4\8c\bc\t\dcv\b9\e1\a5\ee?\a8M\ef;\c53\8c\bc\85U:\b0~\a4\ee?\ae\e9+\89xS\84\bc \c3\cc4F\a3\ee?XXVx\dd\ce\93\bc%\"U\828\a2\ee?d\19~\80\aa\10W<s\a9L\d4U\a1\ee?(\"^\bf\ef\b3\93\bc\cd;\7ff\9e\a0\ee?\82\b94\87\ad\12j\bc\bf\da\0bu\12\a0\ee?\ee\a9m\b8\efgc\bc/\1ae<\b2\9f\ee?Q\88\e0T=\dc\80\bc\84\94Q\f9}\9f\ee?\cf>Z~d\1fx\bct_\ec\e8u\9f\ee?\b0}\8b\c0J\ee\86\bct\81\a5H\9a\9f\ee?\8a\e6U\1e2\19\86\bc\c9gBV\eb\9f\ee?\d3\d4\t^\cb\9c\90<?]\deOi\a0\ee?\1d\a5M\b9\dc2{\bc\87\01\ebs\14\a1\ee?k\c0gT\fd\ec\94<2\c10\01\ed\a1\ee?Ul\d6\ab\e1\ebe<bN\cf6\f3\a2\ee?B\cf\b3/\c5\a1\88\bc\12\1a>T\'\a4\ee?47;\f1\b6i\93\bc\13\ceL\99\89\a5\ee?\1e\ff\19:\84^\80\bc\ad\c7#F\1a\a7\ee?nWr\d8P\d4\94\bc\ed\92D\9b\d9\a8\ee?\00\8a\0e[g\ad\90<\99f\8a\d9\c7\aa\ee?\b4\ea\f0\c1/\b7\8d<\db\a0*B\e5\ac\ee?\ff\e7\c5\9c`\b6e\bc\8cD\b5\162\af\ee?D_\f3Y\83\f6{<6w\15\99\ae\b1\ee?\83=\1e\a7\1f\t\93\bc\c6\ff\91\0b[\b4\ee?)\1el\8b\b8\a9]\bc\e5\c5\cd\b07\b7\ee?Y\b9\90|\f9#l\bc\0fR\c8\cbD\ba\ee?\aa\f9\f4\"CC\92\bcPN\de\9f\82\bd\ee?K\8ef\d7l\ca\85\bc\ba\07\cap\f1\c0\ee?\'\ce\91+\fc\afq<\90\f0\a3\82\91\c4\ee?\bbs\n\e15\d2m<##\e3\19c\c8\ee?c\"b\"\04\c5\87\bce\e5]{f\cc\ee?\d51\e2\e3\86\1c\8b<3-J\ec\9b\d0\ee?\15\bb\bc\d3\d1\bb\91\bc]%>\b2\03\d5\ee?\d21\ee\9c1\cc\90<X\b30\13\9e\d9\ee?\b3Zsn\84i\84<\bf\fdyUk\de\ee?\b4\9d\8e\97\cd\df\82\bcz\f3\d3\bfk\e3\ee?\873\cb\92w\1a\8c<\ad\d3Z\99\9f\e8\ee?\fa\d9\d1J\8f{\90\bcf\b6\8d)\07\ee\ee?\ba\ae\dcV\d9\c3U\bc\fb\15O\b8\a2\f3\ee?@\f6\a6=\0e\a4\90\bc:Y\e5\8dr\f9\ee?4\93\ad8\f4\d6h\bcG^\fb\f2v\ff\ee?5\8aXk\e2\ee\91\bcJ\06\a10\b0\05\ef?\cd\dd_\n\d7\fft<\d2\c1K\90\1e\0c\ef?\ac\98\92\fa\fb\bd\91\bc\t\1e\d7[\c2\12\ef?\b3\0c\af0\aens<\9cR\85\dd\9b\19\ef?\94\fd\9f\\2\e3\8e<z\d0\ff_\ab \ef?\acY\t\d1\8f\e0\84<K\d1W.\f1\'\ef?g\1aN8\af\cdc<\b5\e7\06\94m/\ef?h\19\92l,kg<i\90\ef\dc 7\ef?\d2\b5\cc\83\18\8a\80\bc\fa\c3]U\0b?\ef?o\fa\ff?]\ad\8f\bc|\89\07J-G\ef?I\a9u8\ae\r\90\bc\f2\89\r\08\87O\ef?\a7\07=\a6\85\a3t<\87\a4\fb\dc\18X\ef?\0f\"@ \9e\91\82\bc\98\83\c9\16\e3`\ef?\ac\92\c1\d5PZ\8e<\852\db\03\e6i\ef?Kk\01\acY:\84<`\b4\01\f3!s\ef?\1f>\b4\07!\d5\82\bc_\9b{3\97|\ef?\c9\rG;\b9*\89\bc)\a1\f5\14F\86\ef?\d3\88:`\04\b6t<\f6?\8b\e7.\90\ef?qr\9dQ\ec\c5\83<\83L\c7\fbQ\9a\ef?\f0\91\d3\8f\12\f7\8f\bc\da\90\a4\a2\af\a4\ef?}t#\e2\98\ae\8d\bc\f1g\8e-H\af\ef?\08 \aaA\bc\c3\8e<\'Za\ee\1b\ba\ef?2\eb\a9\c3\94+\84<\97\bak7+\c5\ef?\ee\85\d11\a9d\8a<@En[v\d0\ef?\ed\e3;\e4\ba7\8e\bc\14\be\9c\ad\fd\db\ef?\9d\cd\91M;\89w<\d8\90\9e\81\c1\e7\ef?\89\cc`A\c1\05S<\f1q\8f+\c2\f3\ef?")
 (data $22 (i32.const 1053788) "\1c\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\08\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00")
 (data $23 (i32.const 1053820) "\1c\00\00\00\00\00\00\00\00\00\00\00\14\00\00\00\08\00\00\00\t\00\00\00\00\00\00\00\00\00\00\00")
 (data $24 (i32.const 1053852) ",\00\00\00\00\00\00\00\00\00\00\00\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00\00\00")
 (data $25 (i32.const 1053900) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00HB\000\acF\00\00zE")
 (data $26 (i32.const 1053932) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\n\d7#<\00\00 B\00\00\80?")
 (data $27 (i32.const 1053964) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00 \c1\00\00 A\00\00\00\00")
 (data $28 (i32.const 1053996) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00HB\000\acF\00\00zE")
 (data $29 (i32.const 1054028) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\n\d7#<\f6(|?\00\00\80?")
 (data $30 (i32.const 1054060) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00HB\000\acF\00\00zE")
 (data $31 (i32.const 1054092) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\n\d7#<\f6(|?\00\00\00?")
 (data $32 (i32.const 1054124) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\8f\c2\f5<")
 (data $33 (i32.const 1054156) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\cd\cc\cc=")
 (data $34 (i32.const 1054188) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\00\00\00?")
 (data $35 (i32.const 1054220) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\00\00\00?")
 (data $36 (i32.const 1054252) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\00\00\00?")
 (data $37 (i32.const 1054284) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\ef\ff\7f?\00\00\00?")
 (data $38 (i32.const 1054316) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\ef\ff\7f?\00\00\00?")
 (data $39 (i32.const 1054348) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\80?\00\00\00?")
 (data $40 (i32.const 1054380) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\00@\00\00\00?")
 (data $41 (i32.const 1054412) "\1c\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0c\00\00\00\00\00\00\00\00\00\00@\00\00\00?")
 (data $42 (i32.const 1054448) "\be\f3\f8y\eca\f6?\190\96[\c6\fe\de\bf=\88\afJ\edq\f5?\a4\fc\d42h\0b\db\bf\b0\10\f0\f09\95\f4?{\b7\1f\n\8bA\d7\bf\85\03\b8\b0\95\c9\f3?{\cfm\1a\e9\9d\d3\bf\a5d\88\0c\19\r\f3?1\b6\f2\f3\9b\1d\d0\bf\a0\8e\0b{\"^\f2?\f0z;\1b\1d|\c9\bf?4\1aJJ\bb\f1?\9f<\af\93\e3\f9\c2\bf\ba\e5\8a\f0X#\f1?\\\8dx\bf\cb`\b9\bf\a7\00\99A?\95\f0?\ce_G\b6\9do\aa\bf\00\00\00\00\00\00\f0?\00\00\00\00\00\00\00\00\acG\9a\fd\8c`\ee?=\f5$\9f\ca8\b3?\a0j\02\1f\b3\a4\ec?\ba\918T\a9v\c4?\e6\fcjW6 \eb?\d2\e4\c4J\0b\84\ce?-\aa\a1c\d1\c2\e9?\1ce\c6\f0E\06\d4?\edAx\03\e6\86\e8?\f8\9f\1b,\9c\8e\d8?bHS\f5\dcg\e7?\cc{\b1N\a4\e0\dc?")
 (data $43 (i32.const 1054704) "\00\00\00\00\00\00\f0?t\85\15\d3\b0\d9\ef?\0f\89\f9lX\b5\ef?Q[\12\d0\01\93\ef?{Q}<\b8r\ef?\aa\b9h1\87T\ef?8bunz8\ef?\e1\de\1f\f5\9d\1e\ef?\15\b71\n\fe\06\ef?\cb\a9:7\a7\f1\ee?\"4\12L\a6\de\ee?-\89a`\08\ce\ee?\'*6\d5\da\bf\ee?\82O\9dV+\b4\ee?)TH\dd\07\ab\ee?\85U:\b0~\a4\ee?\cd;\7ff\9e\a0\ee?t_\ec\e8u\9f\ee?\87\01\ebs\14\a1\ee?\13\ceL\99\89\a5\ee?\db\a0*B\e5\ac\ee?\e5\c5\cd\b07\b7\ee?\90\f0\a3\82\91\c4\ee?]%>\b2\03\d5\ee?\ad\d3Z\99\9f\e8\ee?G^\fb\f2v\ff\ee?\9cR\85\dd\9b\19\ef?i\90\ef\dc 7\ef?\87\a4\fb\dc\18X\ef?_\9b{3\97|\ef?\da\90\a4\a2\af\a4\ef?@En[v\d0\ef?")
 (data $44 (i32.const 1054960) "\00\00\00\00\00\a0\f6?\00\00\00\00\00\00\00\00\00\c8\b9\f2\82,\d6\bf\80V7($\b4\fa<\00\00\00\00\00\80\f6?\00\00\00\00\00\00\00\00\00\08X\bf\bd\d1\d5\bf \f7\e0\d8\08\a5\1c\bd\00\00\00\00\00`\f6?\00\00\00\00\00\00\00\00\00XE\17wv\d5\bfmP\b6\d5\a4b#\bd\00\00\00\00\00@\f6?\00\00\00\00\00\00\00\00\00\f8-\87\ad\1a\d5\bf\d5g\b0\9e\e4\84\e6\bc\00\00\00\00\00 \f6?\00\00\00\00\00\00\00\00\00xw\95_\be\d4\bf\e0>)\93i\1b\04\bd\00\00\00\00\00\00\f6?\00\00\00\00\00\00\00\00\00`\1c\c2\8ba\d4\bf\cc\84LH/\d8\13=\00\00\00\00\00\e0\f5?\00\00\00\00\00\00\00\00\00\a8\86\860\04\d4\bf:\0b\82\ed\f3B\dc<\00\00\00\00\00\c0\f5?\00\00\00\00\00\00\00\00\00HiUL\a6\d3\bf`\94Q\86\c6\b1 =\00\00\00\00\00\a0\f5?\00\00\00\00\00\00\00\00\00\80\98\9a\ddG\d3\bf\92\80\c5\d4MY%=\00\00\00\00\00\80\f5?\00\00\00\00\00\00\00\00\00 \e1\ba\e2\e8\d2\bf\d8+\b7\99\1e{&=\00\00\00\00\00`\f5?\00\00\00\00\00\00\00\00\00\88\de\13Z\89\d2\bf?\b0\cf\b6\14\ca\15=\00\00\00\00\00`\f5?\00\00\00\00\00\00\00\00\00\88\de\13Z\89\d2\bf?\b0\cf\b6\14\ca\15=\00\00\00\00\00@\f5?\00\00\00\00\00\00\00\00\00x\cf\fbA)\d2\bfv\daS($Z\16\bd\00\00\00\00\00 \f5?\00\00\00\00\00\00\00\00\00\98i\c1\98\c8\d1\bf\04T\e7h\bc\af\1f\bd\00\00\00\00\00\00\f5?\00\00\00\00\00\00\00\00\00\a8\ab\ab\\g\d1\bf\f0\a8\823\c6\1f\1f=\00\00\00\00\00\e0\f4?\00\00\00\00\00\00\00\00\00H\ae\f9\8b\05\d1\bffZ\05\fd\c4\a8&\bd\00\00\00\00\00\c0\f4?\00\00\00\00\00\00\00\00\00\90s\e2$\a3\d0\bf\0e\03\f4~\eek\0c\bd\00\00\00\00\00\a0\f4?\00\00\00\00\00\00\00\00\00\d0\b4\94%@\d0\bf\7f-\f4\9e\b86\f0\bc\00\00\00\00\00\a0\f4?\00\00\00\00\00\00\00\00\00\d0\b4\94%@\d0\bf\7f-\f4\9e\b86\f0\bc\00\00\00\00\00\80\f4?\00\00\00\00\00\00\00\00\00@^m\18\b9\cf\bf\87<\99\ab*W\r=\00\00\00\00\00`\f4?\00\00\00\00\00\00\00\00\00`\dc\cb\ad\f0\ce\bf$\af\86\9c\b7&+=\00\00\00\00\00@\f4?\00\00\00\00\00\00\00\00\00\f0*n\07\'\ce\bf\10\ff?TO/\17\bd\00\00\00\00\00 \f4?\00\00\00\00\00\00\00\00\00\c0Ok!\\\cd\bf\1bh\ca\bb\91\ba!=\00\00\00\00\00\00\f4?\00\00\00\00\00\00\00\00\00\a0\9a\c7\f7\8f\cc\bf4\84\9fhOy\'=\00\00\00\00\00\00\f4?\00\00\00\00\00\00\00\00\00\a0\9a\c7\f7\8f\cc\bf4\84\9fhOy\'=\00\00\00\00\00\e0\f3?\00\00\00\00\00\00\00\00\00\90-t\86\c2\cb\bf\8f\b7\8b1\b0N\19=\00\00\00\00\00\c0\f3?\00\00\00\00\00\00\00\00\00\c0\80N\c9\f3\ca\bff\90\cd?cN\ba<\00\00\00\00\00\a0\f3?\00\00\00\00\00\00\00\00\00\b0\e2\1f\bc#\ca\bf\ea\c1F\dcd\8c%\bd\00\00\00\00\00\a0\f3?\00\00\00\00\00\00\00\00\00\b0\e2\1f\bc#\ca\bf\ea\c1F\dcd\8c%\bd\00\00\00\00\00\80\f3?\00\00\00\00\00\00\00\00\00P\f4\9cZR\c9\bf\e3\d4\c1\04\d9\d1*\bd\00\00\00\00\00`\f3?\00\00\00\00\00\00\00\00\00\d0 e\a0\7f\c8\bf\t\fa\db\7f\bf\bd+=\00\00\00\00\00@\f3?\00\00\00\00\00\00\00\00\00\e0\10\02\89\ab\c7\bfXJSr\90\db+=\00\00\00\00\00@\f3?\00\00\00\00\00\00\00\00\00\e0\10\02\89\ab\c7\bfXJSr\90\db+=\00\00\00\00\00 \f3?\00\00\00\00\00\00\00\00\00\d0\19\e7\0f\d6\c6\bff\e2\b2\a3j\e4\10\bd\00\00\00\00\00\00\f3?\00\00\00\00\00\00\00\00\00\90\a7p0\ff\c5\bf9P\10\9fC\9e\1e\bd\00\00\00\00\00\00\f3?\00\00\00\00\00\00\00\00\00\90\a7p0\ff\c5\bf9P\10\9fC\9e\1e\bd\00\00\00\00\00\e0\f2?\00\00\00\00\00\00\00\00\00\b0\a1\e3\e5&\c5\bf\8f[\07\90\8b\de \bd\00\00\00\00\00\c0\f2?\00\00\00\00\00\00\00\00\00\80\cbl+M\c4\bf<x5a\c1\0c\17=\00\00\00\00\00\c0\f2?\00\00\00\00\00\00\00\00\00\80\cbl+M\c4\bf<x5a\c1\0c\17=\00\00\00\00\00\a0\f2?\00\00\00\00\00\00\00\00\00\90\1e \fcq\c3\bf:T\'M\86x\f1<\00\00\00\00\00\80\f2?\00\00\00\00\00\00\00\00\00\f0\1f\f8R\95\c2\bf\08\c4q\170\8d$\bd\00\00\00\00\00`\f2?\00\00\00\00\00\00\00\00\00`/\d5*\b7\c1\bf\96\a3\11\18\a4\80.\bd\00\00\00\00\00`\f2?\00\00\00\00\00\00\00\00\00`/\d5*\b7\c1\bf\96\a3\11\18\a4\80.\bd\00\00\00\00\00@\f2?\00\00\00\00\00\00\00\00\00\90\d0|~\d7\c0\bf\f4[\e8\88\96i\n=\00\00\00\00\00@\f2?\00\00\00\00\00\00\00\00\00\90\d0|~\d7\c0\bf\f4[\e8\88\96i\n=\00\00\00\00\00 \f2?\00\00\00\00\00\00\00\00\00\e0\db1\91\ec\bf\bf\f23\a3\\Tu%\bd\00\00\00\00\00\00\f2?\00\00\00\00\00\00\00\00\00\00+n\07\'\be\bf<\00\f0*,4*=\00\00\00\00\00\00\f2?\00\00\00\00\00\00\00\00\00\00+n\07\'\be\bf<\00\f0*,4*=\00\00\00\00\00\e0\f1?\00\00\00\00\00\00\00\00\00\c0[\8fT^\bc\bf\06\be_XW\0c\1d\bd\00\00\00\00\00\c0\f1?\00\00\00\00\00\00\00\00\00\e0J:m\92\ba\bf\c8\aa[\e859%=\00\00\00\00\00\c0\f1?\00\00\00\00\00\00\00\00\00\e0J:m\92\ba\bf\c8\aa[\e859%=\00\00\00\00\00\a0\f1?\00\00\00\00\00\00\00\00\00\a01\d6E\c3\b8\bfhV/M)|\13=\00\00\00\00\00\a0\f1?\00\00\00\00\00\00\00\00\00\a01\d6E\c3\b8\bfhV/M)|\13=\00\00\00\00\00\80\f1?\00\00\00\00\00\00\00\00\00`\e5\8a\d2\f0\b6\bf\das3\c97\97&\bd\00\00\00\00\00`\f1?\00\00\00\00\00\00\00\00\00 \06?\07\1b\b5\bfW^\c6a[\02\1f=\00\00\00\00\00`\f1?\00\00\00\00\00\00\00\00\00 \06?\07\1b\b5\bfW^\c6a[\02\1f=\00\00\00\00\00@\f1?\00\00\00\00\00\00\00\00\00\e0\1b\96\d7A\b3\bf\df\13\f9\cc\da^,=\00\00\00\00\00@\f1?\00\00\00\00\00\00\00\00\00\e0\1b\96\d7A\b3\bf\df\13\f9\cc\da^,=\00\00\00\00\00 \f1?\00\00\00\00\00\00\00\00\00\80\a3\ee6e\b1\bf\t\a3\8fv^|\14=\00\00\00\00\00\00\f1?\00\00\00\00\00\00\00\00\00\80\11\c00\n\af\bf\91\8e6\83\9eY-=\00\00\00\00\00\00\f1?\00\00\00\00\00\00\00\00\00\80\11\c00\n\af\bf\91\8e6\83\9eY-=\00\00\00\00\00\e0\f0?\00\00\00\00\00\00\00\00\00\80\19q\ddB\ab\bfLp\d6\e5z\82\1c=\00\00\00\00\00\e0\f0?\00\00\00\00\00\00\00\00\00\80\19q\ddB\ab\bfLp\d6\e5z\82\1c=\00\00\00\00\00\c0\f0?\00\00\00\00\00\00\00\00\00\c02\f6Xt\a7\bf\ee\a1\f24F\fc,\bd\00\00\00\00\00\c0\f0?\00\00\00\00\00\00\00\00\00\c02\f6Xt\a7\bf\ee\a1\f24F\fc,\bd\00\00\00\00\00\a0\f0?\00\00\00\00\00\00\00\00\00\c0\fe\b9\87\9e\a3\bf\aa\fe&\f5\b7\02\f5<\00\00\00\00\00\a0\f0?\00\00\00\00\00\00\00\00\00\c0\fe\b9\87\9e\a3\bf\aa\fe&\f5\b7\02\f5<\00\00\00\00\00\80\f0?\00\00\00\00\00\00\00\00\00\00x\0e\9b\82\9f\bf\e4\t~|&\80)\bd\00\00\00\00\00\80\f0?\00\00\00\00\00\00\00\00\00\00x\0e\9b\82\9f\bf\e4\t~|&\80)\bd\00\00\00\00\00`\f0?\00\00\00\00\00\00\00\00\00\80\d5\07\1b\b9\97\bf9\a6\fa\93T\8d(\bd\00\00\00\00\00@\f0?\00\00\00\00\00\00\00\00\00\00\fc\b0\a8\c0\8f\bf\9c\a6\d3\f6|\1e\df\bc\00\00\00\00\00@\f0?\00\00\00\00\00\00\00\00\00\00\fc\b0\a8\c0\8f\bf\9c\a6\d3\f6|\1e\df\bc\00\00\00\00\00 \f0?\00\00\00\00\00\00\00\00\00\00\10k*\e0\7f\bf\e4@\da\r?\e2\19\bd\00\00\00\00\00 \f0?\00\00\00\00\00\00\00\00\00\00\10k*\e0\7f\bf\e4@\da\r?\e2\19\bd\00\00\00\00\00\00\f0?\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\f0?\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\c0\ef?\00\00\00\00\00\00\00\00\00\00\89u\15\10\80?\e8+\9d\99k\c7\10\bd\00\00\00\00\00\80\ef?\00\00\00\00\00\00\00\00\00\80\93XV \90?\d2\f7\e2\06[\dc#\bd\00\00\00\00\00@\ef?\00\00\00\00\00\00\00\00\00\00\c9(%I\98?4\0cZ2\ba\a0*\bd\00\00\00\00\00\00\ef?\00\00\00\00\00\00\00\00\00@\e7\89]A\a0?S\d7\f1\\\c0\11\01=\00\00\00\00\00\c0\ee?\00\00\00\00\00\00\00\00\00\00.\d4\aef\a4?(\fd\bdus\16,\bd\00\00\00\00\00\80\ee?\00\00\00\00\00\00\00\00\00\c0\9f\14\aa\94\a8?}&Z\d0\95y\19\bd\00\00\00\00\00@\ee?\00\00\00\00\00\00\00\00\00\c0\dd\cds\cb\ac?\07(\d8G\f2h\1a\bd\00\00\00\00\00 \ee?\00\00\00\00\00\00\00\00\00\c0\06\c01\ea\ae?{;\c9O>\11\0e\bd\00\00\00\00\00\e0\ed?\00\00\00\00\00\00\00\00\00`F\d1;\97\b1?\9b\9e\rV]2%\bd\00\00\00\00\00\a0\ed?\00\00\00\00\00\00\00\00\00\e0\d1\a7\f5\bd\b3?\d7N\db\a5^\c8,=\00\00\00\00\00`\ed?\00\00\00\00\00\00\00\00\00\a0\97MZ\e9\b5?\1e\1d]<\06i,\bd\00\00\00\00\00@\ed?\00\00\00\00\00\00\00\00\00\c0\ea\n\d3\00\b7?2\ed\9d\a9\8d\1e\ec<\00\00\00\00\00\00\ed?\00\00\00\00\00\00\00\00\00@Y]^3\b9?\daG\bd:\\\11#=\00\00\00\00\00\c0\ec?\00\00\00\00\00\00\00\00\00`\ad\8d\c8j\bb?\e5h\f7+\80\90\13\bd\00\00\00\00\00\a0\ec?\00\00\00\00\00\00\00\00\00@\bc\01X\88\bc?\d3\acZ\c6\d1F&=\00\00\00\00\00`\ec?\00\00\00\00\00\00\00\00\00 \n\839\c7\be?\e0E\e6\afh\c0-\bd\00\00\00\00\00@\ec?\00\00\00\00\00\00\00\00\00\e0\db9\91\e8\bf?\fd\n\a1O\d64%\bd\00\00\00\00\00\00\ec?\00\00\00\00\00\00\00\00\00\e0\'\82\8e\17\c1?\f2\07-\cex\ef!=\00\00\00\00\00\e0\eb?\00\00\00\00\00\00\00\00\00\f0#~+\aa\c1?4\998D\8e\a7,=\00\00\00\00\00\a0\eb?\00\00\00\00\00\00\00\00\00\80\86\0ca\d1\c2?\a1\b4\81\cbl\9d\03=\00\00\00\00\00\80\eb?\00\00\00\00\00\00\00\00\00\90\15\b0\fce\c3?\89rK#\a8/\c6<\00\00\00\00\00@\eb?\00\00\00\00\00\00\00\00\00\b03\83=\91\c4?x\b6\fdTy\83%=\00\00\00\00\00 \eb?\00\00\00\00\00\00\00\00\00\b0\a1\e4\e5\'\c5?\c7}i\e5\e83&=\00\00\00\00\00\e0\ea?\00\00\00\00\00\00\00\00\00\10\8c\beNW\c6?x.<,\8b\cf\19=\00\00\00\00\00\c0\ea?\00\00\00\00\00\00\00\00\00pu\8b\12\f0\c6?\e1!\9c\e5\8d\11%\bd\00\00\00\00\00\a0\ea?\00\00\00\00\00\00\00\00\00PD\85\8d\89\c7?\05C\91p\10f\1c\bd\00\00\00\00\00`\ea?\00\00\00\00\00\00\00\00\00\009\eb\af\be\c8?\d1,\e9\aaT=\07\bd\00\00\00\00\00@\ea?\00\00\00\00\00\00\00\00\00\00\f7\dcZZ\c9?o\ff\a0X(\f2\07=\00\00\00\00\00\00\ea?\00\00\00\00\00\00\00\00\00\e0\8a<\ed\93\ca?i!VPCr(\bd\00\00\00\00\00\e0\e9?\00\00\00\00\00\00\00\00\00\d0[W\d81\cb?\aa\e1\acN\8d5\0c\bd\00\00\00\00\00\c0\e9?\00\00\00\00\00\00\00\00\00\e0;8\87\d0\cb?\b6\12TY\c4K-\bd\00\00\00\00\00\a0\e9?\00\00\00\00\00\00\00\00\00\10\f0\c6\fbo\cc?\d2+\96\c5r\ec\f1\bc\00\00\00\00\00`\e9?\00\00\00\00\00\00\00\00\00\90\d4\b0=\b1\cd?5\b0\15\f7*\ff*\bd\00\00\00\00\00@\e9?\00\00\00\00\00\00\00\00\00\10\e7\ff\0eS\ce?0\f4A`\'\12\c2<\00\00\00\00\00 \e9?\00\00\00\00\00\00\00\00\00\00\dd\e4\ad\f5\ce?\11\8e\bbe\15!\ca\bc\00\00\00\00\00\00\e9?\00\00\00\00\00\00\00\00\00\b0\b3l\1c\99\cf?0\df\0c\ca\ec\cb\1b=\00\00\00\00\00\c0\e8?\00\00\00\00\00\00\00\00\00XM`8q\d0?\91N\ed\16\db\9c\f8<\00\00\00\00\00\a0\e8?\00\00\00\00\00\00\00\00\00`ag-\c4\d0?\e9\ea<\16\8b\18\'=\00\00\00\00\00\80\e8?\00\00\00\00\00\00\00\00\00\e8\'\82\8e\17\d1?\1c\f0\a5c\0e!,\bd\00\00\00\00\00`\e8?\00\00\00\00\00\00\00\00\00\f8\ac\cb\\k\d1?\81\16\a5\f7\cd\9a+=\00\00\00\00\00@\e8?\00\00\00\00\00\00\00\00\00hZc\99\bf\d1?\b7\bdGQ\ed\a6,=\00\00\00\00\00 \e8?\00\00\00\00\00\00\00\00\00\b8\0emE\14\d2?\ea\baF\ba\de\87\n=\00\00\00\00\00\e0\e7?\00\00\00\00\00\00\00\00\00\90\dc|\f0\be\d2?\f4\04PJ\fa\9c*=\00\00\00\00\00\c0\e7?\00\00\00\00\00\00\00\00\00`\d3\e1\f1\14\d3?\b8<!\d3z\e2(\bd\00\00\00\00\00\a0\e7?\00\00\00\00\00\00\00\00\00\10\bevgk\d3?\c8w\f1\b0\cdn\11=\00\00\00\00\00\80\e7?\00\00\00\00\00\00\00\00\0003wR\c2\d3?\\\bd\06\b6T;\18=\00\00\00\00\00`\e7?\00\00\00\00\00\00\00\00\00\e8\d5#\b4\19\d4?\9d\e0\90\ec6\e4\08=\00\00\00\00\00@\e7?\00\00\00\00\00\00\00\00\00\c8q\c2\8dq\d4?u\d6g\t\ce\'/\bd\00\00\00\00\00 \e7?\00\00\00\00\00\00\00\00\000\17\9e\e0\c9\d4?\a4\d8\n\1b\89 .\bd\00\00\00\00\00\00\e7?\00\00\00\00\00\00\00\00\00\a08\07\ae\"\d5?Y\c7d\81p\be.=\00\00\00\00\00\e0\e6?\00\00\00\00\00\00\00\00\00\d0\c8S\f7{\d5?\ef@]\ee\ed\ad\1f=\00\00\00\00\00\c0\e6?\00\00\00\00\00\00\00\00\00`Y\df\bd\d5\d5?\dce\a4\08*\0b\n\bd")
 (elem $0 (i32.const 1) $assembly/core/antialias-wavetable/Real.saw $assembly/core/antialias-wavetable/Real.ramp $assembly/core/antialias-wavetable/Real.sqr $assembly/core/antialias-wavetable/Real.tri $~lib/math/NativeMath.sin $assembly/util/phaseToRadians $~lib/math/NativeMath.cos $assembly/core/wavetable/exp $assembly/core/wave/Wave.noise)
 (export "preventTreeShaking" (func $assembly/index/preventTreeShaking))
 (export "benchAudio" (func $assembly/bench/bench-audio/benchAudio))
 (export "benchAudioGain" (func $assembly/bench/bench-audio/benchAudioGain))
 (export "benchAudioTwo" (func $assembly/bench/bench-audio/benchAudioTwo))
 (export "WAVETABLE_SIZE" (global $assembly/core/constants/WAVETABLE_SIZE))
 (export "DELAY_MAX_SIZE" (global $assembly/core/constants/DELAY_MAX_SIZE))
 (export "SAMPLE_MAX_SIZE" (global $assembly/core/constants/SAMPLE_MAX_SIZE))
 (export "ANTIALIAS_WAVETABLE_OVERSAMPLING" (global $assembly/core/constants/ANTIALIAS_WAVETABLE_OVERSAMPLING))
 (export "memory" (memory $0))
 (export "gen_daverb_nearestPowerOfTwo" (func $assembly/gen/daverb/nearestPowerOfTwo))
 (export "wavetable_set_length" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "wavetable_set_mask" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "wavetable_set_phases" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "wavetable_set_sine" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "wavetable_set_cos" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "wavetable_set_exp" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "wavetable_set_noise" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "util_nextPowerOfTwo" (func $assembly/util/nextPowerOfTwo))
 (export "antialias_wavetable_AntialiasWavetable_set_real" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "antialias_wavetable_AntialiasWavetable_set_imag" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "antialias_wavetable_AntialiasWavetable_set_freqs" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "antialias_wavetable_AntialiasWavetable_set_saw" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:saw))
 (export "antialias_wavetable_AntialiasWavetable_set_ramp" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:ramp))
 (export "antialias_wavetable_AntialiasWavetable_set_sqr" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:sqr))
 (export "antialias_wavetable_AntialiasWavetable_set_tri" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tri))
 (export "antialias_wavetable_AntialiasWavetable_set_audioRate" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:audioRate))
 (export "antialias_wavetable_AntialiasWavetable_set_topFreq" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:topFreq))
 (export "antialias_wavetable_AntialiasWavetable_set_maxHarms" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "antialias_wavetable_AntialiasWavetable_set_numOfTables" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "antialias_wavetable_AntialiasWavetable_set_tableLength" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableLength))
 (export "antialias_wavetable_AntialiasWavetable_set_tableMask" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableMask))
 (export "antialias_wavetable_AntialiasWavetable_get_tableLength" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:tableLength))
 (export "antialias_wavetable_AntialiasWavetable_set_stepShift" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:stepShift))
 (export "antialias_wavetable_AntialiasWavetable_get_saw" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:saw))
 (export "antialias_wavetable_Real_saw" (func $assembly/core/antialias-wavetable/Real.saw))
 (export "antialias_wavetable_AntialiasWavetable_get_topFreq" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:topFreq))
 (export "antialias_wavetable_AntialiasWavetable_get_maxHarms" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "antialias_wavetable_AntialiasWavetable_get_imag" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "antialias_wavetable_AntialiasWavetable_get_real" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "antialias_wavetable_AntialiasWavetable_defineWaveform" (func $assembly/core/antialias-wavetable/AntialiasWavetable#defineWaveform))
 (export "fft_" (func $assembly/core/fft/fft))
 (export "antialias_wavetable_AntialiasWavetable_makeWavetable" (func $assembly/core/antialias-wavetable/AntialiasWavetable#makeWavetable))
 (export "antialias_wavetable_AntialiasWavetable_get_freqs" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "antialias_wavetable_AntialiasWavetable_makeTables" (func $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables))
 (export "antialias_wavetable_AntialiasWavetable_get_ramp" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:ramp))
 (export "antialias_wavetable_Real_ramp" (func $assembly/core/antialias-wavetable/Real.ramp))
 (export "antialias_wavetable_AntialiasWavetable_get_sqr" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:sqr))
 (export "antialias_wavetable_Real_sqr" (func $assembly/core/antialias-wavetable/Real.sqr))
 (export "antialias_wavetable_AntialiasWavetable_get_tri" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:tri))
 (export "antialias_wavetable_Real_tri" (func $assembly/core/antialias-wavetable/Real.tri))
 (export "antialias_wavetable_AntialiasWavetable_set_tableIndex" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableIndex))
 (export "antialias_wavetable_AntialiasWavetable_constructor" (func $assembly/core/antialias-wavetable/AntialiasWavetable#constructor))
 (export "wavetable_set_antialias" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "wavetable_get_size" (func $assembly/core/wavetable/Wavetable#get:size))
 (export "wavetable_get_length" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "wavetable_get_phases" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "wavetable_get_sine" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "util_phaseToRadians" (func $assembly/util/phaseToRadians))
 (export "wavetable_fill" (func $assembly/core/wavetable/Wavetable#fill))
 (export "wavetable_get_cos" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "wavetable_get_exp" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "wavetable_exp" (func $assembly/core/wavetable/exp))
 (export "wavetable_get_noise" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "wave_rnd" (func $assembly/core/wave/rnd))
 (export "wave_noise" (func $assembly/core/wave/Wave.noise))
 (export "wavetable_set_audioRate" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableLength))
 (export "wavetable_set_size" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableMask))
 (export "wavetable_constructor" (func $assembly/core/wavetable/Wavetable#constructor))
 (export "engine_Core_set_wavetable" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "engine_Core_set_audioRate" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "engine_Core_constructor" (func $assembly/core/engine/Core#constructor))
 (export "clock_set_time" (func $assembly/core/clock/Clock#set:time))
 (export "clock_set_timeStep" (func $assembly/core/clock/Clock#set:timeStep))
 (export "clock_set_prevTime" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:topFreq))
 (export "clock_set_endTime" (func $assembly/core/clock/Clock#set:endTime))
 (export "clock_set_internalTime" (func $assembly/core/clock/Clock#set:internalTime))
 (export "clock_set_bpm" (func $assembly/core/clock/Clock#set:bpm))
 (export "clock_set_coeff" (func $assembly/core/clock/Clock#set:coeff))
 (export "clock_set_barTime" (func $assembly/core/clock/Clock#set:barTime))
 (export "clock_set_barTimeStep" (func $assembly/core/clock/Clock#set:barTimeStep))
 (export "clock_set_loopStart" (func $assembly/core/clock/Clock#set:loopStart))
 (export "clock_set_loopEnd" (func $assembly/core/clock/Clock#set:loopEnd))
 (export "clock_set_sampleRate" (func $assembly/core/clock/Clock#set:sampleRate))
 (export "clock_set_jumpBar" (func $assembly/core/clock/Clock#set:jumpBar))
 (export "clock_set_ringPos" (func $assembly/core/clock/Clock#set:ringPos))
 (export "clock_constructor" (func $assembly/core/clock/Clock#constructor))
 (export "runner_Bar_set_size" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "runner_Bar_set_main" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "runner_Bar_set_ctrls" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "runner_Bar_constructor" (func $assembly/core/runner/Bar#constructor))
 (export "runner_get_barInstances" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "runner_Ctrl_set_tableIndex" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "runner_Ctrl_set_id" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "runner_Signal_set_L" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "runner_Signal_set_R" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "runner_Signal_set_LR" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "runner_Signal_constructor" (func $assembly/core/runner/Signal#constructor))
 (export "runner_Ctrl_set_signal" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "runner_Ctrl_set_literalsCount" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "runner_Ctrl_set_liveLiterals" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "runner_Ctrl_set_ownLiterals" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "runner_Ctrl_constructor" (func $assembly/core/runner/Ctrl#constructor))
 (export "runner_get_ctrlInstances" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "runner_set_clock" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "runner_set_barInstances" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "runner_set_bars" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "runner_set_ctrlInstances" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "runner_set_ctrls" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "runner_set_lastMain" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "runner_set_last" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "runner_set_tableIndex" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "runner_constructor" (func $assembly/core/runner/Runner#constructor))
 (export "engine_set_runner" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "engine_Core_get_wavetable" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "engine_set_wavetable" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "engine_set_rateSamples" (func $assembly/core/wavetable/Wavetable#set:length))
 (export "engine_set_rateStep" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "engine_set_clock" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "engine_get_clock" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "engine_set_audioRate" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "engine_set_core" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "engine_set_signal" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "engine_constructor" (func $assembly/core/engine/Engine#constructor))
 (export "engine_get_signal" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "engine_get_rateSamples" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "util_allocF32" (func $assembly/util/allocF32))
 (export "engine_createBlock" (func $assembly/core/engine/Engine#createBlock))
 (export "engine_get_runner" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "runner_clearLastBar" (func $assembly/core/runner/Runner#clearLastBar))
 (export "runner_get_ctrls" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "runner_Ctrl_get_signal" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "runner_get_bars" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "runner_Bar_get_size" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "runner_get_clock" (func $assembly/core/runner/Runner#get:clock))
 (export "runner_Bar_get_ctrls" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "runner_get_tableIndex" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "runner_Ctrl_get_id" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "env_setCtrlInstanceAt" (func $assembly/env/setCtrlInstanceAt))
 (export "runner_Ctrl_get_ownLiterals" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "runner_Ctrl_get_liveLiterals" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "runner_Ctrl_get_literalsCount" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "copy_copyMem" (func $assembly/graph/copy/copyMem))
 (export "runner_Ctrl_get_tableIndex" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "runner_Ctrl_get_run" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "runner_Signal_get_L" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real))
 (export "add_audio_audio" (func $assembly/math/add_audio_audio))
 (export "runner_Signal_get_R" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "runner_Signal_get_LR" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "runner_Bar_get_main" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "copy_copyInto" (func $assembly/graph/copy/copyInto))
 (export "runner_fill" (func $assembly/core/runner/Runner#fill))
 (export "clock_get_timeStep" (func $assembly/core/clock/Clock#get:timeStep))
 (export "runner_get_last" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "fade_fadeOut" (func $assembly/graph/fade/fadeOut))
 (export "env_resetCtrlInstance" (func $assembly/env/resetCtrlInstance))
 (export "fade_fadeIn" (func $assembly/graph/fade/fadeIn))
 (export "runner_get_lastMain" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "runner_process" (func $assembly/core/runner/Runner#process))
 (export "gen_gen_set__engine" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "gen_gen_set_gain" (func $assembly/gen/gen/Gen#set:gain))
 (export "gen_gen_constructor" (func $assembly/gen/gen/Gen#constructor))
 (export "gen_zero_constructor" (func $assembly/gen/zero/Zero#constructor))
 (export "util_getObjectSize__gen_zero_Zero_" (func $assembly/util/getObjectSize<assembly/gen/zero/Zero>))
 (export "util_cloneI32" (func $assembly/util/cloneI32))
 (export "gen_osc_set_hz" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_osc_set_trig" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_osc_set_offset" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_osc_set__phase" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "gen_osc_set__step" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_osc_set__sample" (func $assembly/gen/osc/Osc#set:_sample))
 (export "gen_osc_set__lastTrig" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableLength))
 (export "gen_osc_set__offsetU32" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableMask))
 (export "gen_osc_constructor" (func $assembly/gen/osc/Osc#constructor))
 (export "gen_sin_constructor" (func $assembly/gen/sin/Sin#constructor))
 (export "util_getObjectSize__gen_sin_Sin_" (func $assembly/util/getObjectSize<assembly/gen/sin/Sin>))
 (export "gen_exp_constructor" (func $assembly/gen/exp/Exp#constructor))
 (export "util_getObjectSize__gen_exp_Exp_" (func $assembly/util/getObjectSize<assembly/gen/sin/Sin>))
 (export "gen_aosc_set__tableIndex" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableIndex))
 (export "gen_aosc_constructor" (func $assembly/gen/aosc/AOsc#constructor))
 (export "gen_saw_constructor" (func $assembly/gen/saw/Saw#constructor))
 (export "util_getObjectSize__gen_saw_Saw_" (func $assembly/util/getObjectSize<assembly/gen/saw/Saw>))
 (export "gen_ramp_constructor" (func $assembly/gen/ramp/Ramp#constructor))
 (export "util_getObjectSize__gen_ramp_Ramp_" (func $assembly/util/getObjectSize<assembly/gen/saw/Saw>))
 (export "gen_sqr_constructor" (func $assembly/gen/sqr/Sqr#constructor))
 (export "util_getObjectSize__gen_sqr_Sqr_" (func $assembly/util/getObjectSize<assembly/gen/saw/Saw>))
 (export "gen_tri_constructor" (func $assembly/gen/tri/Tri#constructor))
 (export "util_getObjectSize__gen_tri_Tri_" (func $assembly/util/getObjectSize<assembly/gen/saw/Saw>))
 (export "gen_noise_constructor" (func $assembly/gen/noise/Noise#constructor))
 (export "util_getObjectSize__gen_noise_Noise_" (func $assembly/util/getObjectSize<assembly/gen/sin/Sin>))
 (export "gen_dc_set_ceil" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_dc_set_in" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "gen_dc_set_sample" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_dc_constructor" (func $assembly/gen/dc/Dc#constructor))
 (export "util_getObjectSize__gen_dc_Dc_" (func $assembly/util/getObjectSize<assembly/gen/dc/Dc>))
 (export "gen_delay_set_ms" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_delay_set_fb" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_delay_set_in" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "gen_delay_set__floats" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "gen_delay_set__mask" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_delay_set__index" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "gen_delay_set__stepf" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_delay_set__targetf" (func $assembly/gen/delay/Delay#set:_targetf))
 (export "gen_delay_constructor" (func $assembly/gen/delay/Delay#constructor))
 (export "util_getObjectSize__gen_delay_Delay_" (func $assembly/util/getObjectSize<assembly/gen/sin/Sin>))
 (export "gen_tap_set_ms" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_tap_set_in" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "gen_tap_set__floats" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "gen_tap_set__mask" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "gen_tap_set__index" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_tap_set__stepf" (func $assembly/gen/osc/Osc#set:_sample))
 (export "gen_tap_set__targetf" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_tap_constructor" (func $assembly/gen/tap/Tap#constructor))
 (export "util_getObjectSize__gen_tap_Tap_" (func $assembly/util/getObjectSize<assembly/gen/tap/Tap>))
 (export "gen_lp_set_cut" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_lp_set_in" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "gen_lp_set__alpha" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_lp_set__sample" (func $assembly/gen/lp/Lp#set:_sample))
 (export "gen_lp_constructor" (func $assembly/gen/lp/Lp#constructor))
 (export "util_getObjectSize__gen_lp_Lp_" (func $assembly/util/getObjectSize<assembly/gen/lp/Lp>))
 (export "engine_get_audioRate" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_rate_set_samples" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_rate_set__engine" (func $assembly/core/wavetable/Wavetable#set:mask))
 (export "gen_rate_constructor" (func $assembly/gen/rate/Rate#constructor))
 (export "util_getObjectSize__gen_rate_Rate_" (func $assembly/util/getObjectSize<assembly/gen/rate/Rate>))
 (export "gen_biquad_set_in" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "gen_biquad_set__x1" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:topFreq))
 (export "gen_biquad_set__x2" (func $assembly/core/clock/Clock#set:endTime))
 (export "gen_biquad_set__y1" (func $assembly/core/clock/Clock#set:internalTime))
 (export "gen_biquad_set__y2" (func $assembly/core/clock/Clock#set:bpm))
 (export "gen_biquad_set__a0" (func $assembly/core/clock/Clock#set:coeff))
 (export "gen_biquad_set__a1" (func $assembly/core/clock/Clock#set:barTime))
 (export "gen_biquad_set__a2" (func $assembly/core/clock/Clock#set:barTimeStep))
 (export "gen_biquad_set__b0" (func $assembly/core/clock/Clock#set:loopStart))
 (export "gen_biquad_set__b1" (func $assembly/core/clock/Clock#set:loopEnd))
 (export "gen_biquad_set__b2" (func $assembly/gen/biquad/Biquad#set:_b2))
 (export "gen_biquad_set__params_freq" (func $assembly/core/clock/Clock#set:ringPos))
 (export "gen_biquad_set__params_Q" (func $assembly/gen/biquad/Biquad#set:_params_Q))
 (export "gen_biquad_set__params_gain" (func $assembly/gen/biquad/Biquad#set:_params_gain))
 (export "gen_biquad_constructor" (func $assembly/gen/biquad/Biquad#constructor))
 (export "gen_blp_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_blp_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_blp_constructor" (func $assembly/gen/blp/Blp#constructor))
 (export "util_getObjectSize__gen_blp_Blp_" (func $assembly/util/getObjectSize<assembly/gen/blp/Blp>))
 (export "gen_bhp_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bhp_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bhp_constructor" (func $assembly/gen/bhp/Bhp#constructor))
 (export "util_getObjectSize__gen_bhp_Bhp_" (func $assembly/util/getObjectSize<assembly/gen/blp/Blp>))
 (export "gen_bbp_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bbp_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bbp_constructor" (func $assembly/gen/bbp/Bbp#constructor))
 (export "util_getObjectSize__gen_bbp_Bbp_" (func $assembly/util/getObjectSize<assembly/gen/blp/Blp>))
 (export "gen_bno_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bno_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bno_constructor" (func $assembly/gen/bno/Bno#constructor))
 (export "util_getObjectSize__gen_bno_Bno_" (func $assembly/util/getObjectSize<assembly/gen/blp/Blp>))
 (export "gen_bpk_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bpk_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bpk_set_amt" (func $assembly/gen/bpk/Bpk#set:amt))
 (export "gen_bpk_constructor" (func $assembly/gen/bpk/Bpk#constructor))
 (export "util_getObjectSize__gen_bpk_Bpk_" (func $assembly/util/getObjectSize<assembly/gen/bpk/Bpk>))
 (export "gen_bap_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bap_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bap_constructor" (func $assembly/gen/bap/Bap#constructor))
 (export "util_getObjectSize__gen_bap_Bap_" (func $assembly/util/getObjectSize<assembly/gen/blp/Blp>))
 (export "gen_bls_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bls_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bls_set_amt" (func $assembly/gen/bpk/Bpk#set:amt))
 (export "gen_bls_constructor" (func $assembly/gen/bls/Bls#constructor))
 (export "util_getObjectSize__gen_bls_Bls_" (func $assembly/util/getObjectSize<assembly/gen/bpk/Bpk>))
 (export "gen_bhs_set_cut" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_bhs_set_q" (func $assembly/gen/blp/Blp#set:q))
 (export "gen_bhs_set_amt" (func $assembly/gen/bpk/Bpk#set:amt))
 (export "gen_bhs_constructor" (func $assembly/gen/bhs/Bhs#constructor))
 (export "util_getObjectSize__gen_bhs_Bhs_" (func $assembly/util/getObjectSize<assembly/gen/bpk/Bpk>))
 (export "gen_svf_set_in" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "gen_svf_set__c1" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:topFreq))
 (export "gen_svf_set__c2" (func $assembly/core/clock/Clock#set:endTime))
 (export "gen_svf_set__a1" (func $assembly/core/clock/Clock#set:internalTime))
 (export "gen_svf_set__a2" (func $assembly/core/clock/Clock#set:bpm))
 (export "gen_svf_set__a3" (func $assembly/core/clock/Clock#set:coeff))
 (export "gen_svf_set__v0" (func $assembly/core/clock/Clock#set:barTime))
 (export "gen_svf_set__v1" (func $assembly/core/clock/Clock#set:barTimeStep))
 (export "gen_svf_set__v2" (func $assembly/core/clock/Clock#set:loopStart))
 (export "gen_svf_set__v3" (func $assembly/core/clock/Clock#set:loopEnd))
 (export "gen_svf_set__k" (func $assembly/gen/biquad/Biquad#set:_b2))
 (export "gen_svf_set__params_freq" (func $assembly/core/clock/Clock#set:ringPos))
 (export "gen_svf_set__params_Q" (func $assembly/gen/biquad/Biquad#set:_params_Q))
 (export "gen_svf_constructor" (func $assembly/gen/svf/Svf#constructor))
 (export "gen_slp_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_slp_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_slp_constructor" (func $assembly/gen/slp/Slp#constructor))
 (export "util_getObjectSize__gen_slp_Slp_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_shp_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_shp_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_shp_constructor" (func $assembly/gen/shp/Shp#constructor))
 (export "util_getObjectSize__gen_shp_Shp_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_sbp_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_sbp_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_sbp_constructor" (func $assembly/gen/sbp/Sbp#constructor))
 (export "util_getObjectSize__gen_sbp_Sbp_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_sap_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_sap_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_sap_constructor" (func $assembly/gen/sap/Sap#constructor))
 (export "util_getObjectSize__gen_sap_Sap_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_sno_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_sno_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_sno_constructor" (func $assembly/gen/sno/Sno#constructor))
 (export "util_getObjectSize__gen_sno_Sno_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_spk_set_cut" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_spk_set_q" (func $assembly/gen/blp/Blp#set:cut))
 (export "gen_spk_constructor" (func $assembly/gen/spk/Spk#constructor))
 (export "util_getObjectSize__gen_spk_Spk_" (func $assembly/util/getObjectSize<assembly/gen/slp/Slp>))
 (export "gen_moog_set_in" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "gen_moog_set__m_azt1" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_moog_set__m_azt2" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_moog_set__m_azt3" (func $assembly/gen/lp/Lp#set:_sample))
 (export "gen_moog_set__m_azt4" (func $assembly/gen/moog/Moog#set:_m_azt4))
 (export "gen_moog_set__m_az5" (func $assembly/gen/osc/Osc#set:_sample))
 (export "gen_moog_set__m_amf" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_moog_set__v2" (func $assembly/gen/delay/Delay#set:_targetf))
 (export "gen_moog_set__x1" (func $assembly/gen/moog/Moog#set:_x1))
 (export "gen_moog_set__az3" (func $assembly/gen/moog/Moog#set:_az3))
 (export "gen_moog_set__az4" (func $assembly/gen/moog/Moog#set:_az4))
 (export "gen_moog_set__amf" (func $assembly/gen/moog/Moog#set:_amf))
 (export "gen_moog_set__kVt" (func $assembly/gen/moog/Moog#set:_kVt))
 (export "gen_moog_set__m_kacr" (func $assembly/gen/moog/Moog#set:_m_kacr))
 (export "gen_moog_set__m_k2vg" (func $assembly/gen/moog/Moog#set:_m_k2vg))
 (export "gen_moog_set__m_postGain" (func $assembly/gen/moog/Moog#set:_m_postGain))
 (export "gen_moog_set__params_freq" (func $assembly/gen/moog/Moog#set:_params_freq))
 (export "gen_moog_set__params_Q" (func $assembly/gen/moog/Moog#set:_params_Q))
 (export "gen_moog_constructor" (func $assembly/gen/moog/Moog#constructor))
 (export "gen_mlp_set_cut" (func $assembly/gen/mlp/Mlp#set:cut))
 (export "gen_mlp_set_q" (func $assembly/gen/mlp/Mlp#set:q))
 (export "gen_mlp_constructor" (func $assembly/gen/mlp/Mlp#constructor))
 (export "util_getObjectSize__gen_mlp_Mlp_" (func $assembly/util/getObjectSize<assembly/gen/mlp/Mlp>))
 (export "gen_mhp_set_cut" (func $assembly/gen/mlp/Mlp#set:cut))
 (export "gen_mhp_set_q" (func $assembly/gen/mlp/Mlp#set:q))
 (export "gen_mhp_constructor" (func $assembly/gen/mhp/Mhp#constructor))
 (export "util_getObjectSize__gen_mhp_Mhp_" (func $assembly/util/getObjectSize<assembly/gen/mlp/Mlp>))
 (export "gen_daverb_set_in" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "gen_daverb_set__pd" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_daverb_set__bw" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_daverb_set__fi" (func $assembly/gen/lp/Lp#set:_sample))
 (export "gen_daverb_set__si" (func $assembly/gen/moog/Moog#set:_m_azt4))
 (export "gen_daverb_set__dc" (func $assembly/gen/osc/Osc#set:_sample))
 (export "gen_daverb_set__ft" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_daverb_set__st" (func $assembly/gen/delay/Delay#set:_targetf))
 (export "gen_daverb_set__dp" (func $assembly/gen/moog/Moog#set:_x1))
 (export "gen_daverb_set__ex" (func $assembly/gen/moog/Moog#set:_az3))
 (export "gen_daverb_set__ed" (func $assembly/gen/moog/Moog#set:_az4))
 (export "gen_daverb_set__params_pd" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:saw))
 (export "gen_daverb_set__params_bw" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:ramp))
 (export "gen_daverb_set__params_fi" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:sqr))
 (export "gen_daverb_set__params_si" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tri))
 (export "gen_daverb_set__params_dc" (func $assembly/gen/daverb/Daverb#set:_params_dc))
 (export "gen_daverb_set__params_ft" (func $assembly/gen/moog/Moog#set:_params_freq))
 (export "gen_daverb_set__params_st" (func $assembly/gen/moog/Moog#set:_params_Q))
 (export "gen_daverb_set__params_dp" (func $assembly/gen/daverb/Daverb#set:_params_dp))
 (export "gen_daverb_set__params_ex" (func $assembly/gen/daverb/Daverb#set:_params_ex))
 (export "gen_daverb_set__params_ed" (func $assembly/core/clock/Clock#set:sampleRate))
 (export "gen_daverb_set__dpn" (func $assembly/gen/daverb/Daverb#set:_dpn))
 (export "gen_daverb_set__exn" (func $assembly/gen/daverb/Daverb#set:_exn))
 (export "gen_daverb_set__edn" (func $assembly/gen/daverb/Daverb#set:_edn))
 (export "gen_daverb_set__pdn" (func $assembly/gen/slp/Slp#set:cut))
 (export "gen_daverb_set__predelay" (func $assembly/gen/daverb/Daverb#set:_predelay))
 (export "gen_daverb_set__d0" (func $assembly/gen/daverb/Daverb#set:_d0))
 (export "gen_daverb_set__d1" (func $assembly/gen/daverb/Daverb#set:_d1))
 (export "gen_daverb_set__d2" (func $assembly/gen/daverb/Daverb#set:_d2))
 (export "gen_daverb_set__d3" (func $assembly/gen/daverb/Daverb#set:_d3))
 (export "gen_daverb_set__d4" (func $assembly/gen/daverb/Daverb#set:_d4))
 (export "gen_daverb_set__d5" (func $assembly/gen/daverb/Daverb#set:_d5))
 (export "gen_daverb_set__d6" (func $assembly/gen/daverb/Daverb#set:_d6))
 (export "gen_daverb_set__d7" (func $assembly/gen/daverb/Daverb#set:_d7))
 (export "gen_daverb_set__d8" (func $assembly/gen/daverb/Daverb#set:_d8))
 (export "gen_daverb_set__d9" (func $assembly/gen/daverb/Daverb#set:_d9))
 (export "gen_daverb_set__d10" (func $assembly/gen/daverb/Daverb#set:_d10))
 (export "gen_daverb_set__d11" (func $assembly/gen/daverb/Daverb#set:_d11))
 (export "gen_daverb_set__index" (func $assembly/gen/daverb/Daverb#set:_index))
 (export "gen_daverb_set__mask" (func $assembly/gen/daverb/Daverb#set:_mask))
 (export "gen_daverb_set__lp1" (func $assembly/gen/daverb/Daverb#set:_lp1))
 (export "gen_daverb_set__lp2" (func $assembly/gen/daverb/Daverb#set:_lp2))
 (export "gen_daverb_set__lp3" (func $assembly/gen/daverb/Daverb#set:_lp3))
 (export "gen_daverb_set__excPhase" (func $assembly/gen/daverb/Daverb#set:_excPhase))
 (export "gen_daverb_constructor" (func $assembly/gen/daverb/Daverb#constructor))
 (export "util_getObjectSize__gen_daverb_Daverb_" (func $assembly/util/getObjectSize<assembly/gen/daverb/Daverb>))
 (export "gen_tanh_set_gain" (func $assembly/gen/gen/Gen#set:gain))
 (export "gen_tanh_set__gainv" (func $assembly/gen/tanh/Tanh#set:_gainv))
 (export "gen_tanh_set_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableLength))
 (export "gen_tanh_constructor" (func $assembly/gen/tanh/Tanh#constructor))
 (export "util_getObjectSize__gen_tanh_Tanh_" (func $assembly/util/getObjectSize<assembly/gen/tap/Tap>))
 (export "gen_diode_set_cut" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_diode_set_hpf" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_diode_set_sat" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_diode_set_q" (func $assembly/gen/lp/Lp#set:_sample))
 (export "gen_diode_set_in" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_diode_set__z0" (func $assembly/gen/osc/Osc#set:_sample))
 (export "gen_diode_set__z1" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_diode_set__z2" (func $assembly/gen/delay/Delay#set:_targetf))
 (export "gen_diode_set__z3" (func $assembly/gen/moog/Moog#set:_x1))
 (export "gen_diode_set__z4" (func $assembly/gen/moog/Moog#set:_az3))
 (export "gen_diode_set__A" (func $assembly/gen/moog/Moog#set:_az4))
 (export "gen_diode_set__a" (func $assembly/gen/moog/Moog#set:_amf))
 (export "gen_diode_set__a2" (func $assembly/gen/moog/Moog#set:_kVt))
 (export "gen_diode_set__b" (func $assembly/gen/moog/Moog#set:_m_kacr))
 (export "gen_diode_set__b2" (func $assembly/gen/moog/Moog#set:_m_k2vg))
 (export "gen_diode_set__c" (func $assembly/gen/moog/Moog#set:_m_postGain))
 (export "gen_diode_set__g" (func $assembly/gen/diode/Diode#set:_g))
 (export "gen_diode_set__g0" (func $assembly/gen/diode/Diode#set:_g0))
 (export "gen_diode_set__ah" (func $assembly/gen/mlp/Mlp#set:cut))
 (export "gen_diode_set__bh" (func $assembly/gen/mlp/Mlp#set:q))
 (export "gen_diode_set__ainv" (func $assembly/gen/diode/Diode#set:_ainv))
 (export "gen_diode_set__k" (func $assembly/gen/daverb/Daverb#set:_dpn))
 (export "gen_diode_constructor" (func $assembly/gen/diode/Diode#constructor))
 (export "util_getObjectSize__gen_diode_Diode_" (func $assembly/util/getObjectSize<assembly/gen/diode/Diode>))
 (export "gen_dclip_set_in" (func $~lib/rt/common/OBJECT#set:gcInfo2))
 (export "gen_dclip_constructor" (func $assembly/gen/dclip/Dclip#constructor))
 (export "util_getObjectSize__gen_dclip_Dclip_" (func $assembly/util/getObjectSize<assembly/gen/rate/Rate>))
 (export "gen_dcliplin_set_threshold" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_dcliplin_set_factor" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_dcliplin_set_in" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "gen_dcliplin_constructor" (func $assembly/gen/dcliplin/Dcliplin#constructor))
 (export "util_getObjectSize__gen_dcliplin_Dcliplin_" (func $assembly/util/getObjectSize<assembly/gen/dc/Dc>))
 (export "gen_dclipexp_set_factor" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_dclipexp_set_in" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "gen_dclipexp_constructor" (func $assembly/gen/dclipexp/Dclipexp#constructor))
 (export "util_getObjectSize__gen_dclipexp_Dclipexp_" (func $assembly/util/getObjectSize<assembly/gen/dclipexp/Dclipexp>))
 (export "gen_clamp_set_min" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_clamp_set_max" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_clamp_set_in" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "gen_clamp_constructor" (func $assembly/gen/clamp/Clamp#constructor))
 (export "util_getObjectSize__gen_clamp_Clamp_" (func $assembly/util/getObjectSize<assembly/gen/dc/Dc>))
 (export "gen_clip_set_threshold" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_clip_set_in" (func $~lib/rt/common/OBJECT#set:rtId))
 (export "gen_clip_constructor" (func $assembly/gen/clip/Clip#constructor))
 (export "util_getObjectSize__gen_clip_Clip_" (func $assembly/util/getObjectSize<assembly/gen/dclipexp/Dclipexp>))
 (export "gen_comp_set_threshold" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_comp_set_ratio" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_comp_set_attack" (func $assembly/gen/osc/Osc#set:offset))
 (export "gen_comp_set_release" (func $assembly/gen/lp/Lp#set:_sample))
 (export "gen_comp_set_in" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_comp_set_sidechain" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "gen_comp_set__prevLevel" (func $assembly/gen/delay/Delay#set:_stepf))
 (export "gen_comp_set__gainReduction" (func $assembly/gen/delay/Delay#set:_targetf))
 (export "gen_comp_constructor" (func $assembly/gen/comp/Comp#constructor))
 (export "util_getObjectSize__gen_comp_Comp_" (func $assembly/util/getObjectSize<assembly/gen/sin/Sin>))
 (export "gen_sample_set_offset" (func $assembly/gen/osc/Osc#set:hz))
 (export "gen_sample_set_trig" (func $assembly/gen/osc/Osc#set:trig))
 (export "gen_sample_set__floats" (func $~lib/rt/common/OBJECT#set:rtSize))
 (export "gen_sample_set__mask" (func $assembly/core/wavetable/Wavetable#set:exp))
 (export "gen_sample_set__phase" (func $assembly/core/wavetable/Wavetable#set:noise))
 (export "gen_sample_set__step" (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables))
 (export "gen_sample_set__offsetCurrent" (func $assembly/core/clock/Clock#set:internalTime))
 (export "gen_sample_set__offsetTarget" (func $assembly/core/clock/Clock#set:bpm))
 (export "gen_sample_set__lastTrig" (func $assembly/gen/moog/Moog#set:_az4))
 (export "gen_sample_constructor" (func $assembly/gen/sample/Sample#constructor))
 (export "gen_freesound_set_id" (func $assembly/gen/moog/Moog#set:_amf))
 (export "gen_freesound_constructor" (func $assembly/gen/freesound/Freesound#constructor))
 (export "util_getObjectSize__gen_freesound_Freesound_" (func $assembly/util/getObjectSize<assembly/gen/freesound/Freesound>))
 (export "gen_freesound_get_id" (func $assembly/gen/freesound/Freesound#get:id))
 (export "env_logf" (func $assembly/env/logf))
 (export "gen_say_set_text" (func $assembly/gen/moog/Moog#set:_amf))
 (export "gen_say_constructor" (func $assembly/gen/say/Say#constructor))
 (export "util_getObjectSize__gen_say_Say_" (func $assembly/util/getObjectSize<assembly/gen/freesound/Freesound>))
 (export "gen_gen__update" (func $assembly/gen/gen/Gen#_update))
 (export "gen_gen__reset" (func $assembly/gen/gen/Gen#_update))
 (export "gen_gen__audio" (func $assembly/gen/gen/Gen#_audio))
 (export "pow_audio_scalar" (func $assembly/math/pow_audio_scalar))
 (export "pow_scalar_audio" (func $assembly/math/pow_scalar_audio))
 (export "pow_scalar_scalar" (func $assembly/math/pow_scalar_scalar))
 (export "mul_audio_scalar" (func $assembly/math/mul_audio_scalar))
 (export "mul_audio_audio" (func $assembly/math/mul_audio_audio))
 (export "div_audio_scalar" (func $assembly/math/div_audio_scalar))
 (export "div_scalar_audio" (func $assembly/math/div_scalar_audio))
 (export "add_audio_scalar" (func $assembly/math/add_audio_scalar))
 (export "sub_audio_scalar" (func $assembly/math/sub_audio_scalar))
 (export "sub_audio_audio" (func $assembly/math/sub_audio_audio))
 (export "not_audio" (func $assembly/math/not_audio))
 (export "to_audio_scalar" (func $assembly/math/to_audio_scalar))
 (export "join_join21g" (func $assembly/graph/join/join21g))
 (export "join_join21" (func $assembly/graph/join/join21))
 (export "dc_bias_dcBias" (func $assembly/graph/dc-bias/dcBias))
 (export "rms_" (func $assembly/graph/rms/rms))
 (export "index_preventTreeShaking" (func $assembly/index/preventTreeShaking))
 (export "bench_audio_benchAudio" (func $assembly/bench/bench-audio/benchAudio))
 (export "gen_gen_get_gain" (func $assembly/gen/gen/Gen#get:gain))
 (export "bench_audio_benchAudioGain" (func $assembly/bench/bench-audio/benchAudioGain))
 (export "bench_audio_benchAudioTwo" (func $assembly/bench/bench-audio/benchAudioTwo))
 (export "gen_bap_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bap_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_biquad_get__params_freq" (func $assembly/gen/biquad/Biquad#get:_params_freq))
 (export "util_clamp" (func $assembly/util/clamp))
 (export "util_paramClamp" (func $assembly/util/paramClamp))
 (export "gen_biquad_get__params_Q" (func $assembly/gen/biquad/Biquad#get:_params_Q))
 (export "gen_gen_get__engine" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "gen_biquad_get__a0" (func $assembly/gen/biquad/Biquad#get:_a0))
 (export "gen_biquad_get__b0" (func $assembly/gen/biquad/Biquad#get:_b0))
 (export "gen_biquad_get__b1" (func $assembly/gen/biquad/Biquad#get:_b1))
 (export "gen_biquad_get__b2" (func $assembly/gen/biquad/Biquad#get:_b2))
 (export "gen_biquad_get__a1" (func $assembly/gen/biquad/Biquad#get:_a1))
 (export "gen_biquad_get__a2" (func $assembly/gen/biquad/Biquad#get:_a2))
 (export "gen_bap__update" (func $assembly/gen/bap/Bap#_update))
 (export "gen_bbp_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bbp_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bbp__update" (func $assembly/gen/bbp/Bbp#_update))
 (export "gen_bhp_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bhp_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bhp__update" (func $assembly/gen/bhp/Bhp#_update))
 (export "gen_bhs_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bhs_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bhs_get_amt" (func $assembly/gen/bhs/Bhs#get:amt))
 (export "gen_biquad_get__params_gain" (func $assembly/gen/biquad/Biquad#get:_params_gain))
 (export "gen_bhs__update" (func $assembly/gen/bhs/Bhs#_update))
 (export "gen_blp_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_blp_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_blp__update" (func $assembly/gen/blp/Blp#_update))
 (export "gen_bls_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bls_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bls_get_amt" (func $assembly/gen/bhs/Bhs#get:amt))
 (export "gen_bls__update" (func $assembly/gen/bls/Bls#_update))
 (export "gen_bno_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bno_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bno__update" (func $assembly/gen/bno/Bno#_update))
 (export "gen_bpk_get_cut" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_bpk_get_q" (func $assembly/gen/bap/Bap#get:q))
 (export "gen_bpk_get_amt" (func $assembly/gen/bhs/Bhs#get:amt))
 (export "gen_bpk__update" (func $assembly/gen/bpk/Bpk#_update))
 (export "gen_comp__update" (func $assembly/gen/gen/Gen#_update))
 (export "gen_daverb_get__dp" (func $assembly/gen/daverb/Daverb#get:_dp))
 (export "gen_daverb_get__ex" (func $assembly/gen/daverb/Daverb#get:_ex))
 (export "gen_daverb_get__ed" (func $assembly/gen/daverb/Daverb#get:_ed))
 (export "gen_daverb_get__pd" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_daverb__update" (func $assembly/gen/daverb/Daverb#_update))
 (export "gen_delay_get_ms" (func $assembly/gen/delay/Delay#get:ms))
 (export "engine_get_rateStep" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "gen_delay_get__stepf" (func $assembly/gen/delay/Delay#get:_stepf))
 (export "gen_delay_get__targetf" (func $assembly/gen/delay/Delay#get:_targetf))
 (export "gen_delay__update" (func $assembly/gen/delay/Delay#_update))
 (export "gen_diode_get_hpf" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_diode_clamp" (func $assembly/gen/diode/clamp))
 (export "gen_diode_get_q" (func $assembly/gen/diode/Diode#get:q))
 (export "gen_diode_get__k" (func $assembly/gen/diode/Diode#get:_k))
 (export "gen_diode_get_cut" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_diode__update" (func $assembly/gen/diode/Diode#_update))
 (export "gen_lp_get_cut" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_lp__update" (func $assembly/gen/lp/Lp#_update))
 (export "gen_mhp_get_cut" (func $assembly/gen/mhp/Mhp#get:cut))
 (export "gen_mhp_get_q" (func $assembly/gen/mhp/Mhp#get:q))
 (export "gen_moog_get__params_freq" (func $assembly/gen/moog/Moog#get:_params_freq))
 (export "gen_moog_get__params_Q" (func $assembly/gen/moog/Moog#get:_params_Q))
 (export "gen_moog_get__kVt" (func $assembly/gen/moog/Moog#get:_kVt))
 (export "gen_moog_get__v2" (func $assembly/gen/delay/Delay#get:_targetf))
 (export "gen_mhp__update" (func $assembly/gen/mhp/Mhp#_update))
 (export "gen_mlp_get_cut" (func $assembly/gen/mhp/Mhp#get:cut))
 (export "gen_mlp_get_q" (func $assembly/gen/mhp/Mhp#get:q))
 (export "gen_mlp__update" (func $assembly/gen/mhp/Mhp#_update))
 (export "gen_rate_get_samples" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_rate_get__engine" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "gen_rate__update" (func $assembly/gen/rate/Rate#_update))
 (export "gen_sap_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_sap_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_svf_get__params_freq" (func $assembly/gen/biquad/Biquad#get:_params_freq))
 (export "gen_svf_get__params_Q" (func $assembly/gen/biquad/Biquad#get:_params_Q))
 (export "gen_svf_get__k" (func $assembly/gen/biquad/Biquad#get:_b2))
 (export "gen_svf_get__a1" (func $assembly/gen/svf/Svf#get:_a1))
 (export "gen_svf_get__a2" (func $assembly/gen/svf/Svf#get:_a2))
 (export "gen_sap__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_sbp_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_sbp_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_sbp__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_shp_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_shp_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_shp__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_slp_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_slp_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_slp__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_sno_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_sno_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_sno__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_spk_get_cut" (func $assembly/gen/sap/Sap#get:cut))
 (export "gen_spk_get_q" (func $assembly/gen/bap/Bap#get:cut))
 (export "gen_spk__update" (func $assembly/gen/sap/Sap#_update))
 (export "gen_tanh_get_gain" (func $assembly/gen/gen/Gen#get:gain))
 (export "gen_tanh__update" (func $assembly/gen/tanh/Tanh#_update))
 (export "gen_tap_get_ms" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_tap_get__stepf" (func $assembly/gen/tap/Tap#get:_stepf))
 (export "gen_tap_get__targetf" (func $assembly/gen/delay/Delay#get:_stepf))
 (export "gen_tap__update" (func $assembly/gen/tap/Tap#_update))
 (export "gen_osc_get_hz" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_osc_get_offset" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_osc_get__lastTrig" (func $assembly/gen/osc/Osc#get:_lastTrig))
 (export "gen_osc_get_trig" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_osc__update" (func $assembly/gen/osc/Osc#_update))
 (export "gen_sample_get_offset" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_sample_get__mask" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "gen_sample_get__offsetCurrent" (func $assembly/gen/svf/Svf#get:_a1))
 (export "gen_sample_get__offsetTarget" (func $assembly/gen/svf/Svf#get:_a2))
 (export "gen_sample_get__lastTrig" (func $assembly/gen/daverb/Daverb#get:_ed))
 (export "gen_sample_get_trig" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_sample__update" (func $assembly/gen/sample/Sample#_update))
 (export "engine_get_wavetable" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "wavetable_get_antialias" (func $assembly/core/runner/Runner#get:clock))
 (export "antialias_wavetable_AntialiasWavetable_get_numOfTables" (func $assembly/core/runner/Runner#get:clock))
 (export "antialias_wavetable_AntialiasWavetable_getTableIndex" (func $assembly/core/antialias-wavetable/AntialiasWavetable#getTableIndex))
 (export "antialias_wavetable_AntialiasWavetable_get_stepShift" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:stepShift))
 (export "gen_osc_get__step" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_aosc__update" (func $assembly/gen/aosc/AOsc#_update))
 (export "gen_delay_get__floats" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "gen_delay__reset" (func $assembly/gen/delay/Delay#_reset))
 (export "gen_clamp_get_min" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_clamp_get_max" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_clamp_get_in" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "gen_clamp__audio" (func $assembly/gen/clamp/Clamp#_audio))
 (export "gen_clip_get_threshold" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_clip_get_in" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "gen_clip__audio" (func $assembly/gen/clip/Clip#_audio))
 (export "gen_comp_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_comp_get__gainReduction" (func $assembly/gen/delay/Delay#get:_targetf))
 (export "gen_comp_get_threshold" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_comp_get_ratio" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_comp_get_attack" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_comp_get_release" (func $assembly/gen/diode/Diode#get:q))
 (export "gen_comp_get_sidechain" (func $assembly/core/runner/Runner#get:clock))
 (export "gen_comp__audio" (func $assembly/gen/comp/Comp#_audio))
 (export "gen_daverb_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "gen_daverb_get__mask" (func $assembly/gen/daverb/Daverb#get:_mask))
 (export "gen_daverb_get__index" (func $assembly/gen/daverb/Daverb#get:_index))
 (export "gen_daverb_get__lp1" (func $assembly/gen/daverb/Daverb#get:_lp1))
 (export "gen_daverb_get__lp2" (func $assembly/gen/daverb/Daverb#get:_lp2))
 (export "gen_daverb_get__lp3" (func $assembly/gen/daverb/Daverb#get:_lp3))
 (export "gen_daverb_get__excPhase" (func $assembly/gen/daverb/Daverb#get:_excPhase))
 (export "gen_daverb_get__predelay" (func $assembly/gen/daverb/Daverb#get:_predelay))
 (export "gen_daverb_get__bw" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_daverb_get__pdn" (func $assembly/gen/sap/Sap#get:cut))
 (export "util_cubic" (func $assembly/util/cubic))
 (export "gen_daverb_get__fi" (func $assembly/gen/diode/Diode#get:q))
 (export "gen_daverb_get__d0" (func $assembly/gen/daverb/Daverb#get:_d0))
 (export "gen_daverb_get__d1" (func $assembly/gen/daverb/Daverb#get:_d1))
 (export "gen_daverb_get__si" (func $assembly/gen/daverb/Daverb#get:_si))
 (export "gen_daverb_get__d2" (func $assembly/gen/daverb/Daverb#get:_d2))
 (export "gen_daverb_get__d3" (func $assembly/gen/daverb/Daverb#get:_d3))
 (export "gen_daverb_get__edn" (func $assembly/gen/daverb/Daverb#get:_edn))
 (export "wavetable_get_mask" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag))
 (export "wavetable_readAt" (func $assembly/core/wavetable/Wavetable#readAt))
 (export "gen_daverb_get__d4" (func $assembly/gen/daverb/Daverb#get:_d4))
 (export "gen_daverb_get__dc" (func $assembly/gen/tap/Tap#get:_stepf))
 (export "gen_daverb_get__d11" (func $assembly/gen/daverb/Daverb#get:_d11))
 (export "gen_daverb_get__ft" (func $assembly/gen/delay/Delay#get:_stepf))
 (export "gen_daverb_get__d5" (func $assembly/gen/daverb/Daverb#get:_d5))
 (export "gen_daverb_get__dpn" (func $assembly/gen/diode/Diode#get:_k))
 (export "gen_daverb_get__st" (func $assembly/gen/delay/Delay#get:_targetf))
 (export "gen_daverb_get__d6" (func $assembly/gen/daverb/Daverb#get:_d6))
 (export "gen_daverb_get__d7" (func $assembly/gen/daverb/Daverb#get:_d7))
 (export "gen_daverb_get__d8" (func $assembly/gen/daverb/Daverb#get:_d8))
 (export "gen_daverb_get__d9" (func $assembly/gen/daverb/Daverb#get:_d9))
 (export "gen_daverb_get__d10" (func $assembly/gen/daverb/Daverb#get:_d10))
 (export "gen_daverb__audio" (func $assembly/gen/daverb/Daverb#_audio))
 (export "gen_dc_get_ceil" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_dc_get_sample" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_dc_get_in" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "gen_dc__audio" (func $assembly/gen/dc/Dc#_audio))
 (export "gen_dclip_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "gen_dclip__audio" (func $assembly/gen/dclip/Dclip#_audio))
 (export "gen_dclipexp_get_factor" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_dclipexp_get_in" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "gen_dclipexp__audio" (func $assembly/gen/dclipexp/Dclipexp#_audio))
 (export "gen_dcliplin_get_threshold" (func $assembly/gen/delay/Delay#get:ms))
 (export "gen_dcliplin_get_factor" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_dcliplin_get_in" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "gen_dcliplin__audio" (func $assembly/gen/dcliplin/Dcliplin#_audio))
 (export "gen_delay_get_in" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "gen_delay_get__mask" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_delay_get__index" (func $assembly/core/runner/Runner#get:clock))
 (export "gen_delay_get_fb" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_delay__audio" (func $assembly/gen/delay/Delay#_audio))
 (export "gen_diode_get__A" (func $assembly/gen/daverb/Daverb#get:_ed))
 (export "gen_diode_get__a" (func $assembly/gen/freesound/Freesound#get:id))
 (export "gen_diode_get__a2" (func $assembly/gen/moog/Moog#get:_kVt))
 (export "gen_diode_get__b" (func $assembly/gen/diode/Diode#get:_b))
 (export "gen_diode_get__b2" (func $assembly/gen/diode/Diode#get:_b2))
 (export "gen_diode_get__c" (func $assembly/gen/diode/Diode#get:_c))
 (export "gen_diode_get__g" (func $assembly/gen/diode/Diode#get:_g))
 (export "gen_diode_get__g0" (func $assembly/gen/diode/Diode#get:_g0))
 (export "gen_diode_get__ah" (func $assembly/gen/mhp/Mhp#get:cut))
 (export "gen_diode_get__bh" (func $assembly/gen/mhp/Mhp#get:q))
 (export "gen_diode_get__ainv" (func $assembly/gen/diode/Diode#get:_ainv))
 (export "gen_diode_get_sat" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_diode_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_diode_get__z0" (func $assembly/gen/tap/Tap#get:_stepf))
 (export "gen_diode_get__z1" (func $assembly/gen/delay/Delay#get:_stepf))
 (export "gen_diode_get__z2" (func $assembly/gen/delay/Delay#get:_targetf))
 (export "gen_diode_get__z3" (func $assembly/gen/daverb/Daverb#get:_dp))
 (export "gen_diode_get__z4" (func $assembly/gen/daverb/Daverb#get:_ex))
 (export "gen_diode_soft" (func $assembly/gen/diode/soft))
 (export "gen_diode__audio" (func $assembly/gen/diode/Diode#_audio))
 (export "gen_lp_get__alpha" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_lp_get__sample" (func $assembly/gen/diode/Diode#get:q))
 (export "gen_lp_get_in" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "gen_lp__audio" (func $assembly/gen/lp/Lp#_audio))
 (export "gen_moog_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "gen_moog_get__m_amf" (func $assembly/gen/delay/Delay#get:_stepf))
 (export "gen_moog_get__m_kacr" (func $assembly/gen/diode/Diode#get:_b))
 (export "gen_moog_get__m_azt1" (func $assembly/gen/daverb/Daverb#get:_pd))
 (export "gen_moog_get__m_k2vg" (func $assembly/gen/diode/Diode#get:_b2))
 (export "gen_moog_get__x1" (func $assembly/gen/daverb/Daverb#get:_dp))
 (export "gen_moog_tanha" (func $assembly/gen/moog/tanha))
 (export "gen_moog_get__m_azt2" (func $assembly/gen/osc/Osc#get:offset))
 (export "gen_moog_get__m_azt3" (func $assembly/gen/diode/Diode#get:q))
 (export "gen_moog_get__az3" (func $assembly/gen/daverb/Daverb#get:_ex))
 (export "gen_moog_get__m_azt4" (func $assembly/gen/daverb/Daverb#get:_si))
 (export "gen_moog_get__az4" (func $assembly/gen/daverb/Daverb#get:_ed))
 (export "gen_moog_get__m_postGain" (func $assembly/gen/diode/Diode#get:_c))
 (export "gen_mhp__audio" (func $assembly/gen/mhp/Mhp#_audio))
 (export "gen_mlp__audio" (func $assembly/gen/mlp/Mlp#_audio))
 (export "gen_svf_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "gen_svf_get__c2" (func $assembly/gen/svf/Svf#get:_c2))
 (export "gen_svf_get__c1" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:topFreq))
 (export "gen_svf_get__v3" (func $assembly/gen/biquad/Biquad#get:_b1))
 (export "gen_svf_get__a3" (func $assembly/gen/biquad/Biquad#get:_a0))
 (export "gen_svf_get__v1" (func $assembly/gen/biquad/Biquad#get:_a2))
 (export "gen_svf_get__v2" (func $assembly/gen/biquad/Biquad#get:_b0))
 (export "gen_svf_get__v0" (func $assembly/gen/biquad/Biquad#get:_a1))
 (export "gen_sap__audio" (func $assembly/gen/sap/Sap#_audio))
 (export "gen_sbp__audio" (func $assembly/gen/sbp/Sbp#_audio))
 (export "gen_shp__audio" (func $assembly/gen/shp/Shp#_audio))
 (export "gen_slp__audio" (func $assembly/gen/slp/Slp#_audio))
 (export "gen_sno__audio" (func $assembly/gen/sno/Sno#_audio))
 (export "gen_spk__audio" (func $assembly/gen/spk/Spk#_audio))
 (export "gen_tanh_get__gainv" (func $assembly/gen/tanh/Tanh#get:_gainv))
 (export "gen_tanh_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:tableLength))
 (export "gen_tanh__audio" (func $assembly/gen/tanh/Tanh#_audio))
 (export "gen_tap_get_in" (func $assembly/core/wavetable/Wavetable#get:sine))
 (export "gen_tap_get__mask" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "gen_tap_get__index" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_tap_get__floats" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "gen_tap__audio" (func $assembly/gen/tap/Tap#_audio))
 (export "gen_zero__audio" (func $assembly/gen/zero/Zero#_audio))
 (export "gen_biquad_get_in" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs))
 (export "gen_biquad_get__x1" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:topFreq))
 (export "gen_biquad_get__x2" (func $assembly/gen/svf/Svf#get:_c2))
 (export "gen_biquad_get__y1" (func $assembly/gen/svf/Svf#get:_a1))
 (export "gen_biquad_get__y2" (func $assembly/gen/svf/Svf#get:_a2))
 (export "gen_biquad__audio" (func $assembly/gen/biquad/Biquad#_audio))
 (export "gen_osc_get__table" (func $assembly/gen/osc/Osc#get:_table))
 (export "gen_osc_get__mask" (func $assembly/gen/osc/Osc#get:_mask))
 (export "gen_osc_get__phase" (func $assembly/core/wavetable/Wavetable#get:exp))
 (export "gen_osc_get__offsetU32" (func $assembly/core/wavetable/Wavetable#get:size))
 (export "wavetable_read" (func $assembly/core/wavetable/Wavetable#read))
 (export "gen_osc__audio" (func $assembly/gen/osc/Osc#_audio))
 (export "gen_sample_get__phase" (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms))
 (export "gen_sample_get__floats" (func $~lib/rt/common/OBJECT#get:rtSize))
 (export "util_cubicFrac" (func $assembly/util/cubicFrac))
 (export "gen_sample__audio" (func $assembly/gen/sample/Sample#_audio))
 (export "gen_exp_get__table" (func $assembly/gen/exp/Exp#get:_table))
 (export "gen_noise_get__table" (func $assembly/gen/noise/Noise#get:_table))
 (export "gen_sin_get__table" (func $assembly/gen/osc/Osc#get:_table))
 (export "gen_aosc_get__tables" (func $assembly/gen/aosc/AOsc#get:_tables))
 (export "gen_aosc_get__tableIndex" (func $assembly/gen/aosc/AOsc#get:_tableIndex))
 (export "gen_aosc_get__table" (func $assembly/gen/aosc/AOsc#get:_table))
 (export "antialias_wavetable_AntialiasWavetable_get_tableMask" (func $assembly/core/wavetable/Wavetable#get:size))
 (export "gen_aosc_get__mask" (func $assembly/gen/aosc/AOsc#get:_mask))
 (export "gen_ramp_get__tables" (func $assembly/gen/ramp/Ramp#get:_tables))
 (export "gen_saw_get__tables" (func $assembly/gen/aosc/AOsc#get:_tables))
 (export "gen_sqr_get__tables" (func $assembly/gen/sqr/Sqr#get:_tables))
 (export "gen_tri_get__tables" (func $assembly/gen/tri/Tri#get:_tables))
 (export "gen_gen__update_override" (func $assembly/gen/gen/Gen#_update@override))
 (export "gen_gen__reset_override" (func $assembly/gen/gen/Gen#_reset@override))
 (export "gen_gen__audio_override" (func $assembly/gen/gen/Gen#_audio@override))
 (export "gen_osc_get__table_override" (func $assembly/gen/osc/Osc#get:_table@override))
 (export "gen_osc_get__mask_override" (func $assembly/gen/osc/Osc#get:_mask@override))
 (export "gen_aosc_get__tables_override" (func $assembly/gen/aosc/AOsc#get:_tables@override))
 (start $~start)
 (func $assembly/gen/daverb/nearestPowerOfTwo (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.const 1
  i32.sub
  i32.and
  i32.eqz
  if
   local.get $0
   return
  end
  i32.const 1
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $1
   i32.gt_u
   if
    local.get $1
    i32.const 1
    i32.shl
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $1
  local.get $1
  i32.const 1
  i32.shl
  local.tee $2
  local.get $1
  local.get $0
  i32.sub
  local.get $2
  local.get $0
  i32.sub
  i32.lt_u
  select
 )
 (func $start:assembly/gen/daverb
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  i32.const 1
  local.set $0
  loop $while-continue|0
   local.get $0
   i32.const 210
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $while-continue|0
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 210
  i32.sub
  local.get $1
  i32.const 210
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld0
  i32.const 1
  local.set $0
  loop $while-continue|02
   local.get $0
   i32.const 158
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|02
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 158
  i32.sub
  local.get $1
  i32.const 158
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld1
  i32.const 1
  local.set $0
  loop $while-continue|03
   local.get $0
   i32.const 561
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $while-continue|03
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 561
  i32.sub
  local.get $1
  i32.const 561
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld2
  i32.const 1
  local.set $0
  loop $while-continue|04
   local.get $0
   i32.const 410
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $while-continue|04
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 410
  i32.sub
  local.get $1
  i32.const 410
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld3
  i32.const 1
  local.set $0
  loop $while-continue|05
   local.get $0
   i32.const 995
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $while-continue|05
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 995
  i32.sub
  local.get $1
  i32.const 995
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld4
  i32.const 1
  local.set $0
  loop $while-continue|06
   local.get $0
   i32.const 6598
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $while-continue|06
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 6598
  i32.sub
  local.get $1
  i32.const 6598
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld5
  i32.const 1
  local.set $0
  loop $while-continue|07
   local.get $0
   i32.const 2667
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $while-continue|07
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 2667
  i32.sub
  local.get $1
  i32.const 2667
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld6
  i32.const 1
  local.set $0
  loop $while-continue|08
   local.get $0
   i32.const 5512
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $8
    i32.const 1
    i32.add
    local.set $8
    br $while-continue|08
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 5512
  i32.sub
  local.get $1
  i32.const 5512
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld7
  i32.const 1
  local.set $0
  loop $while-continue|09
   local.get $0
   i32.const 1345
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $9
    i32.const 1
    i32.add
    local.set $9
    br $while-continue|09
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 1345
  i32.sub
  local.get $1
  i32.const 1345
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld8
  i32.const 1
  local.set $0
  loop $while-continue|010
   local.get $0
   i32.const 6248
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $10
    i32.const 1
    i32.add
    local.set $10
    br $while-continue|010
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 6248
  i32.sub
  local.get $1
  i32.const 6248
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld9
  i32.const 1
  local.set $0
  loop $while-continue|011
   local.get $0
   i32.const 3935
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $11
    i32.const 1
    i32.add
    local.set $11
    br $while-continue|011
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 3935
  i32.sub
  local.get $1
  i32.const 3935
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld10
  i32.const 1
  local.set $0
  loop $while-continue|012
   local.get $0
   i32.const 4686
   i32.lt_u
   if
    local.get $0
    i32.const 1
    i32.shl
    local.set $0
    local.get $12
    i32.const 1
    i32.add
    local.set $12
    br $while-continue|012
   end
  end
  local.get $0
  local.get $0
  i32.const 1
  i32.shl
  local.tee $1
  local.get $0
  i32.const 4686
  i32.sub
  local.get $1
  i32.const 4686
  i32.sub
  i32.lt_u
  select
  global.set $assembly/gen/daverb/ld11
  global.get $assembly/gen/daverb/ld0
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md0
  global.get $assembly/gen/daverb/ld1
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md1
  global.get $assembly/gen/daverb/ld2
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md2
  global.get $assembly/gen/daverb/ld3
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md3
  global.get $assembly/gen/daverb/ld4
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md4
  global.get $assembly/gen/daverb/ld5
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md5
  global.get $assembly/gen/daverb/ld6
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md6
  global.get $assembly/gen/daverb/ld7
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md7
  global.get $assembly/gen/daverb/ld8
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md8
  global.get $assembly/gen/daverb/ld9
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md9
  global.get $assembly/gen/daverb/ld10
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md10
  global.get $assembly/gen/daverb/ld11
  i32.const 1
  i32.sub
  global.set $assembly/gen/daverb/md11
 )
 (func $assembly/core/wavetable/Wavetable#set:length (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0
 )
 (func $assembly/core/wavetable/Wavetable#set:mask (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=4
 )
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 1048880
   i32.const 1048944
   i32.const 33
   i32.const 29
   call $~lib/builtins/abort
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.tee $1
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  local.tee $3
  memory.size $0
  local.tee $4
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $5
  i32.gt_u
  if
   local.get $4
   local.get $3
   local.get $5
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   memory.grow $0
   i32.const 0
   i32.lt_s
   if
    local.get $5
    memory.grow $0
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $3
  global.set $~lib/rt/stub/offset
  local.get $1
  local.get $0
  i32.store $0
  local.get $2
 )
 (func $~lib/rt/common/OBJECT#set:gcInfo2 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=8
 )
 (func $~lib/rt/common/OBJECT#set:rtId (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=12
 )
 (func $~lib/rt/common/OBJECT#set:rtSize (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=16
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 1048880
   i32.const 1048944
   i32.const 86
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store $0 offset=4
  local.get $2
  i32.const 0
  i32.store $0 offset=8
  local.get $2
  local.get $1
  i32.store $0 offset=12
  local.get $2
  local.get $0
  i32.store $0 offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/staticarray/StaticArray<f32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1048768
   i32.const 1048816
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill $0
  local.get $1
 )
 (func $assembly/core/wavetable/Wavetable#set:exp (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=20
 )
 (func $assembly/core/wavetable/Wavetable#set:noise (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=24
 )
 (func $assembly/util/nextPowerOfTwo (param $0 i32) (result i32)
  local.get $0
  i32.const 1
  i32.sub
  local.tee $0
  i32.const 1
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 2
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 4
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 8
  i32.shr_u
  local.get $0
  i32.or
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.or
  i32.const 1
  i32.add
 )
 (func $~lib/math/NativeMath.log2 (param $0 f64) (result f64)
  (local $1 i64)
  (local $2 i32)
  (local $3 i64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  (local $10 i32)
  block $~lib/util/math/log2_lut|inlined.0 (result f64)
   local.get $0
   i64.reinterpret_f64
   local.tee $1
   i64.const 4606800540372828160
   i64.sub
   i64.const 581272283906048
   i64.lt_u
   if
    local.get $0
    f64.const -1
    f64.add
    local.tee $5
    i64.reinterpret_f64
    i64.const -4294967296
    i64.and
    f64.reinterpret_i64
    local.tee $6
    f64.const 1.4426950407214463
    f64.mul
    local.set $7
    local.get $5
    local.get $5
    f64.mul
    local.tee $8
    local.get $8
    f64.mul
    local.set $0
    local.get $7
    local.get $8
    local.get $5
    f64.const 0.48089834696298744
    f64.mul
    f64.const -0.7213475204444817
    f64.add
    f64.mul
    local.tee $4
    f64.add
    local.tee $9
    local.get $5
    local.get $6
    f64.sub
    f64.const 1.4426950407214463
    f64.mul
    local.get $5
    f64.const 1.6751713164886512e-10
    f64.mul
    f64.add
    local.get $7
    local.get $9
    f64.sub
    local.get $4
    f64.add
    f64.add
    local.get $0
    local.get $5
    f64.const 0.2885390081805197
    f64.mul
    f64.const -0.360673760222145
    f64.add
    local.get $8
    local.get $5
    f64.const 0.2060992861022954
    f64.mul
    f64.const -0.24044917405728863
    f64.add
    f64.mul
    f64.add
    local.get $0
    local.get $5
    f64.const 0.1603032746063156
    f64.mul
    f64.const -0.18033596705327856
    f64.add
    local.get $8
    local.get $5
    f64.const 0.13046826811283835
    f64.mul
    f64.const -0.14483316576701266
    f64.add
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.mul
    f64.add
    f64.add
    br $~lib/util/math/log2_lut|inlined.0
   end
   local.get $1
   i64.const 48
   i64.shr_u
   i32.wrap_i64
   local.tee $2
   i32.const 16
   i32.sub
   i32.const 32736
   i32.ge_u
   if
    f64.const -1
    local.get $0
    local.get $0
    f64.mul
    f64.div
    local.get $1
    i64.const 1
    i64.shl
    i64.eqz
    br_if $~lib/util/math/log2_lut|inlined.0
    drop
    local.get $0
    local.get $1
    i64.const 9218868437227405312
    i64.eq
    br_if $~lib/util/math/log2_lut|inlined.0
    drop
    i32.const 1
    local.get $2
    i32.const 32752
    i32.and
    i32.const 32752
    i32.eq
    local.get $2
    i32.const 32768
    i32.and
    select
    if
     local.get $0
     local.get $0
     f64.sub
     local.tee $0
     local.get $0
     f64.div
     br $~lib/util/math/log2_lut|inlined.0
    end
    local.get $0
    f64.const 4503599627370496
    f64.mul
    i64.reinterpret_f64
    i64.const 234187180623265792
    i64.sub
    local.set $1
   end
   local.get $1
   i64.const 4604367669032910848
   i64.sub
   local.tee $3
   i64.const 46
   i64.shr_u
   i64.const 63
   i64.and
   i32.wrap_i64
   i32.const 4
   i32.shl
   local.tee $2
   i32.const 1048992
   i32.add
   local.set $10
   local.get $3
   i64.const 52
   i64.shr_s
   f64.convert_i64_s
   local.get $10
   f64.load $0 offset=8
   f64.add
   local.tee $0
   local.get $1
   local.get $3
   i64.const -4503599627370496
   i64.and
   i64.sub
   f64.reinterpret_i64
   local.get $2
   i32.const 1050016
   i32.add
   local.tee $2
   f64.load $0
   f64.sub
   local.get $2
   f64.load $0 offset=8
   f64.sub
   local.get $10
   f64.load $0
   f64.mul
   local.tee $4
   i64.reinterpret_f64
   i64.const -4294967296
   i64.and
   f64.reinterpret_i64
   local.tee $5
   f64.const 1.4426950407214463
   f64.mul
   local.tee $6
   f64.add
   local.set $7
   local.get $0
   local.get $7
   f64.sub
   local.get $6
   f64.add
   local.get $4
   local.get $5
   f64.sub
   f64.const 1.4426950407214463
   f64.mul
   local.get $4
   f64.const 1.6751713164886512e-10
   f64.mul
   f64.add
   f64.add
   local.get $4
   local.get $4
   f64.mul
   local.tee $0
   local.get $4
   f64.const 0.4808983469629985
   f64.mul
   f64.const -0.7213475204444882
   f64.add
   local.get $0
   local.get $4
   f64.const 0.2885390073180969
   f64.mul
   f64.const -0.36067375954075914
   f64.add
   f64.mul
   f64.add
   local.get $0
   local.get $0
   f64.mul
   local.get $4
   f64.const 0.2061202382173603
   f64.mul
   f64.const -0.2404693555628422
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   local.get $7
   f64.add
  end
 )
 (func $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1048768
   i32.const 1048816
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 13
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill $0
  local.get $1
 )
 (func $~lib/rt/common/OBJECT#get:rtSize (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=16
 )
 (func $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1048816
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store $0
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:saw (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=52
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:ramp (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=56
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:sqr (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=60
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tri (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=64
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:audioRate (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=48
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:topFreq (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=16
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:numOfTables (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=28
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableLength (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=32
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableMask (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=36
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:tableLength (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=32
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:stepShift (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=44
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:saw (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=52
 )
 (func $~lib/staticarray/StaticArray<f32>#__set (param $0 i32) (param $1 i32) (param $2 f32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1048816
   i32.const 93
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  f32.store $0
 )
 (func $assembly/core/antialias-wavetable/Real.saw (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  local.get $0
  local.get $1
  f32.const -1
  local.get $1
  f32.convert_i32_u
  f32.div
  local.tee $3
  call $~lib/staticarray/StaticArray<f32>#__set
  local.get $0
  local.get $2
  local.get $3
  f32.neg
  call $~lib/staticarray/StaticArray<f32>#__set
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:topFreq (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=16
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:maxHarms (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=24
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:imag (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=4
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:real (param $0 i32) (result i32)
  local.get $0
  i32.load $0
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#defineWaveform (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  local.get $0
  i32.load $0 offset=32
  i32.const 1
  i32.shr_u
  i32.gt_u
  if
   local.get $0
   i32.load $0 offset=32
   i32.const 1
   i32.shr_u
   local.set $1
  end
  local.get $0
  i32.load $0 offset=4
  local.tee $3
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  local.tee $4
  if
   local.get $3
   i32.const 0
   local.get $4
   i32.const 2
   i32.shl
   memory.fill $0
  end
  local.get $0
  i32.load $0
  local.tee $3
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  local.tee $4
  if
   local.get $3
   i32.const 0
   local.get $4
   i32.const 2
   i32.shl
   memory.fill $0
  end
  f32.const 1
  global.set $assembly/core/antialias-wavetable/Real.sign
  i32.const 1
  local.set $3
  local.get $0
  i32.load $0 offset=32
  i32.const 1
  i32.sub
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $3
   i32.ge_u
   if
    local.get $0
    i32.load $0
    local.get $3
    local.get $4
    local.get $2
    i32.load $0
    call_indirect $0 (type $i32_i32_i32_=>_none)
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    local.get $4
    i32.const 1
    i32.sub
    local.set $4
    br $for-loop|0
   end
  end
 )
 (func $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1048816
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load $0
  local.tee $0
  i32.eqz
  if
   i32.const 1051168
   i32.const 1048816
   i32.const 82
   i32.const 40
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
 )
 (func $~lib/staticarray/StaticArray<f32>#__get (param $0 i32) (param $1 i32) (result f32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1048816
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  f32.load $0
 )
 (func $~lib/math/NativeMathf.cos (param $0 f32) (result f32)
  (local $1 f64)
  (local $2 f64)
  (local $3 f64)
  (local $4 i32)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  local.get $0
  i32.reinterpret_f32
  local.tee $4
  i32.const 31
  i32.shr_u
  local.set $7
  block $folding-inner1
   block $folding-inner0
    local.get $4
    i32.const 2147483647
    i32.and
    local.tee $4
    i32.const 1061752794
    i32.le_u
    if
     local.get $4
     i32.const 964689920
     i32.lt_u
     if
      f32.const 1
      return
     end
     local.get $0
     f64.promote_f32
     local.tee $1
     local.get $1
     f64.mul
     local.tee $2
     local.get $2
     f64.mul
     local.set $3
     br $folding-inner0
    end
    local.get $4
    i32.const 1081824209
    i32.le_u
    if
     local.get $4
     i32.const 1075235811
     i32.gt_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 3.141592653589793
      f64.add
      local.get $1
      f64.const -3.141592653589793
      f64.add
      local.get $7
      select
      local.tee $1
      local.get $1
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $2
      local.get $1
      f64.const -0.499999997251031
      f64.mul
      f64.const 1
      f64.add
      local.get $2
      f64.const 0.04166662332373906
      f64.mul
      f64.add
      local.get $2
      local.get $1
      f64.mul
      local.get $1
      f64.const 2.439044879627741e-05
      f64.mul
      f64.const -0.001388676377460993
      f64.add
      f64.mul
      f64.add
      f32.demote_f64
      f32.neg
      return
     else
      local.get $7
      if (result f64)
       local.get $0
       f64.promote_f32
       f64.const 1.5707963267948966
       f64.add
       local.tee $3
       local.get $3
       f64.mul
       local.tee $2
       local.get $3
       f64.mul
      else
       f64.const 1.5707963267948966
       local.get $0
       f64.promote_f32
       f64.sub
       local.tee $3
       local.get $3
       f64.mul
       local.tee $2
       local.get $3
       f64.mul
      end
      local.set $1
      br $folding-inner1
     end
     unreachable
    end
    local.get $4
    i32.const 1088565717
    i32.le_u
    if
     local.get $4
     i32.const 1085271519
     i32.gt_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 6.283185307179586
      f64.add
      local.get $1
      f64.const -6.283185307179586
      f64.add
      local.get $7
      select
      local.tee $1
      local.get $1
      f64.mul
      local.tee $2
      local.get $2
      f64.mul
      local.set $3
      br $folding-inner0
     else
      local.get $7
      if (result f64)
       local.get $0
       f32.neg
       f64.promote_f32
       f64.const -4.71238898038469
       f64.add
       local.tee $3
       local.get $3
       f64.mul
       local.tee $2
       local.get $3
       f64.mul
      else
       local.get $0
       f64.promote_f32
       f64.const -4.71238898038469
       f64.add
       local.tee $3
       local.get $3
       f64.mul
       local.tee $2
       local.get $3
       f64.mul
      end
      local.set $1
      br $folding-inner1
     end
     unreachable
    end
    local.get $4
    i32.const 2139095040
    i32.ge_u
    if
     local.get $0
     local.get $0
     f32.sub
     return
    end
    block $~lib/math/rempio2f|inlined.0 (result i32)
     local.get $4
     i32.const 1305022427
     i32.lt_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 0.6366197723675814
      f64.mul
      f64.nearest
      local.set $2
      local.get $1
      local.get $2
      f64.const 1.5707963109016418
      f64.mul
      f64.sub
      local.get $2
      f64.const 1.5893254773528196e-08
      f64.mul
      f64.sub
      global.set $~lib/math/rempio2f_y
      local.get $2
      i32.trunc_sat_f64_s
      br $~lib/math/rempio2f|inlined.0
     end
     local.get $4
     i32.const 23
     i32.shr_u
     i32.const 152
     i32.sub
     local.tee $8
     i32.const 63
     i32.and
     i64.extend_i32_s
     local.set $5
     local.get $8
     i32.const 6
     i32.shr_s
     i32.const 3
     i32.shl
     i32.const 1051280
     i32.add
     local.tee $8
     i64.load $0 offset=8
     local.set $6
     f64.const 8.515303950216386e-20
     local.get $0
     f64.promote_f32
     f64.copysign
     local.get $4
     i32.const 8388607
     i32.and
     i32.const 8388608
     i32.or
     i64.extend_i32_s
     local.tee $9
     local.get $8
     i64.load $0
     local.get $5
     i64.shl
     local.get $6
     i64.const 64
     local.get $5
     i64.sub
     i64.shr_u
     i64.or
     i64.mul
     local.get $5
     i64.const 32
     i64.gt_u
     if (result i64)
      local.get $6
      local.get $5
      i64.const 32
      i64.sub
      i64.shl
      local.get $8
      i64.load $0 offset=16
      i64.const 96
      local.get $5
      i64.sub
      i64.shr_u
      i64.or
     else
      local.get $6
      i64.const 32
      local.get $5
      i64.sub
      i64.shr_u
     end
     local.get $9
     i64.mul
     i64.const 32
     i64.shr_u
     i64.add
     local.tee $5
     i64.const 2
     i64.shl
     local.tee $6
     f64.convert_i64_s
     f64.mul
     global.set $~lib/math/rempio2f_y
     i32.const 0
     local.get $5
     i64.const 62
     i64.shr_u
     local.get $6
     i64.const 63
     i64.shr_u
     i64.add
     i32.wrap_i64
     local.tee $4
     i32.sub
     local.get $4
     local.get $7
     select
    end
    local.set $4
    global.get $~lib/math/rempio2f_y
    local.set $1
    local.get $4
    i32.const 1
    i32.and
    if (result f32)
     local.get $1
     local.get $1
     local.get $1
     f64.mul
     local.tee $2
     local.get $1
     f64.mul
     local.tee $1
     local.get $2
     f64.const 0.008333329385889463
     f64.mul
     f64.const -0.16666666641626524
     f64.add
     f64.mul
     f64.add
     local.get $1
     local.get $2
     local.get $2
     f64.mul
     f64.mul
     local.get $2
     f64.const 2.718311493989822e-06
     f64.mul
     f64.const -1.9839334836096632e-04
     f64.add
     f64.mul
     f64.add
     f32.demote_f64
    else
     local.get $1
     local.get $1
     f64.mul
     local.tee $1
     local.get $1
     f64.mul
     local.set $2
     local.get $1
     f64.const -0.499999997251031
     f64.mul
     f64.const 1
     f64.add
     local.get $2
     f64.const 0.04166662332373906
     f64.mul
     f64.add
     local.get $2
     local.get $1
     f64.mul
     local.get $1
     f64.const 2.439044879627741e-05
     f64.mul
     f64.const -0.001388676377460993
     f64.add
     f64.mul
     f64.add
     f32.demote_f64
    end
    local.tee $0
    f32.neg
    local.get $0
    local.get $4
    i32.const 1
    i32.add
    i32.const 2
    i32.and
    select
    return
   end
   local.get $2
   f64.const -0.499999997251031
   f64.mul
   f64.const 1
   f64.add
   local.get $3
   f64.const 0.04166662332373906
   f64.mul
   f64.add
   local.get $3
   local.get $2
   f64.mul
   local.get $2
   f64.const 2.439044879627741e-05
   f64.mul
   f64.const -0.001388676377460993
   f64.add
   f64.mul
   f64.add
   f32.demote_f64
   return
  end
  local.get $3
  local.get $1
  local.get $2
  f64.const 0.008333329385889463
  f64.mul
  f64.const -0.16666666641626524
  f64.add
  f64.mul
  f64.add
  local.get $1
  local.get $2
  local.get $2
  f64.mul
  f64.mul
  local.get $2
  f64.const 2.718311493989822e-06
  f64.mul
  f64.const -1.9839334836096632e-04
  f64.add
  f64.mul
  f64.add
  f32.demote_f64
 )
 (func $~lib/math/NativeMathf.sin (param $0 f32) (result f32)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i64)
  (local $5 f64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  local.get $0
  i32.reinterpret_f32
  local.tee $3
  i32.const 31
  i32.shr_u
  local.set $7
  block $folding-inner0
   local.get $3
   i32.const 2147483647
   i32.and
   local.tee $3
   i32.const 1061752794
   i32.le_u
   if
    local.get $3
    i32.const 964689920
    i32.lt_u
    if
     local.get $0
     return
    end
    local.get $0
    f64.promote_f32
    local.tee $1
    local.get $1
    f64.mul
    local.tee $2
    local.get $1
    f64.mul
    local.set $5
    br $folding-inner0
   end
   local.get $3
   i32.const 1081824209
   i32.le_u
   if
    local.get $3
    i32.const 1075235811
    i32.le_u
    if
     local.get $7
     if (result f32)
      local.get $0
      f64.promote_f32
      f64.const 1.5707963267948966
      f64.add
      local.tee $1
      local.get $1
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $2
      local.get $1
      f64.const -0.499999997251031
      f64.mul
      f64.const 1
      f64.add
      local.get $2
      f64.const 0.04166662332373906
      f64.mul
      f64.add
      local.get $2
      local.get $1
      f64.mul
      local.get $1
      f64.const 2.439044879627741e-05
      f64.mul
      f64.const -0.001388676377460993
      f64.add
      f64.mul
      f64.add
      f32.demote_f64
      f32.neg
     else
      local.get $0
      f64.promote_f32
      f64.const -1.5707963267948966
      f64.add
      local.tee $1
      local.get $1
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $2
      local.get $1
      f64.const -0.499999997251031
      f64.mul
      f64.const 1
      f64.add
      local.get $2
      f64.const 0.04166662332373906
      f64.mul
      f64.add
      local.get $2
      local.get $1
      f64.mul
      local.get $1
      f64.const 2.439044879627741e-05
      f64.mul
      f64.const -0.001388676377460993
      f64.add
      f64.mul
      f64.add
      f32.demote_f64
     end
     return
    end
    local.get $0
    f64.promote_f32
    local.tee $1
    f64.const 3.141592653589793
    f64.add
    local.get $1
    f64.const -3.141592653589793
    f64.add
    local.get $7
    select
    f64.neg
    local.tee $1
    local.get $1
    f64.mul
    local.tee $2
    local.get $1
    f64.mul
    local.set $5
    br $folding-inner0
   end
   local.get $3
   i32.const 1088565717
   i32.le_u
   if
    local.get $3
    i32.const 1085271519
    i32.le_u
    if
     local.get $7
     if (result f32)
      local.get $0
      f64.promote_f32
      f64.const 4.71238898038469
      f64.add
      local.tee $1
      local.get $1
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $2
      local.get $1
      f64.const -0.499999997251031
      f64.mul
      f64.const 1
      f64.add
      local.get $2
      f64.const 0.04166662332373906
      f64.mul
      f64.add
      local.get $2
      local.get $1
      f64.mul
      local.get $1
      f64.const 2.439044879627741e-05
      f64.mul
      f64.const -0.001388676377460993
      f64.add
      f64.mul
      f64.add
      f32.demote_f64
     else
      local.get $0
      f64.promote_f32
      f64.const -4.71238898038469
      f64.add
      local.tee $1
      local.get $1
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $2
      local.get $1
      f64.const -0.499999997251031
      f64.mul
      f64.const 1
      f64.add
      local.get $2
      f64.const 0.04166662332373906
      f64.mul
      f64.add
      local.get $2
      local.get $1
      f64.mul
      local.get $1
      f64.const 2.439044879627741e-05
      f64.mul
      f64.const -0.001388676377460993
      f64.add
      f64.mul
      f64.add
      f32.demote_f64
      f32.neg
     end
     return
    end
    local.get $0
    f64.promote_f32
    local.tee $1
    f64.const 6.283185307179586
    f64.add
    local.get $1
    f64.const -6.283185307179586
    f64.add
    local.get $7
    select
    local.tee $1
    local.get $1
    f64.mul
    local.tee $2
    local.get $1
    f64.mul
    local.set $5
    br $folding-inner0
   end
   local.get $3
   i32.const 2139095040
   i32.ge_u
   if
    local.get $0
    local.get $0
    f32.sub
    return
   end
   block $~lib/math/rempio2f|inlined.1 (result i32)
    local.get $3
    i32.const 1305022427
    i32.lt_u
    if
     local.get $0
     f64.promote_f32
     local.tee $1
     f64.const 0.6366197723675814
     f64.mul
     f64.nearest
     local.set $2
     local.get $1
     local.get $2
     f64.const 1.5707963109016418
     f64.mul
     f64.sub
     local.get $2
     f64.const 1.5893254773528196e-08
     f64.mul
     f64.sub
     global.set $~lib/math/rempio2f_y
     local.get $2
     i32.trunc_sat_f64_s
     br $~lib/math/rempio2f|inlined.1
    end
    local.get $3
    i32.const 23
    i32.shr_u
    i32.const 152
    i32.sub
    local.tee $8
    i32.const 63
    i32.and
    i64.extend_i32_s
    local.set $4
    local.get $8
    i32.const 6
    i32.shr_s
    i32.const 3
    i32.shl
    i32.const 1051280
    i32.add
    local.tee $8
    i64.load $0 offset=8
    local.set $6
    f64.const 8.515303950216386e-20
    local.get $0
    f64.promote_f32
    f64.copysign
    local.get $3
    i32.const 8388607
    i32.and
    i32.const 8388608
    i32.or
    i64.extend_i32_s
    local.tee $9
    local.get $8
    i64.load $0
    local.get $4
    i64.shl
    local.get $6
    i64.const 64
    local.get $4
    i64.sub
    i64.shr_u
    i64.or
    i64.mul
    local.get $4
    i64.const 32
    i64.gt_u
    if (result i64)
     local.get $6
     local.get $4
     i64.const 32
     i64.sub
     i64.shl
     local.get $8
     i64.load $0 offset=16
     i64.const 96
     local.get $4
     i64.sub
     i64.shr_u
     i64.or
    else
     local.get $6
     i64.const 32
     local.get $4
     i64.sub
     i64.shr_u
    end
    local.get $9
    i64.mul
    i64.const 32
    i64.shr_u
    i64.add
    local.tee $4
    i64.const 2
    i64.shl
    local.tee $6
    f64.convert_i64_s
    f64.mul
    global.set $~lib/math/rempio2f_y
    i32.const 0
    local.get $4
    i64.const 62
    i64.shr_u
    local.get $6
    i64.const 63
    i64.shr_u
    i64.add
    i32.wrap_i64
    local.tee $3
    i32.sub
    local.get $3
    local.get $7
    select
   end
   local.set $3
   global.get $~lib/math/rempio2f_y
   local.set $1
   local.get $3
   i32.const 1
   i32.and
   if (result f32)
    local.get $1
    local.get $1
    f64.mul
    local.tee $1
    local.get $1
    f64.mul
    local.set $2
    local.get $1
    f64.const -0.499999997251031
    f64.mul
    f64.const 1
    f64.add
    local.get $2
    f64.const 0.04166662332373906
    f64.mul
    f64.add
    local.get $2
    local.get $1
    f64.mul
    local.get $1
    f64.const 2.439044879627741e-05
    f64.mul
    f64.const -0.001388676377460993
    f64.add
    f64.mul
    f64.add
    f32.demote_f64
   else
    local.get $1
    local.get $1
    local.get $1
    f64.mul
    local.tee $2
    local.get $1
    f64.mul
    local.tee $1
    local.get $2
    f64.const 0.008333329385889463
    f64.mul
    f64.const -0.16666666641626524
    f64.add
    f64.mul
    f64.add
    local.get $1
    local.get $2
    local.get $2
    f64.mul
    f64.mul
    local.get $2
    f64.const 2.718311493989822e-06
    f64.mul
    f64.const -1.9839334836096632e-04
    f64.add
    f64.mul
    f64.add
    f32.demote_f64
   end
   local.tee $0
   f32.neg
   local.get $0
   local.get $3
   i32.const 2
   i32.and
   select
   return
  end
  local.get $1
  local.get $5
  local.get $2
  f64.const 0.008333329385889463
  f64.mul
  f64.const -0.16666666641626524
  f64.add
  f64.mul
  f64.add
  local.get $5
  local.get $2
  local.get $2
  f64.mul
  f64.mul
  local.get $2
  f64.const 2.718311493989822e-06
  f64.mul
  f64.const -1.9839334836096632e-04
  f64.add
  f64.mul
  f64.add
  f32.demote_f64
 )
 (func $assembly/core/fft/fft (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 f32)
  (local $6 f32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 i32)
  (local $15 f32)
  (local $16 i32)
  local.get $0
  i32.const 1
  i32.shr_s
  local.set $7
  local.get $0
  i32.const 1
  i32.sub
  local.set $10
  local.get $0
  local.set $4
  loop $while-continue|0
   local.get $4
   i32.const 1
   i32.shr_s
   local.tee $4
   if
    local.get $14
    i32.const 1
    i32.add
    local.set $14
    br $while-continue|0
   end
  end
  i32.const 1
  local.set $8
  i32.const 1
  local.set $4
  loop $for-loop|1
   local.get $4
   local.get $10
   i32.le_s
   if
    local.get $4
    local.get $8
    i32.lt_s
    if
     local.get $1
     local.get $8
     i32.const 1
     i32.sub
     local.tee $9
     call $~lib/staticarray/StaticArray<f32>#__get
     local.set $5
     local.get $1
     local.get $9
     local.get $1
     local.get $4
     i32.const 1
     i32.sub
     local.tee $3
     call $~lib/staticarray/StaticArray<f32>#__get
     call $~lib/staticarray/StaticArray<f32>#__set
     local.get $1
     local.get $3
     local.get $5
     call $~lib/staticarray/StaticArray<f32>#__set
     local.get $2
     local.get $9
     call $~lib/staticarray/StaticArray<f32>#__get
     local.set $5
     local.get $2
     local.get $9
     local.get $2
     local.get $3
     call $~lib/staticarray/StaticArray<f32>#__get
     call $~lib/staticarray/StaticArray<f32>#__set
     local.get $2
     local.get $3
     local.get $5
     call $~lib/staticarray/StaticArray<f32>#__set
    end
    local.get $7
    local.set $3
    loop $while-continue|2
     local.get $3
     local.get $8
     i32.lt_s
     if
      local.get $8
      local.get $3
      i32.sub
      local.set $8
      local.get $3
      i32.const 2
      i32.div_s
      local.set $3
      br $while-continue|2
     end
    end
    local.get $3
    local.get $8
    i32.add
    local.set $8
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|1
   end
  end
  i32.const 1
  local.set $3
  i32.const 1
  local.set $16
  loop $for-loop|3
   local.get $14
   local.get $16
   i32.ge_s
   if
    local.get $3
    local.tee $7
    i32.const 1
    i32.shl
    local.set $3
    f32.const 1
    local.set $6
    f32.const 0
    local.set $15
    f32.const 3.1415927410125732
    local.get $7
    f32.convert_i32_s
    f32.div
    local.tee $5
    call $~lib/math/NativeMathf.cos
    local.set $13
    local.get $5
    call $~lib/math/NativeMathf.sin
    f32.neg
    local.set $12
    i32.const 1
    local.set $8
    loop $for-loop|4
     local.get $7
     local.get $8
     i32.ge_s
     if
      local.get $8
      local.set $4
      loop $for-loop|5
       local.get $0
       local.get $4
       i32.ge_s
       if
        local.get $1
        local.get $4
        local.get $7
        i32.add
        i32.const 1
        i32.sub
        local.tee $9
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $6
        f32.mul
        local.get $2
        local.get $9
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $15
        f32.mul
        f32.sub
        local.set $5
        local.get $1
        local.get $9
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $15
        f32.mul
        local.get $2
        local.get $9
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $6
        f32.mul
        f32.add
        local.set $11
        local.get $1
        local.get $9
        local.get $1
        local.get $4
        i32.const 1
        i32.sub
        local.tee $10
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $5
        f32.sub
        call $~lib/staticarray/StaticArray<f32>#__set
        local.get $2
        local.get $9
        local.get $2
        local.get $10
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $11
        f32.sub
        call $~lib/staticarray/StaticArray<f32>#__set
        local.get $1
        local.get $10
        local.get $1
        local.get $10
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $5
        f32.add
        call $~lib/staticarray/StaticArray<f32>#__set
        local.get $2
        local.get $10
        local.get $2
        local.get $10
        call $~lib/staticarray/StaticArray<f32>#__get
        local.get $11
        f32.add
        call $~lib/staticarray/StaticArray<f32>#__set
        local.get $3
        local.get $4
        i32.add
        local.set $4
        br $for-loop|5
       end
      end
      local.get $6
      local.tee $5
      local.get $13
      f32.mul
      local.get $15
      local.get $12
      f32.mul
      f32.sub
      local.set $6
      local.get $5
      local.get $12
      f32.mul
      local.get $15
      local.get $13
      f32.mul
      f32.add
      local.set $15
      local.get $8
      i32.const 1
      i32.add
      local.set $8
      br $for-loop|4
     end
    end
    local.get $16
    i32.const 1
    i32.add
    local.set $16
    br $for-loop|3
   end
  end
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#makeWavetable (param $0 i32) (param $1 i32)
  (local $2 f32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load $0 offset=32
  local.get $0
  i32.load $0
  local.get $0
  i32.load $0 offset=4
  call $assembly/core/fft/fft
  loop $for-loop|0
   local.get $4
   local.get $0
   i32.load $0 offset=32
   i32.lt_u
   if
    local.get $3
    local.get $0
    i32.load $0 offset=4
    local.get $4
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.abs
    local.tee $2
    f32.lt
    if
     local.get $2
     local.set $3
    end
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  f32.const 1
  local.get $3
  f32.div
  f32.const 0.9990000128746033
  f32.mul
  local.set $2
  loop $for-loop|1
   local.get $5
   local.get $0
   i32.load $0 offset=32
   i32.lt_u
   if
    local.get $1
    local.get $5
    local.get $0
    i32.load $0 offset=4
    local.get $5
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $2
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|1
   end
  end
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:freqs (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=8
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f64)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  f64.load $0 offset=16
  local.set $3
  local.get $0
  i32.load $0 offset=24
  local.set $4
  loop $for-loop|0
   local.get $4
   if
    local.get $0
    local.get $4
    local.get $2
    call $assembly/core/antialias-wavetable/AntialiasWavetable#defineWaveform
    local.get $0
    local.get $1
    local.get $5
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
    call $assembly/core/antialias-wavetable/AntialiasWavetable#makeWavetable
    local.get $0
    i32.load $0 offset=8
    local.get $5
    local.get $3
    f32.demote_f64
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    local.get $3
    f64.add
    local.set $3
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    local.get $4
    i32.const 1
    i32.shr_u
    local.set $4
    br $for-loop|0
   end
  end
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:ramp (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=56
 )
 (func $assembly/core/antialias-wavetable/Real.ramp (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  local.get $0
  local.get $1
  f32.const -1
  local.get $1
  f32.convert_i32_u
  f32.div
  local.tee $3
  f32.neg
  call $~lib/staticarray/StaticArray<f32>#__set
  local.get $0
  local.get $2
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#__set
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:sqr (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=60
 )
 (func $assembly/core/antialias-wavetable/Real.sqr (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  local.get $0
  local.get $1
  f32.const 1
  local.get $1
  f32.convert_i32_u
  f32.div
  f32.const 0
  local.get $1
  i32.const 1
  i32.and
  select
  local.tee $3
  f32.neg
  call $~lib/staticarray/StaticArray<f32>#__set
  local.get $0
  local.get $2
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#__set
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:tri (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=64
 )
 (func $assembly/core/antialias-wavetable/Real.tri (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  local.get $0
  local.get $1
  local.get $1
  i32.const 1
  i32.and
  if (result f32)
   global.get $assembly/core/antialias-wavetable/Real.sign
   f32.neg
   global.set $assembly/core/antialias-wavetable/Real.sign
   f32.const 1
   local.get $1
   local.get $1
   i32.mul
   f32.convert_i32_u
   f32.div
   global.get $assembly/core/antialias-wavetable/Real.sign
   f32.mul
  else
   f32.const 0
  end
  local.tee $3
  call $~lib/staticarray/StaticArray<f32>#__set
  local.get $0
  local.get $2
  local.get $3
  f32.neg
  call $~lib/staticarray/StaticArray<f32>#__set
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#set:tableIndex (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=40
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $0
  i32.eqz
  if
   i32.const 68
   i32.const 12
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  f64.const 0
  f64.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  i32.store $0 offset=28
  local.get $0
  i32.const 0
  i32.store $0 offset=32
  local.get $0
  i32.const 0
  i32.store $0 offset=36
  local.get $0
  i32.const 0
  i32.store $0 offset=40
  local.get $0
  i32.const 0
  i32.store $0 offset=44
  local.get $0
  i32.const 0
  i32.store $0 offset=48
  local.get $0
  i32.const 0
  i32.store $0 offset=52
  local.get $0
  i32.const 0
  i32.store $0 offset=56
  local.get $0
  i32.const 0
  i32.store $0 offset=60
  local.get $0
  i32.const 0
  i32.store $0 offset=64
  local.get $1
  f64.convert_i32_u
  f64.const 30
  f64.div
  f64.const 0.5
  f64.add
  i32.trunc_sat_f64_u
  local.tee $3
  i32.const 1
  i32.sub
  local.tee $4
  local.get $4
  i32.const 1
  i32.shr_u
  i32.or
  local.tee $4
  local.get $4
  i32.const 2
  i32.shr_u
  i32.or
  local.tee $4
  local.get $4
  i32.const 4
  i32.shr_u
  i32.or
  local.tee $4
  local.get $4
  i32.const 8
  i32.shr_u
  i32.or
  local.tee $4
  local.get $4
  i32.const 16
  i32.shr_u
  i32.or
  i32.const 1
  i32.add
  i32.const 1
  i32.shl
  local.tee $9
  i32.const 1
  i32.sub
  i32.const 2
  i32.shl
  local.set $8
  local.get $3
  f64.convert_i32_u
  call $~lib/math/NativeMath.log2
  f64.const 1
  f64.add
  i32.trunc_sat_f64_u
  local.tee $11
  call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#constructor
  local.set $4
  local.get $11
  call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#constructor
  local.set $5
  local.get $11
  call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#constructor
  local.set $6
  local.get $11
  call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#constructor
  local.set $7
  loop $for-loop|0
   local.get $2
   local.get $11
   i32.lt_u
   if
    local.get $4
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $5
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $6
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $7
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $11
  call $~lib/staticarray/StaticArray<f32>#constructor
  local.set $10
  local.get $9
  call $~lib/staticarray/StaticArray<f32>#constructor
  local.set $12
  local.get $9
  call $~lib/staticarray/StaticArray<f32>#constructor
  local.set $2
  local.get $0
  local.get $12
  i32.store $0
  local.get $0
  local.get $2
  i32.store $0 offset=4
  local.get $0
  local.get $10
  i32.store $0 offset=8
  local.get $0
  local.get $4
  i32.store $0 offset=52
  local.get $0
  local.get $5
  i32.store $0 offset=56
  local.get $0
  local.get $6
  i32.store $0 offset=60
  local.get $0
  local.get $7
  i32.store $0 offset=64
  local.get $0
  local.get $1
  i32.store $0 offset=48
  local.get $0
  f64.const 10
  f64.store $0 offset=16
  local.get $0
  local.get $3
  i32.store $0 offset=24
  local.get $0
  local.get $11
  i32.store $0 offset=28
  local.get $0
  local.get $9
  i32.store $0 offset=32
  local.get $0
  local.get $8
  i32.store $0 offset=36
  local.get $0
  f64.const 8192
  call $~lib/math/NativeMath.log2
  i32.trunc_sat_f64_s
  local.get $0
  i32.load $0 offset=32
  f64.convert_i32_u
  call $~lib/math/NativeMath.log2
  i32.trunc_sat_f64_s
  i32.sub
  i32.store $0 offset=44
  local.get $0
  local.get $0
  i32.load $0 offset=52
  i32.const 1051136
  call $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables
  local.get $0
  local.get $0
  i32.load $0 offset=56
  i32.const 1051344
  call $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables
  local.get $0
  local.get $0
  i32.load $0 offset=60
  i32.const 1051376
  call $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables
  local.get $0
  local.get $0
  i32.load $0 offset=64
  i32.const 1051408
  call $assembly/core/antialias-wavetable/AntialiasWavetable#makeTables
  local.get $0
 )
 (func $assembly/core/wavetable/Wavetable#get:size (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=36
 )
 (func $assembly/core/wavetable/Wavetable#get:sine (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=12
 )
 (func $~lib/math/pio2_large_quot (param $0 i64) (result i32)
  (local $1 i64)
  (local $2 i64)
  (local $3 i64)
  (local $4 i32)
  (local $5 f64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  (local $11 i64)
  (local $12 i64)
  local.get $0
  i64.const 9223372036854775807
  i64.and
  i64.const 52
  i64.shr_u
  i64.const 1045
  i64.sub
  local.tee $1
  i64.const 63
  i64.and
  local.set $6
  local.get $1
  i64.const 6
  i64.shr_s
  i32.wrap_i64
  i32.const 3
  i32.shl
  i32.const 1051424
  i32.add
  local.tee $4
  i64.load $0
  local.set $3
  local.get $4
  i64.load $0 offset=8
  local.set $2
  local.get $4
  i64.load $0 offset=16
  local.set $1
  local.get $6
  i64.const 0
  i64.ne
  if
   local.get $3
   local.get $6
   i64.shl
   local.get $2
   i64.const 64
   local.get $6
   i64.sub
   local.tee $7
   i64.shr_u
   i64.or
   local.set $3
   local.get $2
   local.get $6
   i64.shl
   local.get $1
   local.get $7
   i64.shr_u
   i64.or
   local.set $2
   local.get $1
   local.get $6
   i64.shl
   local.get $4
   i64.load $0 offset=24
   local.get $7
   i64.shr_u
   i64.or
   local.set $1
  end
  local.get $0
  i64.const 4503599627370495
  i64.and
  i64.const 4503599627370496
  i64.or
  local.tee $6
  i64.const 4294967295
  i64.and
  local.set $7
  local.get $6
  i64.const 32
  i64.shr_u
  local.tee $8
  local.get $2
  i64.const 4294967295
  i64.and
  local.tee $9
  i64.mul
  local.get $2
  i64.const 32
  i64.shr_u
  local.tee $2
  local.get $7
  i64.mul
  local.get $7
  local.get $9
  i64.mul
  local.tee $7
  i64.const 32
  i64.shr_u
  i64.add
  local.tee $9
  i64.const 4294967295
  i64.and
  i64.add
  local.set $10
  local.get $2
  local.get $8
  i64.mul
  local.get $9
  i64.const 32
  i64.shr_u
  i64.add
  local.get $10
  i64.const 32
  i64.shr_u
  i64.add
  global.set $~lib/math/res128_hi
  local.get $8
  local.get $1
  i64.const 32
  i64.shr_u
  i64.mul
  local.tee $1
  local.get $7
  i64.const 4294967295
  i64.and
  local.get $10
  i64.const 32
  i64.shl
  i64.add
  i64.add
  local.tee $2
  local.get $1
  i64.lt_u
  i64.extend_i32_u
  global.get $~lib/math/res128_hi
  local.get $3
  local.get $6
  i64.mul
  i64.add
  i64.add
  local.tee $3
  i64.const 2
  i64.shl
  local.get $2
  i64.const 62
  i64.shr_u
  i64.or
  local.tee $6
  i64.const 63
  i64.shr_s
  local.tee $7
  local.get $2
  i64.const 2
  i64.shl
  i64.xor
  local.set $8
  local.get $6
  local.get $7
  i64.const 1
  i64.shr_s
  i64.xor
  local.tee $1
  i64.clz
  local.set $9
  local.get $1
  local.get $9
  i64.shl
  local.get $8
  i64.const 64
  local.get $9
  i64.sub
  i64.shr_u
  i64.or
  local.tee $10
  i64.const 4294967295
  i64.and
  local.set $2
  local.get $10
  i64.const 32
  i64.shr_u
  local.tee $1
  i64.const 560513588
  i64.mul
  local.get $2
  i64.const 3373259426
  i64.mul
  local.get $2
  i64.const 560513588
  i64.mul
  local.tee $11
  i64.const 32
  i64.shr_u
  i64.add
  local.tee $2
  i64.const 4294967295
  i64.and
  i64.add
  local.set $12
  local.get $1
  i64.const 3373259426
  i64.mul
  local.get $2
  i64.const 32
  i64.shr_u
  i64.add
  local.get $12
  i64.const 32
  i64.shr_u
  i64.add
  global.set $~lib/math/res128_hi
  local.get $10
  f64.convert_i64_u
  f64.const 3.753184150245214e-04
  f64.mul
  local.get $8
  local.get $9
  i64.shl
  f64.convert_i64_u
  f64.const 3.834951969714103e-04
  f64.mul
  f64.add
  i64.trunc_sat_f64_u
  local.tee $1
  local.get $11
  i64.const 4294967295
  i64.and
  local.get $12
  i64.const 32
  i64.shl
  i64.add
  local.tee $2
  i64.gt_u
  i64.extend_i32_u
  global.get $~lib/math/res128_hi
  local.tee $8
  i64.const 11
  i64.shr_u
  i64.add
  f64.convert_i64_u
  global.set $~lib/math/rempio2_y0
  local.get $8
  i64.const 53
  i64.shl
  local.get $2
  i64.const 11
  i64.shr_u
  i64.or
  local.get $1
  i64.add
  f64.convert_i64_u
  f64.const 5.421010862427522e-20
  f64.mul
  global.set $~lib/math/rempio2_y1
  global.get $~lib/math/rempio2_y0
  i64.const 4372995238176751616
  local.get $9
  i64.const 52
  i64.shl
  i64.sub
  local.get $0
  local.get $6
  i64.xor
  i64.const -9223372036854775808
  i64.and
  i64.or
  f64.reinterpret_i64
  local.tee $5
  f64.mul
  global.set $~lib/math/rempio2_y0
  global.get $~lib/math/rempio2_y1
  local.get $5
  f64.mul
  global.set $~lib/math/rempio2_y1
  local.get $3
  i64.const 62
  i64.shr_s
  local.get $7
  i64.sub
  i32.wrap_i64
 )
 (func $~lib/math/NativeMath.sin (param $0 f64) (result f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  local.get $0
  i64.reinterpret_f64
  local.tee $4
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.tee $3
  i32.const 31
  i32.shr_u
  local.set $5
  local.get $3
  i32.const 2147483647
  i32.and
  local.tee $3
  i32.const 1072243195
  i32.le_u
  if
   local.get $3
   i32.const 1045430272
   i32.lt_u
   if
    local.get $0
    return
   end
   local.get $0
   local.get $0
   local.get $0
   f64.mul
   local.tee $1
   local.get $0
   f64.mul
   local.get $1
   local.get $1
   local.get $1
   f64.const 2.7557313707070068e-06
   f64.mul
   f64.const -1.984126982985795e-04
   f64.add
   f64.mul
   f64.const 0.00833333333332249
   f64.add
   local.get $1
   local.get $1
   local.get $1
   f64.mul
   f64.mul
   local.get $1
   f64.const 1.58969099521155e-10
   f64.mul
   f64.const -2.5050760253406863e-08
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.const -0.16666666666666632
   f64.add
   f64.mul
   f64.add
   return
  end
  local.get $3
  i32.const 2146435072
  i32.ge_u
  if
   local.get $0
   local.get $0
   f64.sub
   return
  end
  block $~lib/math/rempio2|inlined.0
   local.get $4
   i64.const 32
   i64.shr_u
   i32.wrap_i64
   i32.const 2147483647
   i32.and
   local.tee $6
   i32.const 1073928572
   i32.lt_u
   if
    i32.const 1
    local.set $3
    local.get $5
    if (result f64)
     local.get $0
     f64.const 1.5707963267341256
     f64.add
     local.set $0
     i32.const -1
     local.set $3
     local.get $6
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const 6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const 6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const 6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const 2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const 2.0222662487959506e-21
      f64.add
     end
    else
     local.get $0
     f64.const -1.5707963267341256
     f64.add
     local.set $0
     local.get $6
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const -6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const -6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const -6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const -2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const -2.0222662487959506e-21
      f64.add
     end
    end
    local.set $1
    local.get $0
    global.set $~lib/math/rempio2_y0
    local.get $1
    global.set $~lib/math/rempio2_y1
    br $~lib/math/rempio2|inlined.0
   end
   local.get $6
   i32.const 1094263291
   i32.lt_u
   if
    local.get $6
    i32.const 20
    i32.shr_u
    local.tee $3
    local.get $0
    local.get $0
    f64.const 0.6366197723675814
    f64.mul
    f64.nearest
    local.tee $7
    f64.const 1.5707963267341256
    f64.mul
    f64.sub
    local.tee $0
    local.get $7
    f64.const 6.077100506506192e-11
    f64.mul
    local.tee $2
    f64.sub
    local.tee $1
    i64.reinterpret_f64
    i64.const 32
    i64.shr_u
    i32.wrap_i64
    i32.const 20
    i32.shr_u
    i32.const 2047
    i32.and
    i32.sub
    i32.const 16
    i32.gt_u
    if
     local.get $7
     f64.const 2.0222662487959506e-21
     f64.mul
     local.get $0
     local.get $0
     local.get $7
     f64.const 6.077100506303966e-11
     f64.mul
     local.tee $1
     f64.sub
     local.tee $0
     f64.sub
     local.get $1
     f64.sub
     f64.sub
     local.set $2
     local.get $3
     local.get $0
     local.get $2
     f64.sub
     local.tee $1
     i64.reinterpret_f64
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     i32.const 20
     i32.shr_u
     i32.const 2047
     i32.and
     i32.sub
     i32.const 49
     i32.gt_u
     if
      local.get $7
      f64.const 8.4784276603689e-32
      f64.mul
      local.get $0
      local.get $0
      local.get $7
      f64.const 2.0222662487111665e-21
      f64.mul
      local.tee $1
      f64.sub
      local.tee $0
      f64.sub
      local.get $1
      f64.sub
      f64.sub
      local.set $2
      local.get $0
      local.get $2
      f64.sub
      local.set $1
     end
    end
    local.get $1
    global.set $~lib/math/rempio2_y0
    local.get $0
    local.get $1
    f64.sub
    local.get $2
    f64.sub
    global.set $~lib/math/rempio2_y1
    local.get $7
    i32.trunc_sat_f64_s
    local.set $3
    br $~lib/math/rempio2|inlined.0
   end
   i32.const 0
   local.get $4
   call $~lib/math/pio2_large_quot
   local.tee $3
   i32.sub
   local.get $3
   local.get $5
   select
   local.set $3
  end
  global.get $~lib/math/rempio2_y0
  local.set $2
  global.get $~lib/math/rempio2_y1
  local.set $7
  local.get $3
  i32.const 1
  i32.and
  if (result f64)
   local.get $2
   local.get $2
   f64.mul
   local.tee $0
   local.get $0
   f64.mul
   local.set $1
   f64.const 1
   local.get $0
   f64.const 0.5
   f64.mul
   local.tee $8
   f64.sub
   local.tee $9
   f64.const 1
   local.get $9
   f64.sub
   local.get $8
   f64.sub
   local.get $0
   local.get $0
   local.get $0
   local.get $0
   f64.const 2.480158728947673e-05
   f64.mul
   f64.const -0.001388888888887411
   f64.add
   f64.mul
   f64.const 0.0416666666666666
   f64.add
   f64.mul
   local.get $1
   local.get $1
   f64.mul
   local.get $0
   local.get $0
   f64.const -1.1359647557788195e-11
   f64.mul
   f64.const 2.087572321298175e-09
   f64.add
   f64.mul
   f64.const -2.7557314351390663e-07
   f64.add
   f64.mul
   f64.add
   f64.mul
   local.get $2
   local.get $7
   f64.mul
   f64.sub
   f64.add
   f64.add
  else
   local.get $2
   local.get $2
   f64.mul
   local.tee $0
   local.get $2
   f64.mul
   local.set $1
   local.get $2
   local.get $0
   local.get $7
   f64.const 0.5
   f64.mul
   local.get $1
   local.get $0
   local.get $0
   f64.const 2.7557313707070068e-06
   f64.mul
   f64.const -1.984126982985795e-04
   f64.add
   f64.mul
   f64.const 0.00833333333332249
   f64.add
   local.get $0
   local.get $0
   local.get $0
   f64.mul
   f64.mul
   local.get $0
   f64.const 1.58969099521155e-10
   f64.mul
   f64.const -2.5050760253406863e-08
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.sub
   f64.mul
   local.get $7
   f64.sub
   local.get $1
   f64.const -0.16666666666666632
   f64.mul
   f64.sub
   f64.sub
  end
  local.tee $0
  f64.neg
  local.get $0
  local.get $3
  i32.const 2
  i32.and
  select
 )
 (func $assembly/util/phaseToRadians (param $0 i32) (result f64)
  local.get $0
  f64.convert_i32_u
  f64.const 1.462918120317176e-09
  f64.mul
 )
 (func $assembly/core/wavetable/Wavetable#fill (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  loop $for-loop|0
   local.get $4
   local.get $0
   i32.load $0
   i32.lt_u
   if
    local.get $4
    local.get $0
    i32.load $0 offset=8
    local.tee $5
    i32.const 20
    i32.sub
    i32.load $0 offset=16
    i32.const 2
    i32.shr_u
    i32.ge_u
    if
     i32.const 1051072
     i32.const 1048816
     i32.const 78
     i32.const 41
     call $~lib/builtins/abort
     unreachable
    end
    local.get $1
    local.get $4
    local.get $5
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    i32.load $0
    local.get $3
    i32.load $0
    call_indirect $0 (type $i32_=>_f64)
    local.get $2
    i32.load $0
    call_indirect $0 (type $f64_=>_f64)
    f32.demote_f64
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
 )
 (func $~lib/math/NativeMath.cos (param $0 f64) (result f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  (local $9 f64)
  local.get $0
  i64.reinterpret_f64
  local.tee $4
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.tee $3
  i32.const 31
  i32.shr_u
  local.set $5
  local.get $3
  i32.const 2147483647
  i32.and
  local.tee $3
  i32.const 1072243195
  i32.le_u
  if
   local.get $3
   i32.const 1044816030
   i32.lt_u
   if
    f64.const 1
    return
   end
   local.get $0
   local.get $0
   f64.mul
   local.tee $1
   local.get $1
   f64.mul
   local.set $2
   f64.const 1
   local.get $1
   f64.const 0.5
   f64.mul
   local.tee $7
   f64.sub
   local.tee $8
   f64.const 1
   local.get $8
   f64.sub
   local.get $7
   f64.sub
   local.get $1
   local.get $1
   local.get $1
   local.get $1
   f64.const 2.480158728947673e-05
   f64.mul
   f64.const -0.001388888888887411
   f64.add
   f64.mul
   f64.const 0.0416666666666666
   f64.add
   f64.mul
   local.get $2
   local.get $2
   f64.mul
   local.get $1
   local.get $1
   f64.const -1.1359647557788195e-11
   f64.mul
   f64.const 2.087572321298175e-09
   f64.add
   f64.mul
   f64.const -2.7557314351390663e-07
   f64.add
   f64.mul
   f64.add
   f64.mul
   local.get $0
   f64.const 0
   f64.mul
   f64.sub
   f64.add
   f64.add
   return
  end
  local.get $3
  i32.const 2146435072
  i32.ge_u
  if
   local.get $0
   local.get $0
   f64.sub
   return
  end
  block $~lib/math/rempio2|inlined.1
   local.get $4
   i64.const 32
   i64.shr_u
   i32.wrap_i64
   i32.const 2147483647
   i32.and
   local.tee $6
   i32.const 1073928572
   i32.lt_u
   if
    i32.const 1
    local.set $3
    local.get $5
    if (result f64)
     local.get $0
     f64.const 1.5707963267341256
     f64.add
     local.set $0
     i32.const -1
     local.set $3
     local.get $6
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const 6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const 6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const 6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const 2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const 2.0222662487959506e-21
      f64.add
     end
    else
     local.get $0
     f64.const -1.5707963267341256
     f64.add
     local.set $0
     local.get $6
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const -6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const -6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const -6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const -2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const -2.0222662487959506e-21
      f64.add
     end
    end
    local.set $1
    local.get $0
    global.set $~lib/math/rempio2_y0
    local.get $1
    global.set $~lib/math/rempio2_y1
    br $~lib/math/rempio2|inlined.1
   end
   local.get $6
   i32.const 1094263291
   i32.lt_u
   if
    local.get $6
    i32.const 20
    i32.shr_u
    local.tee $3
    local.get $0
    local.get $0
    f64.const 0.6366197723675814
    f64.mul
    f64.nearest
    local.tee $7
    f64.const 1.5707963267341256
    f64.mul
    f64.sub
    local.tee $0
    local.get $7
    f64.const 6.077100506506192e-11
    f64.mul
    local.tee $2
    f64.sub
    local.tee $1
    i64.reinterpret_f64
    i64.const 32
    i64.shr_u
    i32.wrap_i64
    i32.const 20
    i32.shr_u
    i32.const 2047
    i32.and
    i32.sub
    i32.const 16
    i32.gt_u
    if
     local.get $7
     f64.const 2.0222662487959506e-21
     f64.mul
     local.get $0
     local.get $0
     local.get $7
     f64.const 6.077100506303966e-11
     f64.mul
     local.tee $1
     f64.sub
     local.tee $0
     f64.sub
     local.get $1
     f64.sub
     f64.sub
     local.set $2
     local.get $3
     local.get $0
     local.get $2
     f64.sub
     local.tee $1
     i64.reinterpret_f64
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     i32.const 20
     i32.shr_u
     i32.const 2047
     i32.and
     i32.sub
     i32.const 49
     i32.gt_u
     if
      local.get $7
      f64.const 8.4784276603689e-32
      f64.mul
      local.get $0
      local.get $0
      local.get $7
      f64.const 2.0222662487111665e-21
      f64.mul
      local.tee $1
      f64.sub
      local.tee $0
      f64.sub
      local.get $1
      f64.sub
      f64.sub
      local.set $2
      local.get $0
      local.get $2
      f64.sub
      local.set $1
     end
    end
    local.get $1
    global.set $~lib/math/rempio2_y0
    local.get $0
    local.get $1
    f64.sub
    local.get $2
    f64.sub
    global.set $~lib/math/rempio2_y1
    local.get $7
    i32.trunc_sat_f64_s
    local.set $3
    br $~lib/math/rempio2|inlined.1
   end
   i32.const 0
   local.get $4
   call $~lib/math/pio2_large_quot
   local.tee $3
   i32.sub
   local.get $3
   local.get $5
   select
   local.set $3
  end
  global.get $~lib/math/rempio2_y0
  local.set $1
  global.get $~lib/math/rempio2_y1
  local.set $2
  local.get $3
  i32.const 1
  i32.and
  if (result f64)
   local.get $1
   local.get $1
   f64.mul
   local.tee $0
   local.get $1
   f64.mul
   local.set $7
   local.get $1
   local.get $0
   local.get $2
   f64.const 0.5
   f64.mul
   local.get $7
   local.get $0
   local.get $0
   f64.const 2.7557313707070068e-06
   f64.mul
   f64.const -1.984126982985795e-04
   f64.add
   f64.mul
   f64.const 0.00833333333332249
   f64.add
   local.get $0
   local.get $0
   local.get $0
   f64.mul
   f64.mul
   local.get $0
   f64.const 1.58969099521155e-10
   f64.mul
   f64.const -2.5050760253406863e-08
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.sub
   f64.mul
   local.get $2
   f64.sub
   local.get $7
   f64.const -0.16666666666666632
   f64.mul
   f64.sub
   f64.sub
  else
   local.get $1
   local.get $1
   f64.mul
   local.tee $7
   local.get $7
   f64.mul
   local.set $8
   f64.const 1
   local.get $7
   f64.const 0.5
   f64.mul
   local.tee $0
   f64.sub
   local.tee $9
   f64.const 1
   local.get $9
   f64.sub
   local.get $0
   f64.sub
   local.get $7
   local.get $7
   local.get $7
   local.get $7
   f64.const 2.480158728947673e-05
   f64.mul
   f64.const -0.001388888888887411
   f64.add
   f64.mul
   f64.const 0.0416666666666666
   f64.add
   f64.mul
   local.get $8
   local.get $8
   f64.mul
   local.get $7
   local.get $7
   f64.const -1.1359647557788195e-11
   f64.mul
   f64.const 2.087572321298175e-09
   f64.add
   f64.mul
   f64.const -2.7557314351390663e-07
   f64.add
   f64.mul
   f64.add
   f64.mul
   local.get $1
   local.get $2
   f64.mul
   f64.sub
   f64.add
   f64.add
  end
  local.tee $0
  f64.neg
  local.get $0
  local.get $3
  i32.const 1
  i32.add
  i32.const 2
  i32.and
  select
 )
 (func $assembly/core/wavetable/Wavetable#get:exp (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=20
 )
 (func $~lib/math/NativeMath.exp (param $0 f64) (result f64)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 f64)
  (local $5 f64)
  (local $6 i64)
  (local $7 f64)
  (local $8 f64)
  block $~lib/util/math/exp_lut|inlined.0 (result f64)
   local.get $0
   i64.reinterpret_f64
   local.tee $2
   i64.const 52
   i64.shr_u
   i32.wrap_i64
   i32.const 2047
   i32.and
   local.tee $1
   i32.const 969
   i32.sub
   i32.const 63
   i32.ge_u
   if
    f64.const 1
    local.get $1
    i32.const 969
    i32.sub
    i32.const -2147483648
    i32.ge_u
    br_if $~lib/util/math/exp_lut|inlined.0
    drop
    local.get $1
    i32.const 1033
    i32.ge_u
    if
     f64.const 0
     local.get $2
     i64.const -4503599627370496
     i64.eq
     br_if $~lib/util/math/exp_lut|inlined.0
     drop
     local.get $0
     f64.const 1
     f64.add
     local.get $1
     i32.const 2047
     i32.ge_u
     br_if $~lib/util/math/exp_lut|inlined.0
     drop
     f64.const 0
     f64.const inf
     local.get $2
     i64.const 0
     i64.lt_s
     select
     br $~lib/util/math/exp_lut|inlined.0
    end
    i32.const 0
    local.set $1
   end
   local.get $0
   f64.const 184.6649652337873
   f64.mul
   f64.const 6755399441055744
   f64.add
   local.tee $4
   i64.reinterpret_f64
   local.tee $2
   i64.const 127
   i64.and
   i64.const 1
   i64.shl
   i32.wrap_i64
   i32.const 3
   i32.shl
   i32.const 1051728
   i32.add
   local.tee $3
   i64.load $0 offset=8
   local.get $2
   i64.const 45
   i64.shl
   i64.add
   local.set $6
   local.get $0
   local.get $4
   f64.const -6755399441055744
   f64.add
   local.tee $0
   f64.const -0.005415212348111709
   f64.mul
   f64.add
   local.get $0
   f64.const -1.2864023111638346e-14
   f64.mul
   f64.add
   local.tee $0
   local.get $0
   f64.mul
   local.set $4
   local.get $3
   f64.load $0
   local.get $0
   f64.add
   local.get $4
   local.get $0
   f64.const 0.16666666666665886
   f64.mul
   f64.const 0.49999999999996786
   f64.add
   f64.mul
   f64.add
   local.get $4
   local.get $4
   f64.mul
   local.get $0
   f64.const 0.008333335853059549
   f64.mul
   f64.const 0.0416666808410674
   f64.add
   f64.mul
   f64.add
   local.set $5
   local.get $1
   i32.eqz
   if
    block $~lib/util/math/specialcase|inlined.0 (result f64)
     local.get $2
     i64.const 2147483648
     i64.and
     i64.eqz
     if
      local.get $6
      i64.const 4544132024016830464
      i64.sub
      f64.reinterpret_i64
      local.tee $0
      local.get $0
      local.get $5
      f64.mul
      f64.add
      f64.const 5486124068793688683255936e279
      f64.mul
      br $~lib/util/math/specialcase|inlined.0
     end
     local.get $6
     i64.const 4602678819172646912
     i64.add
     local.tee $2
     f64.reinterpret_i64
     local.tee $7
     local.get $7
     local.get $5
     f64.mul
     f64.add
     local.tee $8
     f64.abs
     f64.const 1
     f64.lt
     if (result f64)
      local.get $2
      i64.const -9223372036854775808
      i64.and
      f64.reinterpret_i64
      f64.const 1
      local.get $8
      f64.copysign
      local.tee $0
      local.get $8
      f64.add
      local.tee $4
      local.get $0
      local.get $4
      f64.sub
      local.get $8
      f64.add
      local.get $7
      local.get $8
      f64.sub
      local.get $7
      local.get $5
      f64.mul
      f64.add
      f64.add
      f64.add
      local.get $0
      f64.sub
      local.tee $0
      local.get $0
      f64.const 0
      f64.eq
      select
     else
      local.get $8
     end
     f64.const 2.2250738585072014e-308
     f64.mul
    end
    br $~lib/util/math/exp_lut|inlined.0
   end
   local.get $6
   f64.reinterpret_i64
   local.tee $0
   local.get $0
   local.get $5
   f64.mul
   f64.add
  end
 )
 (func $assembly/core/wavetable/exp (param $0 f64) (result f64)
  local.get $0
  f64.neg
  call $~lib/math/NativeMath.exp
 )
 (func $assembly/core/wave/rnd (param $0 f64) (result f64)
  (local $1 i32)
  global.get $assembly/core/wave/seed
  i32.const 1831565813
  i32.add
  global.set $assembly/core/wave/seed
  global.get $assembly/core/wave/seed
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.mul
  local.tee $1
  local.get $1
  i32.const 61
  i32.or
  local.get $1
  local.get $1
  i32.const 7
  i32.shr_u
  i32.xor
  i32.mul
  i32.add
  local.get $1
  i32.xor
  local.tee $1
  local.get $1
  i32.const 14
  i32.shr_u
  i32.xor
  f64.convert_i32_u
  f64.const 2.3283064365386963e-10
  f64.mul
  local.get $0
  f64.mul
 )
 (func $assembly/core/wave/Wave.noise (param $0 f64) (result f64)
  (local $1 i32)
  global.get $assembly/core/wave/seed
  i32.const 1831565813
  i32.add
  global.set $assembly/core/wave/seed
  global.get $assembly/core/wave/seed
  local.tee $1
  i32.const 1
  i32.or
  local.get $1
  local.get $1
  i32.const 15
  i32.shr_u
  i32.xor
  i32.mul
  local.tee $1
  local.get $1
  i32.const 61
  i32.or
  local.get $1
  local.get $1
  i32.const 7
  i32.shr_u
  i32.xor
  i32.mul
  i32.add
  local.get $1
  i32.xor
  local.tee $1
  local.get $1
  i32.const 14
  i32.shr_u
  i32.xor
  f64.convert_i32_u
  f64.const 2.3283064365386963e-10
  f64.mul
  f64.const 2
  f64.mul
  f64.const -1
  f64.add
 )
 (func $assembly/core/wavetable/Wavetable#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.eqz
  if
   i32.const 40
   i32.const 10
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=32
  local.get $0
  local.get $2
  i32.store $0 offset=36
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  i32.store $0 offset=28
  local.get $0
  local.get $2
  i32.const 1
  i32.add
  local.tee $3
  i32.store $0
  local.get $0
  local.get $2
  i32.const 1
  i32.sub
  i32.const 2
  i32.shl
  i32.store $0 offset=4
  local.get $3
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1048768
   i32.const 1048816
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 11
  call $~lib/rt/stub/__new
  local.tee $4
  i32.const 0
  local.get $2
  memory.fill $0
  local.get $0
  local.get $4
  i32.store $0 offset=8
  local.get $0
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=12
  local.get $0
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=16
  local.get $0
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=20
  local.get $0
  local.get $3
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  local.get $1
  call $assembly/core/antialias-wavetable/AntialiasWavetable#constructor
  i32.store $0 offset=28
  i32.const -1
  local.get $0
  i32.load $0 offset=36
  i32.div_u
  local.set $3
  i32.const 0
  local.set $1
  i32.const 0
  local.set $2
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load $0
   i32.lt_u
   if
    local.get $0
    i32.load $0 offset=8
    local.get $1
    local.get $2
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $2
    local.get $3
    i32.add
    local.set $2
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $0
  i32.load $0 offset=12
  i32.const 1051648
  i32.const 1051680
  call $assembly/core/wavetable/Wavetable#fill
  local.get $0
  local.get $0
  i32.load $0 offset=16
  i32.const 1051712
  i32.const 1051680
  call $assembly/core/wavetable/Wavetable#fill
  local.get $0
  local.get $0
  i32.load $0 offset=20
  i32.const 1053808
  i32.const 1051680
  call $assembly/core/wavetable/Wavetable#fill
  local.get $0
  local.get $0
  i32.load $0 offset=24
  i32.const 1053840
  i32.const 1051680
  call $assembly/core/wavetable/Wavetable#fill
  local.get $0
 )
 (func $assembly/core/engine/Core#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 18
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  local.get $1
  i32.const 8192
  call $assembly/core/wavetable/Wavetable#constructor
  i32.store $0
  local.get $0
 )
 (func $assembly/core/clock/Clock#set:time (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0
 )
 (func $assembly/core/clock/Clock#set:timeStep (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=8
 )
 (func $assembly/core/clock/Clock#set:endTime (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=24
 )
 (func $assembly/core/clock/Clock#set:internalTime (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=32
 )
 (func $assembly/core/clock/Clock#set:bpm (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=40
 )
 (func $assembly/core/clock/Clock#set:coeff (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=48
 )
 (func $assembly/core/clock/Clock#set:barTime (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=56
 )
 (func $assembly/core/clock/Clock#set:barTimeStep (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=64
 )
 (func $assembly/core/clock/Clock#set:loopStart (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=72
 )
 (func $assembly/core/clock/Clock#set:loopEnd (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=80
 )
 (func $assembly/core/clock/Clock#set:sampleRate (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=88
 )
 (func $assembly/core/clock/Clock#set:jumpBar (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=92
 )
 (func $assembly/core/clock/Clock#set:ringPos (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=96
 )
 (func $assembly/core/clock/Clock#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 100
   call $~lib/rt/stub/__alloc
   local.set $0
  end
  local.get $0
  f64.const 0
  f64.store $0
  local.get $0
  f64.const 0
  f64.store $0 offset=8
  local.get $0
  f64.const -1
  f64.store $0 offset=16
  local.get $0
  f64.const 0
  f64.store $0 offset=24
  local.get $0
  f64.const 0
  f64.store $0 offset=32
  local.get $0
  f64.const 60
  f64.store $0 offset=40
  local.get $0
  f64.const 0
  f64.store $0 offset=48
  local.get $0
  f64.const 0
  f64.store $0 offset=56
  local.get $0
  f64.const 0
  f64.store $0 offset=64
  local.get $0
  f64.const -inf
  f64.store $0 offset=72
  local.get $0
  f64.const inf
  f64.store $0 offset=80
  local.get $0
  i32.const 48000
  i32.store $0 offset=88
  local.get $0
  i32.const -1
  i32.store $0 offset=92
  local.get $0
  i32.const 0
  i32.store $0 offset=96
  local.get $0
 )
 (func $~lib/staticarray/StaticArray<assembly/core/runner/Ctrl>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1048768
   i32.const 1048816
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 2
  i32.shl
  local.tee $0
  i32.const 15
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill $0
  local.get $1
 )
 (func $assembly/core/runner/Bar#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/rt/stub/__alloc
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 16
  call $~lib/staticarray/StaticArray<assembly/core/runner/Ctrl>#constructor
  i32.store $0 offset=8
  local.get $0
 )
 (func $assembly/core/runner/Signal#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   call $~lib/rt/stub/__alloc
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
 )
 (func $assembly/core/runner/Ctrl#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   call $~lib/rt/stub/__alloc
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  call $assembly/core/runner/Signal#constructor
  i32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=20
  local.get $0
 )
 (func $assembly/core/runner/Runner#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 32
   i32.const 14
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=28
  i32.const 16384
  i32.const 16
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 16384
  memory.fill $0
  local.get $0
  local.get $1
  i32.store $0
  i32.const 16384
  i32.const 17
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.const 16384
  memory.fill $0
  local.get $0
  local.get $1
  i32.store $0 offset=4
  local.get $0
  i32.const 4096
  call $~lib/staticarray/StaticArray<assembly/core/runner/Ctrl>#constructor
  i32.store $0 offset=8
  local.get $0
  i32.const 4096
  call $~lib/staticarray/StaticArray<assembly/core/runner/Ctrl>#constructor
  i32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 4096
   i32.lt_s
   if
    local.get $0
    i32.load $0
    local.get $1
    i32.const 0
    call $assembly/core/runner/Bar#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 0
  local.set $1
  loop $for-loop|1
   local.get $1
   i32.const 4096
   i32.lt_s
   if
    local.get $0
    i32.load $0 offset=8
    local.get $1
    i32.const 0
    call $assembly/core/runner/Ctrl#constructor
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|1
   end
  end
  local.get $0
 )
 (func $assembly/core/engine/Engine#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.eqz
  if
   i32.const 32
   i32.const 9
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=24
  local.get $0
  local.get $2
  i32.store $0 offset=28
  local.get $0
  i32.const 0
  i32.store $0
  local.get $0
  i32.const 0
  i32.store $0 offset=4
  local.get $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
  i32.const 0
  call $assembly/core/runner/Signal#constructor
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.const 0
  call $assembly/core/clock/Clock#constructor
  local.tee $3
  call $assembly/core/runner/Runner#constructor
  i32.store $0 offset=16
  local.get $0
  local.get $2
  i32.load $0
  i32.store $0 offset=8
  local.get $0
  local.get $1
  i32.store $0
  local.get $0
  i32.const -1
  local.get $1
  i32.div_u
  i32.store $0 offset=4
  local.get $0
  local.get $3
  i32.store $0 offset=12
  local.get $0
  i32.load $0 offset=12
  local.get $1
  i32.store $0 offset=88
  local.get $0
 )
 (func $~lib/array/Array<~lib/staticarray/StaticArray<f32>>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  local.get $0
  i32.load $0 offset=12
  local.tee $8
  i32.const 1
  i32.add
  local.tee $12
  local.get $0
  i32.load $0 offset=8
  local.tee $10
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   local.get $12
   i32.const 268435455
   i32.gt_u
   if
    i32.const 1048768
    i32.const 1053872
    i32.const 19
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load $0
   local.set $9
   i32.const 1073741820
   local.get $10
   i32.const 1
   i32.shl
   local.tee $2
   local.get $2
   i32.const 1073741820
   i32.ge_u
   select
   local.tee $3
   i32.const 8
   local.get $12
   local.get $12
   i32.const 8
   i32.le_u
   select
   i32.const 2
   i32.shl
   local.tee $2
   local.get $2
   local.get $3
   i32.lt_u
   select
   local.tee $11
   i32.const 1073741804
   i32.gt_u
   if
    i32.const 1048880
    i32.const 1048944
    i32.const 99
    i32.const 30
    call $~lib/builtins/abort
    unreachable
   end
   local.get $9
   i32.const 16
   i32.sub
   local.tee $3
   i32.const 15
   i32.and
   i32.const 1
   local.get $3
   select
   if
    i32.const 0
    i32.const 1048944
    i32.const 45
    i32.const 3
    call $~lib/builtins/abort
    unreachable
   end
   global.get $~lib/rt/stub/offset
   local.get $3
   i32.const 4
   i32.sub
   local.tee $7
   i32.load $0
   local.tee $5
   local.get $3
   i32.add
   i32.eq
   local.set $4
   local.get $11
   i32.const 16
   i32.add
   local.tee $2
   i32.const 19
   i32.add
   i32.const -16
   i32.and
   i32.const 4
   i32.sub
   local.set $6
   local.get $2
   local.get $5
   i32.gt_u
   if
    local.get $4
    if
     local.get $2
     i32.const 1073741820
     i32.gt_u
     if
      i32.const 1048880
      i32.const 1048944
      i32.const 52
      i32.const 33
      call $~lib/builtins/abort
      unreachable
     end
     local.get $3
     local.get $6
     i32.add
     local.tee $5
     memory.size $0
     local.tee $4
     i32.const 16
     i32.shl
     i32.const 15
     i32.add
     i32.const -16
     i32.and
     local.tee $2
     i32.gt_u
     if
      local.get $4
      local.get $5
      local.get $2
      i32.sub
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee $2
      local.get $2
      local.get $4
      i32.lt_s
      select
      memory.grow $0
      i32.const 0
      i32.lt_s
      if
       local.get $2
       memory.grow $0
       i32.const 0
       i32.lt_s
       if
        unreachable
       end
      end
     end
     local.get $5
     global.set $~lib/rt/stub/offset
     local.get $7
     local.get $6
     i32.store $0
    else
     local.get $6
     local.get $5
     i32.const 1
     i32.shl
     local.tee $2
     local.get $2
     local.get $6
     i32.lt_u
     select
     call $~lib/rt/stub/__alloc
     local.tee $2
     local.get $3
     local.get $5
     memory.copy $0 $0
     local.get $2
     local.set $3
    end
   else
    local.get $4
    if
     local.get $3
     local.get $6
     i32.add
     global.set $~lib/rt/stub/offset
     local.get $7
     local.get $6
     i32.store $0
    end
   end
   local.get $3
   i32.const 4
   i32.sub
   local.get $11
   i32.store $0 offset=16
   local.get $3
   i32.const 16
   i32.add
   local.tee $2
   local.get $10
   i32.add
   i32.const 0
   local.get $11
   local.get $10
   i32.sub
   memory.fill $0
   local.get $2
   local.get $9
   i32.ne
   if
    local.get $0
    local.get $2
    i32.store $0
    local.get $0
    local.get $2
    i32.store $0 offset=4
   end
   local.get $0
   local.get $11
   i32.store $0 offset=8
  end
  local.get $0
  i32.load $0 offset=4
  local.get $8
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store $0
  local.get $0
  local.get $12
  i32.store $0 offset=12
 )
 (func $assembly/util/allocF32 (param $0 i32) (result i32)
  i32.const 1048640
  local.get $0
  call $~lib/staticarray/StaticArray<f32>#constructor
  local.tee $0
  call $~lib/array/Array<~lib/staticarray/StaticArray<f32>>#push
  local.get $0
 )
 (func $assembly/core/engine/Engine#createBlock (param $0 i32) (param $1 i32) (result i32)
  i32.const 1048640
  local.get $1
  call $~lib/staticarray/StaticArray<f32>#constructor
  local.tee $0
  call $~lib/array/Array<~lib/staticarray/StaticArray<f32>>#push
  local.get $0
 )
 (func $assembly/core/runner/Runner#clearLastBar (param $0 i32)
  local.get $0
  i32.const 0
  i32.store $0 offset=20
 )
 (func $~lib/staticarray/StaticArray<assembly/core/runner/Bar|null>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1048816
   i32.const 78
   i32.const 41
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load $0
 )
 (func $assembly/core/runner/Runner#get:clock (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=28
 )
 (func $assembly/graph/copy/copyMem (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  local.get $2
  memory.copy $0 $0
 )
 (func $assembly/math/add_audio_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.add
  local.set $0
  local.get $1
  local.get $5
  i32.add
  local.set $1
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/copy/copyInto (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $3
  local.get $0
  i32.const 2
  i32.shl
  local.tee $3
  i32.add
  local.get $2
  local.get $3
  i32.add
  local.get $1
  local.get $0
  i32.sub
  i32.const 2
  i32.shl
  memory.copy $0 $0
 )
 (func $assembly/core/runner/Runner#fill (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load $0 offset=4
  local.get $1
  call $~lib/staticarray/StaticArray<assembly/core/runner/Bar|null>#__get
  local.tee $1
  i32.eqz
  if
   return
  end
  loop $for-loop|0
   local.get $5
   local.get $1
   i32.load $0
   i32.lt_u
   if
    local.get $0
    i32.load $0 offset=28
    f64.const 0
    f64.store $0
    local.get $0
    i32.load $0 offset=28
    f64.const 0
    f64.store $0 offset=56
    local.get $1
    i32.load $0 offset=8
    local.get $5
    call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
    local.tee $6
    i32.load $0 offset=4
    local.get $0
    i32.load $0 offset=24
    local.tee $7
    call $assembly/env/setCtrlInstanceAt
    drop
    local.get $6
    local.get $7
    i32.store $0
    local.get $0
    local.get $7
    i32.const 2
    i32.add
    local.tee $7
    i32.const 0
    local.get $7
    i32.const 128
    i32.ne
    select
    i32.store $0 offset=24
    local.get $6
    i32.load $0 offset=16
    local.get $6
    i32.load $0 offset=20
    local.get $6
    i32.load $0 offset=12
    i32.const 2
    i32.shl
    memory.copy $0 $0
    local.get $2
    local.get $3
    local.get $6
    i32.load $0
    call_indirect $0 (type $i32_i32_=>_none)
    local.get $6
    i32.load $0 offset=8
    local.tee $6
    i32.load $0
    if
     local.get $6
     i32.load $0
     local.get $4
     i32.load $0
     local.tee $7
     local.get $2
     local.get $3
     local.get $7
     call $assembly/math/add_audio_audio
    end
    local.get $6
    i32.load $0 offset=4
    if
     local.get $6
     i32.load $0 offset=4
     local.get $4
     i32.load $0 offset=4
     local.tee $7
     local.get $2
     local.get $3
     local.get $7
     call $assembly/math/add_audio_audio
    end
    local.get $6
    i32.load $0 offset=8
    if
     local.get $6
     i32.load $0 offset=8
     local.get $4
     i32.load $0 offset=8
     local.tee $6
     local.get $2
     local.get $3
     local.get $6
     call $assembly/math/add_audio_audio
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $1
  i32.load $0 offset=4
  local.tee $1
  if
   local.get $0
   i32.load $0 offset=28
   f64.const 0
   f64.store $0
   local.get $0
   i32.load $0 offset=28
   f64.const 0
   f64.store $0 offset=56
   local.get $1
   i32.load $0 offset=4
   local.get $0
   i32.load $0 offset=24
   local.tee $5
   call $assembly/env/setCtrlInstanceAt
   drop
   local.get $1
   local.get $5
   i32.store $0
   local.get $0
   local.get $5
   i32.const 2
   i32.add
   local.tee $0
   i32.const 0
   local.get $0
   i32.const 128
   i32.ne
   select
   i32.store $0 offset=24
   local.get $1
   i32.load $0 offset=16
   local.get $1
   i32.load $0 offset=20
   local.get $1
   i32.load $0 offset=12
   i32.const 2
   i32.shl
   memory.copy $0 $0
   local.get $2
   local.get $3
   local.get $1
   i32.load $0
   call_indirect $0 (type $i32_i32_=>_none)
   local.get $2
   i32.const 2
   i32.shl
   local.tee $0
   local.get $4
   i32.load $0
   i32.add
   local.get $1
   i32.load $0 offset=8
   i32.load $0
   local.get $0
   i32.add
   local.get $3
   local.get $2
   i32.sub
   i32.const 2
   i32.shl
   local.tee $2
   memory.copy $0 $0
   local.get $4
   i32.load $0 offset=4
   local.get $0
   i32.add
   local.get $1
   i32.load $0 offset=8
   i32.load $0 offset=4
   local.get $0
   i32.add
   local.get $2
   memory.copy $0 $0
  end
 )
 (func $assembly/core/clock/Clock#get:timeStep (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=8
 )
 (func $assembly/graph/fade/fadeOut (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 f32)
  local.get $3
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    f32.convert_i32_u
    local.get $0
    f32.convert_i32_u
    local.tee $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    f32.const 1
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.sub
    f32.const 0
    f32.max
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $4
    i32.const 4
    i32.add
    local.set $4
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/fade/fadeIn (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 f32)
  local.get $3
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $3
    local.get $3
    v128.load $0
    local.get $4
    f32.convert_i32_u
    local.get $0
    f32.convert_i32_u
    local.tee $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $3
    v128.load $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    f32.convert_i32_u
    local.get $5
    f32.div
    f32.const 1
    f32.min
    f32x4.splat
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $4
    i32.const 4
    i32.add
    local.set $4
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/core/runner/Runner#process (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  local.get $0
  i32.load $0 offset=4
  local.get $2
  i32.trunc_sat_f64_u
  call $~lib/staticarray/StaticArray<assembly/core/runner/Bar|null>#__get
  local.tee $10
  if (result i32)
   local.get $10
   i32.load $0
  else
   i32.const 0
  end
  i32.eqz
  if
   local.get $0
   i32.load $0 offset=28
   local.tee $0
   local.get $1
   local.get $0
   f64.load $0 offset=8
   f64.const 128
   f64.mul
   f64.add
   f64.store $0
   return
  end
  local.get $10
  i32.load $0 offset=4
  local.set $12
  local.get $3
  i32.trunc_sat_f64_s
  local.tee $9
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 0
  else
   local.get $0
   i32.load $0 offset=4
   local.get $9
   call $~lib/staticarray/StaticArray<assembly/core/runner/Bar|null>#__get
  end
  local.set $14
  local.get $0
  i32.load $0 offset=20
  local.tee $15
  if
   local.get $10
   local.get $15
   i32.eq
   if
    local.get $10
    local.get $14
    i32.eq
    if
     loop $for-loop|0
      local.get $8
      local.get $10
      i32.load $0
      i32.lt_u
      if
       local.get $8
       if
        local.get $0
        i32.load $0 offset=28
        local.get $1
        f64.store $0
        local.get $0
        i32.load $0 offset=28
        local.get $2
        f64.store $0 offset=56
       end
       local.get $10
       i32.load $0 offset=8
       local.get $8
       call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
       local.tee $7
       i32.load $0 offset=16
       local.get $7
       i32.load $0 offset=20
       local.get $7
       i32.load $0 offset=12
       i32.const 2
       i32.shl
       memory.copy $0 $0
       local.get $4
       local.get $5
       local.get $7
       i32.load $0
       call_indirect $0 (type $i32_i32_=>_none)
       local.get $7
       i32.load $0 offset=8
       local.tee $7
       i32.load $0
       if
        local.get $7
        i32.load $0
        local.get $6
        i32.load $0
        local.tee $9
        local.get $4
        local.get $5
        local.get $9
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=4
       if
        local.get $7
        i32.load $0 offset=4
        local.get $6
        i32.load $0 offset=4
        local.tee $9
        local.get $4
        local.get $5
        local.get $9
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=8
       if
        local.get $7
        i32.load $0 offset=8
        local.get $6
        i32.load $0 offset=8
        local.tee $7
        local.get $4
        local.get $5
        local.get $7
        call $assembly/math/add_audio_audio
       end
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|0
      end
     end
    else
     loop $for-loop|1
      local.get $7
      local.get $10
      i32.load $0
      i32.lt_u
      if
       local.get $7
       if
        local.get $0
        i32.load $0 offset=28
        local.get $1
        f64.store $0
        local.get $0
        i32.load $0 offset=28
        local.get $2
        f64.store $0 offset=56
       end
       local.get $10
       i32.load $0 offset=8
       local.get $7
       call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
       local.tee $11
       i32.load $0 offset=16
       local.get $11
       i32.load $0 offset=20
       local.get $11
       i32.load $0 offset=12
       i32.const 2
       i32.shl
       memory.copy $0 $0
       local.get $4
       local.get $5
       local.get $11
       i32.load $0
       call_indirect $0 (type $i32_i32_=>_none)
       local.get $14
       if (result i32)
        i32.const 0
        local.set $8
        i32.const 0
        local.set $9
        loop $for-loop|2
         local.get $9
         local.get $14
         i32.load $0
         i32.lt_u
         if
          block $for-break2
           local.get $14
           i32.load $0 offset=8
           local.get $9
           call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
           local.set $13
           local.get $11
           i32.load $0 offset=4
           local.get $13
           i32.load $0 offset=4
           i32.eq
           if
            i32.const 1
            local.set $8
            br $for-break2
           end
           local.get $9
           i32.const 1
           i32.add
           local.set $9
           br $for-loop|2
          end
         end
        end
        local.get $8
        i32.eqz
       else
        i32.const 1
       end
       if
        local.get $11
        i32.load $0 offset=8
        local.tee $8
        i32.load $0
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $8
         i32.load $0
         call $assembly/graph/fade/fadeOut
        end
        local.get $8
        i32.load $0 offset=4
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $8
         i32.load $0 offset=4
         call $assembly/graph/fade/fadeOut
        end
        local.get $8
        i32.load $0 offset=8
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $8
         i32.load $0 offset=8
         call $assembly/graph/fade/fadeOut
        end
       end
       local.get $11
       i32.load $0 offset=8
       local.tee $8
       i32.load $0
       if
        local.get $8
        i32.load $0
        local.get $6
        i32.load $0
        local.tee $9
        local.get $4
        local.get $5
        local.get $9
        call $assembly/math/add_audio_audio
       end
       local.get $8
       i32.load $0 offset=4
       if
        local.get $8
        i32.load $0 offset=4
        local.get $6
        i32.load $0 offset=4
        local.tee $9
        local.get $4
        local.get $5
        local.get $9
        call $assembly/math/add_audio_audio
       end
       local.get $8
       i32.load $0 offset=8
       if
        local.get $8
        i32.load $0 offset=8
        local.get $6
        i32.load $0 offset=8
        local.tee $8
        local.get $4
        local.get $5
        local.get $8
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.const 1
       i32.add
       local.set $7
       br $for-loop|1
      end
     end
    end
   else
    local.get $10
    local.get $14
    i32.eq
    if
     loop $for-loop|3
      local.get $11
      local.get $10
      i32.load $0
      i32.lt_u
      if
       local.get $11
       if
        local.get $0
        i32.load $0 offset=28
        local.get $1
        f64.store $0
        local.get $0
        i32.load $0 offset=28
        local.get $2
        f64.store $0 offset=56
       end
       local.get $10
       i32.load $0 offset=8
       local.get $11
       call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
       local.tee $9
       i32.load $0 offset=4
       local.get $0
       i32.load $0 offset=24
       local.tee $7
       call $assembly/env/setCtrlInstanceAt
       drop
       local.get $9
       local.get $7
       i32.store $0
       local.get $0
       local.get $7
       i32.const 2
       i32.add
       local.tee $7
       i32.const 0
       local.get $7
       i32.const 128
       i32.ne
       select
       i32.store $0 offset=24
       i32.const 0
       local.set $8
       i32.const 0
       local.set $7
       loop $for-loop|4
        local.get $7
        local.get $15
        i32.load $0
        i32.lt_u
        if
         block $for-break4
          local.get $15
          i32.load $0 offset=8
          local.get $7
          call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
          local.set $13
          local.get $9
          i32.load $0 offset=4
          local.get $13
          i32.load $0 offset=4
          i32.eq
          if
           i32.const 1
           local.set $8
           br $for-break4
          end
          local.get $7
          i32.const 1
          i32.add
          local.set $7
          br $for-loop|4
         end
        end
       end
       local.get $8
       i32.eqz
       if
        local.get $9
        i32.load $0 offset=4
        call $assembly/env/resetCtrlInstance
        drop
       end
       local.get $9
       i32.load $0 offset=16
       local.get $9
       i32.load $0 offset=20
       local.get $9
       i32.load $0 offset=12
       i32.const 2
       i32.shl
       memory.copy $0 $0
       local.get $4
       local.get $5
       local.get $9
       i32.load $0
       call_indirect $0 (type $i32_i32_=>_none)
       local.get $8
       i32.eqz
       if
        local.get $9
        i32.load $0 offset=8
        local.tee $7
        i32.load $0
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0
         call $assembly/graph/fade/fadeIn
        end
        local.get $7
        i32.load $0 offset=4
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=4
         call $assembly/graph/fade/fadeIn
        end
        local.get $7
        i32.load $0 offset=8
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=8
         call $assembly/graph/fade/fadeIn
        end
       end
       local.get $9
       i32.load $0 offset=8
       local.tee $7
       i32.load $0
       if
        local.get $7
        i32.load $0
        local.get $6
        i32.load $0
        local.tee $8
        local.get $4
        local.get $5
        local.get $8
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=4
       if
        local.get $7
        i32.load $0 offset=4
        local.get $6
        i32.load $0 offset=4
        local.tee $8
        local.get $4
        local.get $5
        local.get $8
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=8
       if
        local.get $7
        i32.load $0 offset=8
        local.get $6
        i32.load $0 offset=8
        local.tee $7
        local.get $4
        local.get $5
        local.get $7
        call $assembly/math/add_audio_audio
       end
       local.get $11
       i32.const 1
       i32.add
       local.set $11
       br $for-loop|3
      end
     end
    else
     loop $for-loop|5
      local.get $11
      local.get $10
      i32.load $0
      i32.lt_u
      if
       local.get $11
       if
        local.get $0
        i32.load $0 offset=28
        local.get $1
        f64.store $0
        local.get $0
        i32.load $0 offset=28
        local.get $2
        f64.store $0 offset=56
       end
       local.get $10
       i32.load $0 offset=8
       local.get $11
       call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
       local.tee $13
       i32.load $0 offset=4
       local.get $0
       i32.load $0 offset=24
       local.tee $7
       call $assembly/env/setCtrlInstanceAt
       drop
       local.get $13
       local.get $7
       i32.store $0
       local.get $0
       local.get $7
       i32.const 2
       i32.add
       local.tee $7
       i32.const 0
       local.get $7
       i32.const 128
       i32.ne
       select
       i32.store $0 offset=24
       i32.const 0
       local.set $8
       i32.const 0
       local.set $7
       loop $for-loop|6
        local.get $7
        local.get $15
        i32.load $0
        i32.lt_u
        if
         block $for-break6
          local.get $15
          i32.load $0 offset=8
          local.get $7
          call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
          local.set $9
          local.get $13
          i32.load $0 offset=4
          local.get $9
          i32.load $0 offset=4
          i32.eq
          if
           i32.const 1
           local.set $8
           br $for-break6
          end
          local.get $7
          i32.const 1
          i32.add
          local.set $7
          br $for-loop|6
         end
        end
       end
       local.get $8
       i32.eqz
       if
        local.get $13
        i32.load $0 offset=4
        call $assembly/env/resetCtrlInstance
        drop
       end
       local.get $13
       i32.load $0 offset=16
       local.get $13
       i32.load $0 offset=20
       local.get $13
       i32.load $0 offset=12
       i32.const 2
       i32.shl
       memory.copy $0 $0
       local.get $4
       local.get $5
       local.get $13
       i32.load $0
       call_indirect $0 (type $i32_i32_=>_none)
       local.get $8
       i32.eqz
       if
        local.get $13
        i32.load $0 offset=8
        local.tee $7
        i32.load $0
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0
         call $assembly/graph/fade/fadeIn
        end
        local.get $7
        i32.load $0 offset=4
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=4
         call $assembly/graph/fade/fadeIn
        end
        local.get $7
        i32.load $0 offset=8
        if
         i32.const 8
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=8
         call $assembly/graph/fade/fadeIn
        end
       end
       local.get $14
       if (result i32)
        i32.const 0
        local.set $9
        i32.const 0
        local.set $7
        loop $for-loop|7
         local.get $7
         local.get $14
         i32.load $0
         i32.lt_u
         if
          block $for-break7
           local.get $14
           i32.load $0 offset=8
           local.get $7
           call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
           local.set $8
           local.get $13
           i32.load $0 offset=4
           local.get $8
           i32.load $0 offset=4
           i32.eq
           if
            i32.const 1
            local.set $9
            br $for-break7
           end
           local.get $7
           i32.const 1
           i32.add
           local.set $7
           br $for-loop|7
          end
         end
        end
        local.get $9
        i32.eqz
       else
        i32.const 1
       end
       if
        local.get $13
        i32.load $0 offset=8
        local.tee $7
        i32.load $0
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $7
         i32.load $0
         call $assembly/graph/fade/fadeOut
        end
        local.get $7
        i32.load $0 offset=4
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=4
         call $assembly/graph/fade/fadeOut
        end
        local.get $7
        i32.load $0 offset=8
        if
         i32.const 128
         local.get $4
         local.get $5
         local.get $7
         i32.load $0 offset=8
         call $assembly/graph/fade/fadeOut
        end
       end
       local.get $13
       i32.load $0 offset=8
       local.tee $7
       i32.load $0
       if
        local.get $7
        i32.load $0
        local.get $6
        i32.load $0
        local.tee $8
        local.get $4
        local.get $5
        local.get $8
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=4
       if
        local.get $7
        i32.load $0 offset=4
        local.get $6
        i32.load $0 offset=4
        local.tee $8
        local.get $4
        local.get $5
        local.get $8
        call $assembly/math/add_audio_audio
       end
       local.get $7
       i32.load $0 offset=8
       if
        local.get $7
        i32.load $0 offset=8
        local.get $6
        i32.load $0 offset=8
        local.tee $7
        local.get $4
        local.get $5
        local.get $7
        call $assembly/math/add_audio_audio
       end
       local.get $11
       i32.const 1
       i32.add
       local.set $11
       br $for-loop|5
      end
     end
    end
    local.get $0
    i32.const 0
    i32.store $0 offset=16
   end
  else
   local.get $10
   local.get $14
   i32.eq
   if
    loop $for-loop|8
     local.get $8
     local.get $10
     i32.load $0
     i32.lt_u
     if
      local.get $8
      if
       local.get $0
       i32.load $0 offset=28
       local.get $1
       f64.store $0
       local.get $0
       i32.load $0 offset=28
       local.get $2
       f64.store $0 offset=56
      end
      local.get $10
      i32.load $0 offset=8
      local.get $8
      call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
      local.tee $7
      i32.load $0 offset=4
      local.get $0
      i32.load $0 offset=24
      local.tee $9
      call $assembly/env/setCtrlInstanceAt
      drop
      local.get $7
      local.get $9
      i32.store $0
      local.get $0
      local.get $9
      i32.const 2
      i32.add
      local.tee $9
      i32.const 0
      local.get $9
      i32.const 128
      i32.ne
      select
      i32.store $0 offset=24
      local.get $7
      i32.load $0 offset=4
      call $assembly/env/resetCtrlInstance
      drop
      local.get $7
      i32.load $0 offset=16
      local.get $7
      i32.load $0 offset=20
      local.get $7
      i32.load $0 offset=12
      i32.const 2
      i32.shl
      memory.copy $0 $0
      local.get $4
      local.get $5
      local.get $7
      i32.load $0
      call_indirect $0 (type $i32_i32_=>_none)
      local.get $7
      i32.load $0 offset=8
      local.tee $9
      i32.load $0
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $9
       i32.load $0
       call $assembly/graph/fade/fadeIn
      end
      local.get $9
      i32.load $0 offset=4
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $9
       i32.load $0 offset=4
       call $assembly/graph/fade/fadeIn
      end
      local.get $9
      i32.load $0 offset=8
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $9
       i32.load $0 offset=8
       call $assembly/graph/fade/fadeIn
      end
      local.get $7
      i32.load $0 offset=8
      local.tee $7
      i32.load $0
      if
       local.get $7
       i32.load $0
       local.get $6
       i32.load $0
       local.tee $9
       local.get $4
       local.get $5
       local.get $9
       call $assembly/math/add_audio_audio
      end
      local.get $7
      i32.load $0 offset=4
      if
       local.get $7
       i32.load $0 offset=4
       local.get $6
       i32.load $0 offset=4
       local.tee $9
       local.get $4
       local.get $5
       local.get $9
       call $assembly/math/add_audio_audio
      end
      local.get $7
      i32.load $0 offset=8
      if
       local.get $7
       i32.load $0 offset=8
       local.get $6
       i32.load $0 offset=8
       local.tee $7
       local.get $4
       local.get $5
       local.get $7
       call $assembly/math/add_audio_audio
      end
      local.get $8
      i32.const 1
      i32.add
      local.set $8
      br $for-loop|8
     end
    end
   else
    loop $for-loop|9
     local.get $7
     local.get $10
     i32.load $0
     i32.lt_u
     if
      local.get $7
      if
       local.get $0
       i32.load $0 offset=28
       local.get $1
       f64.store $0
       local.get $0
       i32.load $0 offset=28
       local.get $2
       f64.store $0 offset=56
      end
      local.get $10
      i32.load $0 offset=8
      local.get $7
      call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
      local.tee $11
      i32.load $0 offset=4
      local.get $0
      i32.load $0 offset=24
      local.tee $8
      call $assembly/env/setCtrlInstanceAt
      drop
      local.get $11
      local.get $8
      i32.store $0
      local.get $0
      local.get $8
      i32.const 2
      i32.add
      local.tee $8
      i32.const 0
      local.get $8
      i32.const 128
      i32.ne
      select
      i32.store $0 offset=24
      local.get $11
      i32.load $0 offset=4
      call $assembly/env/resetCtrlInstance
      drop
      local.get $11
      i32.load $0 offset=16
      local.get $11
      i32.load $0 offset=20
      local.get $11
      i32.load $0 offset=12
      i32.const 2
      i32.shl
      memory.copy $0 $0
      local.get $4
      local.get $5
      local.get $11
      i32.load $0
      call_indirect $0 (type $i32_i32_=>_none)
      local.get $11
      i32.load $0 offset=8
      local.tee $8
      i32.load $0
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $8
       i32.load $0
       call $assembly/graph/fade/fadeIn
      end
      local.get $8
      i32.load $0 offset=4
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $8
       i32.load $0 offset=4
       call $assembly/graph/fade/fadeIn
      end
      local.get $8
      i32.load $0 offset=8
      if
       i32.const 32
       local.get $4
       local.get $5
       local.get $8
       i32.load $0 offset=8
       call $assembly/graph/fade/fadeIn
      end
      local.get $14
      if (result i32)
       i32.const 0
       local.set $8
       i32.const 0
       local.set $9
       loop $for-loop|10
        local.get $9
        local.get $14
        i32.load $0
        i32.lt_u
        if
         block $for-break10
          local.get $14
          i32.load $0 offset=8
          local.get $9
          call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
          local.set $13
          local.get $11
          i32.load $0 offset=4
          local.get $13
          i32.load $0 offset=4
          i32.eq
          if
           i32.const 1
           local.set $8
           br $for-break10
          end
          local.get $9
          i32.const 1
          i32.add
          local.set $9
          br $for-loop|10
         end
        end
       end
       local.get $8
       i32.eqz
      else
       i32.const 1
      end
      if
       local.get $11
       i32.load $0 offset=8
       local.tee $8
       i32.load $0
       if
        i32.const 128
        local.get $4
        local.get $5
        local.get $8
        i32.load $0
        call $assembly/graph/fade/fadeOut
       end
       local.get $8
       i32.load $0 offset=4
       if
        i32.const 128
        local.get $4
        local.get $5
        local.get $8
        i32.load $0 offset=4
        call $assembly/graph/fade/fadeOut
       end
       local.get $8
       i32.load $0 offset=8
       if
        i32.const 128
        local.get $4
        local.get $5
        local.get $8
        i32.load $0 offset=8
        call $assembly/graph/fade/fadeOut
       end
      end
      local.get $11
      i32.load $0 offset=8
      local.tee $8
      i32.load $0
      if
       local.get $8
       i32.load $0
       local.get $6
       i32.load $0
       local.tee $9
       local.get $4
       local.get $5
       local.get $9
       call $assembly/math/add_audio_audio
      end
      local.get $8
      i32.load $0 offset=4
      if
       local.get $8
       i32.load $0 offset=4
       local.get $6
       i32.load $0 offset=4
       local.tee $9
       local.get $4
       local.get $5
       local.get $9
       call $assembly/math/add_audio_audio
      end
      local.get $8
      i32.load $0 offset=8
      if
       local.get $8
       i32.load $0 offset=8
       local.get $6
       i32.load $0 offset=8
       local.tee $8
       local.get $4
       local.get $5
       local.get $8
       call $assembly/math/add_audio_audio
      end
      local.get $7
      i32.const 1
      i32.add
      local.set $7
      br $for-loop|9
     end
    end
   end
   local.get $0
   i32.const 0
   i32.store $0 offset=16
  end
  local.get $12
  local.get $0
  i32.load $0 offset=16
  i32.ne
  if
   local.get $0
   local.get $12
   i32.store $0 offset=16
   local.get $12
   if
    local.get $12
    i32.load $0 offset=4
    local.get $0
    i32.load $0 offset=24
    local.tee $7
    call $assembly/env/setCtrlInstanceAt
    drop
    local.get $12
    local.get $7
    i32.store $0
    local.get $0
    local.get $7
    i32.const 2
    i32.add
    local.tee $7
    i32.const 0
    local.get $7
    i32.const 128
    i32.ne
    select
    i32.store $0 offset=24
   end
  end
  local.get $0
  i32.load $0 offset=28
  local.get $1
  f64.store $0
  local.get $0
  i32.load $0 offset=28
  local.get $2
  f64.store $0 offset=56
  local.get $12
  i32.load $0 offset=16
  local.get $12
  i32.load $0 offset=20
  local.get $12
  i32.load $0 offset=12
  i32.const 2
  i32.shl
  memory.copy $0 $0
  local.get $4
  local.get $5
  local.get $12
  i32.load $0
  call_indirect $0 (type $i32_i32_=>_none)
  local.get $4
  i32.const 2
  i32.shl
  local.tee $7
  local.get $6
  i32.load $0
  i32.add
  local.get $12
  i32.load $0 offset=8
  i32.load $0
  local.get $7
  i32.add
  local.get $5
  local.get $4
  i32.sub
  i32.const 2
  i32.shl
  local.tee $4
  memory.copy $0 $0
  local.get $6
  i32.load $0 offset=4
  local.get $7
  i32.add
  local.get $12
  i32.load $0 offset=8
  i32.load $0 offset=4
  local.get $7
  i32.add
  local.get $4
  memory.copy $0 $0
  local.get $0
  local.get $10
  i32.store $0 offset=20
 )
 (func $assembly/gen/gen/Gen#set:gain (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0
 )
 (func $assembly/gen/gen/Gen#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 8
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=4
  local.get $0
  f32.const 1
  f32.store $0
  local.get $0
 )
 (func $assembly/gen/zero/Zero#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 8
   i32.const 22
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
 )
 (func $assembly/util/getObjectSize<assembly/gen/zero/Zero> (result i32)
  i32.const 8
 )
 (func $assembly/util/cloneI32 (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 268435455
  i32.gt_u
  if
   i32.const 1048768
   i32.const 1048816
   i32.const 51
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.tee $3
  i32.const 6
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  local.get $3
  memory.fill $0
  local.get $2
  local.get $0
  local.get $1
  memory.copy $0 $0
  i32.const 1048720
  local.get $2
  call $~lib/array/Array<~lib/staticarray/StaticArray<f32>>#push
  local.get $2
 )
 (func $assembly/gen/osc/Osc#set:hz (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=8
 )
 (func $assembly/gen/osc/Osc#set:trig (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=12
 )
 (func $assembly/gen/osc/Osc#set:offset (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=16
 )
 (func $assembly/gen/osc/Osc#set:_sample (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=28
 )
 (func $assembly/gen/osc/Osc#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 24
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 440
  f32.store $0 offset=8
  local.get $0
  f32.const 0
  f32.store $0 offset=12
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  f32.const 0
  f32.store $0 offset=28
  local.get $0
  i32.const -1
  i32.store $0 offset=32
  local.get $0
  i32.const 0
  i32.store $0 offset=36
  local.get $0
 )
 (func $assembly/gen/sin/Sin#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 23
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/osc/Osc#constructor
 )
 (func $assembly/util/getObjectSize<assembly/gen/sin/Sin> (result i32)
  i32.const 40
 )
 (func $assembly/gen/exp/Exp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 25
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/osc/Osc#constructor
 )
 (func $assembly/gen/aosc/AOsc#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 44
   i32.const 27
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/osc/Osc#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=40
  local.get $0
 )
 (func $assembly/gen/saw/Saw#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 44
   i32.const 26
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/aosc/AOsc#constructor
 )
 (func $assembly/util/getObjectSize<assembly/gen/saw/Saw> (result i32)
  i32.const 44
 )
 (func $assembly/gen/ramp/Ramp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 44
   i32.const 28
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/aosc/AOsc#constructor
 )
 (func $assembly/gen/sqr/Sqr#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 44
   i32.const 29
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/aosc/AOsc#constructor
 )
 (func $assembly/gen/tri/Tri#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 44
   i32.const 30
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/aosc/AOsc#constructor
 )
 (func $assembly/gen/noise/Noise#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 31
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/osc/Osc#constructor
 )
 (func $assembly/gen/dc/Dc#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 20
   i32.const 32
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 0.20000000298023224
  f32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/dc/Dc> (result i32)
  i32.const 20
 )
 (func $assembly/gen/delay/Delay#set:_stepf (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=32
 )
 (func $assembly/gen/delay/Delay#set:_targetf (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=36
 )
 (func $assembly/gen/delay/Delay#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 33
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 200
  f32.store $0 offset=8
  local.get $0
  f32.const 0.5
  f32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
  i32.const 65536
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=20
  local.get $0
  i32.const 65535
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  i32.store $0 offset=28
  local.get $0
  f32.const 0
  f32.store $0 offset=32
  local.get $0
  f32.const 0
  f32.store $0 offset=36
  local.get $0
 )
 (func $assembly/gen/tap/Tap#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 36
   i32.const 34
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 200
  f32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  i32.const 65536
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=16
  local.get $0
  i32.const 65535
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  f32.const 0
  f32.store $0 offset=28
  local.get $0
  f32.const 0
  f32.store $0 offset=32
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/tap/Tap> (result i32)
  i32.const 36
 )
 (func $assembly/gen/lp/Lp#set:_sample (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=20
 )
 (func $assembly/gen/lp/Lp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 24
   i32.const 35
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
  f32.const 0
  f32.store $0 offset=20
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/lp/Lp> (result i32)
  i32.const 24
 )
 (func $assembly/gen/rate/Rate#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 36
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store $0 offset=4
  local.get $0
  f32.const 0
  f32.store $0 offset=8
  local.get $0
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  local.get $1
  i32.load $0 offset=24
  f32.convert_i32_u
  f32.store $0 offset=8
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/rate/Rate> (result i32)
  i32.const 12
 )
 (func $assembly/gen/biquad/Biquad#set:_b2 (param $0 i32) (param $1 f64)
  local.get $0
  local.get $1
  f64.store $0 offset=88
 )
 (func $~lib/rt/__newArray (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 12
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $1
  local.get $0
  if
   local.get $1
   local.get $0
   i32.const 12
   memory.copy $0 $0
  end
  i32.const 16
  i32.const 39
  call $~lib/rt/stub/__new
  local.tee $0
  local.get $1
  i32.store $0
  local.get $0
  local.get $1
  i32.store $0 offset=4
  local.get $0
  i32.const 12
  i32.store $0 offset=8
  local.get $0
  i32.const 3
  i32.store $0 offset=12
  local.get $0
 )
 (func $assembly/gen/biquad/Biquad#set:_params_Q (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=100
 )
 (func $assembly/gen/biquad/Biquad#set:_params_gain (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=104
 )
 (func $assembly/gen/biquad/Biquad#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 108
   i32.const 38
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  f64.const 0
  f64.store $0 offset=16
  local.get $0
  f64.const 0
  f64.store $0 offset=24
  local.get $0
  f64.const 0
  f64.store $0 offset=32
  local.get $0
  f64.const 0
  f64.store $0 offset=40
  local.get $0
  f64.const 1
  f64.store $0 offset=48
  local.get $0
  f64.const 0
  f64.store $0 offset=56
  local.get $0
  f64.const 0
  f64.store $0 offset=64
  local.get $0
  f64.const 0
  f64.store $0 offset=72
  local.get $0
  f64.const 0
  f64.store $0 offset=80
  local.get $0
  f64.const 0
  f64.store $0 offset=88
  local.get $0
  i32.const 1053920
  call $~lib/rt/__newArray
  i32.store $0 offset=96
  local.get $0
  i32.const 1053952
  call $~lib/rt/__newArray
  i32.store $0 offset=100
  local.get $0
  i32.const 1053984
  call $~lib/rt/__newArray
  i32.store $0 offset=104
  local.get $0
 )
 (func $assembly/gen/blp/Blp#set:cut (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=108
 )
 (func $assembly/gen/blp/Blp#set:q (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=112
 )
 (func $assembly/gen/blp/Blp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 116
   i32.const 37
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/blp/Blp> (result i32)
  i32.const 116
 )
 (func $assembly/gen/bhp/Bhp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 116
   i32.const 41
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
 )
 (func $assembly/gen/bbp/Bbp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 116
   i32.const 42
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
 )
 (func $assembly/gen/bno/Bno#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 116
   i32.const 43
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
 )
 (func $assembly/gen/bpk/Bpk#set:amt (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=116
 )
 (func $assembly/gen/bpk/Bpk#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 120
   i32.const 44
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
  f32.const 1
  f32.store $0 offset=116
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/bpk/Bpk> (result i32)
  i32.const 120
 )
 (func $assembly/gen/bap/Bap#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 116
   i32.const 45
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
 )
 (func $assembly/gen/bls/Bls#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 120
   i32.const 46
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
  f32.const 1
  f32.store $0 offset=116
  local.get $0
 )
 (func $assembly/gen/bhs/Bhs#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 120
   i32.const 47
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/biquad/Biquad#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=108
  local.get $0
  f32.const 0.5
  f32.store $0 offset=112
  local.get $0
  f32.const 1
  f32.store $0 offset=116
  local.get $0
 )
 (func $assembly/gen/svf/Svf#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 104
   i32.const 49
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  f64.const 0
  f64.store $0 offset=16
  local.get $0
  f64.const 0
  f64.store $0 offset=24
  local.get $0
  f64.const 1
  f64.store $0 offset=32
  local.get $0
  f64.const 0
  f64.store $0 offset=40
  local.get $0
  f64.const 0
  f64.store $0 offset=48
  local.get $0
  f64.const 0
  f64.store $0 offset=56
  local.get $0
  f64.const 0
  f64.store $0 offset=64
  local.get $0
  f64.const 0
  f64.store $0 offset=72
  local.get $0
  f64.const 0
  f64.store $0 offset=80
  local.get $0
  f64.const 0
  f64.store $0 offset=88
  local.get $0
  i32.const 1054016
  call $~lib/rt/__newArray
  i32.store $0 offset=96
  local.get $0
  i32.const 1054048
  call $~lib/rt/__newArray
  i32.store $0 offset=100
  local.get $0
 )
 (func $assembly/gen/slp/Slp#set:cut (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=104
 )
 (func $assembly/gen/slp/Slp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 48
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/slp/Slp> (result i32)
  i32.const 112
 )
 (func $assembly/gen/shp/Shp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 50
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/gen/sbp/Sbp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 51
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/gen/sap/Sap#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 52
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/gen/sno/Sno#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 53
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/gen/spk/Spk#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 112
   i32.const 54
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/svf/Svf#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=104
  local.get $0
  f32.const 0.5
  f32.store $0 offset=108
  local.get $0
 )
 (func $assembly/gen/moog/Moog#set:_m_azt4 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=24
 )
 (func $assembly/gen/moog/Moog#set:_x1 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=40
 )
 (func $assembly/gen/moog/Moog#set:_az3 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=44
 )
 (func $assembly/gen/moog/Moog#set:_az4 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=48
 )
 (func $assembly/gen/moog/Moog#set:_amf (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=52
 )
 (func $assembly/gen/moog/Moog#set:_kVt (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=56
 )
 (func $assembly/gen/moog/Moog#set:_m_kacr (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=60
 )
 (func $assembly/gen/moog/Moog#set:_m_k2vg (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=64
 )
 (func $assembly/gen/moog/Moog#set:_m_postGain (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=68
 )
 (func $assembly/gen/moog/Moog#set:_params_freq (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=72
 )
 (func $assembly/gen/moog/Moog#set:_params_Q (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=76
 )
 (func $assembly/gen/moog/Moog#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 80
   i32.const 56
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  f32.const 0
  f32.store $0 offset=12
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
  f32.const 0
  f32.store $0 offset=20
  local.get $0
  f32.const 0
  f32.store $0 offset=24
  local.get $0
  f32.const 0
  f32.store $0 offset=28
  local.get $0
  f32.const 0
  f32.store $0 offset=32
  local.get $0
  f32.const 0
  f32.store $0 offset=36
  local.get $0
  f32.const 0
  f32.store $0 offset=40
  local.get $0
  f32.const 0
  f32.store $0 offset=44
  local.get $0
  f32.const 0
  f32.store $0 offset=48
  local.get $0
  f32.const 0
  f32.store $0 offset=52
  local.get $0
  f32.const 1.2000000476837158
  f32.store $0 offset=56
  local.get $0
  f32.const 0
  f32.store $0 offset=60
  local.get $0
  f32.const 0
  f32.store $0 offset=64
  local.get $0
  f32.const 0
  f32.store $0 offset=68
  local.get $0
  i32.const 1054080
  call $~lib/rt/__newArray
  i32.store $0 offset=72
  local.get $0
  i32.const 1054112
  call $~lib/rt/__newArray
  i32.store $0 offset=76
  local.get $0
 )
 (func $assembly/gen/mlp/Mlp#set:cut (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=80
 )
 (func $assembly/gen/mlp/Mlp#set:q (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=84
 )
 (func $assembly/gen/mlp/Mlp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 88
   i32.const 55
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/moog/Moog#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=80
  local.get $0
  f32.const 0.5
  f32.store $0 offset=84
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/mlp/Mlp> (result i32)
  i32.const 88
 )
 (func $assembly/gen/mhp/Mhp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 88
   i32.const 57
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/moog/Moog#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=80
  local.get $0
  f32.const 0.5
  f32.store $0 offset=84
  local.get $0
 )
 (func $assembly/gen/daverb/Daverb#set:_params_dc (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=68
 )
 (func $assembly/gen/daverb/Daverb#set:_params_dp (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=80
 )
 (func $assembly/gen/daverb/Daverb#set:_params_ex (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=84
 )
 (func $assembly/gen/daverb/Daverb#set:_dpn (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=92
 )
 (func $assembly/gen/daverb/Daverb#set:_exn (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=96
 )
 (func $assembly/gen/daverb/Daverb#set:_edn (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=100
 )
 (func $assembly/gen/daverb/Daverb#set:_predelay (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=108
 )
 (func $assembly/gen/daverb/Daverb#set:_d0 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=112
 )
 (func $assembly/gen/daverb/Daverb#set:_d1 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=116
 )
 (func $assembly/gen/daverb/Daverb#set:_d2 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=120
 )
 (func $assembly/gen/daverb/Daverb#set:_d3 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=124
 )
 (func $assembly/gen/daverb/Daverb#set:_d4 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=128
 )
 (func $assembly/gen/daverb/Daverb#set:_d5 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=132
 )
 (func $assembly/gen/daverb/Daverb#set:_d6 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=136
 )
 (func $assembly/gen/daverb/Daverb#set:_d7 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=140
 )
 (func $assembly/gen/daverb/Daverb#set:_d8 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=144
 )
 (func $assembly/gen/daverb/Daverb#set:_d9 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=148
 )
 (func $assembly/gen/daverb/Daverb#set:_d10 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=152
 )
 (func $assembly/gen/daverb/Daverb#set:_d11 (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=156
 )
 (func $assembly/gen/daverb/Daverb#set:_index (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=160
 )
 (func $assembly/gen/daverb/Daverb#set:_mask (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=164
 )
 (func $assembly/gen/daverb/Daverb#set:_lp1 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=168
 )
 (func $assembly/gen/daverb/Daverb#set:_lp2 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=172
 )
 (func $assembly/gen/daverb/Daverb#set:_lp3 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=176
 )
 (func $assembly/gen/daverb/Daverb#set:_excPhase (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store $0 offset=180
 )
 (func $assembly/gen/daverb/Daverb#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 184
   i32.const 58
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
  f32.const 0.029999999329447746
  f32.store $0 offset=12
  local.get $0
  f32.const 0.10000000149011612
  f32.store $0 offset=16
  local.get $0
  f32.const 0.5
  f32.store $0 offset=20
  local.get $0
  f32.const 0.5
  f32.store $0 offset=24
  local.get $0
  f32.const 0.5
  f32.store $0 offset=28
  local.get $0
  f32.const 0.5
  f32.store $0 offset=32
  local.get $0
  f32.const 0.5
  f32.store $0 offset=36
  local.get $0
  f32.const 0.5
  f32.store $0 offset=40
  local.get $0
  f32.const 0.5
  f32.store $0 offset=44
  local.get $0
  f32.const 0.5
  f32.store $0 offset=48
  local.get $0
  i32.const 1054144
  call $~lib/rt/__newArray
  i32.store $0 offset=52
  local.get $0
  i32.const 1054176
  call $~lib/rt/__newArray
  i32.store $0 offset=56
  local.get $0
  i32.const 1054208
  call $~lib/rt/__newArray
  i32.store $0 offset=60
  local.get $0
  i32.const 1054240
  call $~lib/rt/__newArray
  i32.store $0 offset=64
  local.get $0
  i32.const 1054272
  call $~lib/rt/__newArray
  i32.store $0 offset=68
  local.get $0
  i32.const 1054304
  call $~lib/rt/__newArray
  i32.store $0 offset=72
  local.get $0
  i32.const 1054336
  call $~lib/rt/__newArray
  i32.store $0 offset=76
  local.get $0
  i32.const 1054368
  call $~lib/rt/__newArray
  i32.store $0 offset=80
  local.get $0
  i32.const 1054400
  call $~lib/rt/__newArray
  i32.store $0 offset=84
  local.get $0
  i32.const 1054432
  call $~lib/rt/__newArray
  i32.store $0 offset=88
  local.get $0
  f32.const 0
  f32.store $0 offset=92
  local.get $0
  f32.const 0
  f32.store $0 offset=96
  local.get $0
  f32.const 0
  f32.store $0 offset=100
  local.get $0
  f32.const 0
  f32.store $0 offset=104
  local.get $0
  i32.const 65536
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=108
  local.get $0
  global.get $assembly/gen/daverb/ld0
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=112
  local.get $0
  global.get $assembly/gen/daverb/ld1
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=116
  local.get $0
  global.get $assembly/gen/daverb/ld2
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=120
  local.get $0
  global.get $assembly/gen/daverb/ld3
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=124
  local.get $0
  global.get $assembly/gen/daverb/ld4
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=128
  local.get $0
  global.get $assembly/gen/daverb/ld5
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=132
  local.get $0
  global.get $assembly/gen/daverb/ld6
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=136
  local.get $0
  global.get $assembly/gen/daverb/ld7
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=140
  local.get $0
  global.get $assembly/gen/daverb/ld8
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=144
  local.get $0
  global.get $assembly/gen/daverb/ld9
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=148
  local.get $0
  global.get $assembly/gen/daverb/ld10
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=152
  local.get $0
  global.get $assembly/gen/daverb/ld11
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=156
  local.get $0
  i32.const 0
  i32.store $0 offset=160
  local.get $0
  i32.const 65535
  i32.store $0 offset=164
  local.get $0
  f32.const 0
  f32.store $0 offset=168
  local.get $0
  f32.const 0
  f32.store $0 offset=172
  local.get $0
  f32.const 0
  f32.store $0 offset=176
  local.get $0
  i32.const 0
  i32.store $0 offset=180
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/daverb/Daverb> (result i32)
  i32.const 184
 )
 (func $assembly/gen/tanh/Tanh#set:_gainv (param $0 i32) (param $1 v128)
  local.get $0
  local.get $1
  v128.store $0 offset=16
 )
 (func $assembly/gen/tanh/Tanh#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 36
   i32.const 59
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 1
  f32.store $0
  local.get $0
  v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
  v128.store $0 offset=16
  local.get $0
  i32.const 0
  i32.store $0 offset=32
  local.get $0
 )
 (func $assembly/gen/diode/Diode#set:_g (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=72
 )
 (func $assembly/gen/diode/Diode#set:_g0 (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=76
 )
 (func $assembly/gen/diode/Diode#set:_ainv (param $0 i32) (param $1 f32)
  local.get $0
  local.get $1
  f32.store $0 offset=88
 )
 (func $assembly/gen/diode/Diode#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 96
   i32.const 60
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 500
  f32.store $0 offset=8
  local.get $0
  f32.const 1e3
  f32.store $0 offset=12
  local.get $0
  f32.const 1
  f32.store $0 offset=16
  local.get $0
  f32.const 0
  f32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  f32.const 0
  f32.store $0 offset=28
  local.get $0
  f32.const 0
  f32.store $0 offset=32
  local.get $0
  f32.const 0
  f32.store $0 offset=36
  local.get $0
  f32.const 0
  f32.store $0 offset=40
  local.get $0
  f32.const 0
  f32.store $0 offset=44
  local.get $0
  f32.const 0
  f32.store $0 offset=48
  local.get $0
  f32.const 0
  f32.store $0 offset=52
  local.get $0
  f32.const 0
  f32.store $0 offset=56
  local.get $0
  f32.const 0
  f32.store $0 offset=60
  local.get $0
  f32.const 0
  f32.store $0 offset=64
  local.get $0
  f32.const 0
  f32.store $0 offset=68
  local.get $0
  f32.const 0
  f32.store $0 offset=72
  local.get $0
  f32.const 0
  f32.store $0 offset=76
  local.get $0
  f32.const 0
  f32.store $0 offset=80
  local.get $0
  f32.const 0
  f32.store $0 offset=84
  local.get $0
  f32.const 0
  f32.store $0 offset=88
  local.get $0
  f32.const 0
  f32.store $0 offset=92
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/diode/Diode> (result i32)
  i32.const 96
 )
 (func $assembly/gen/dclip/Dclip#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 12
   i32.const 61
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  i32.const 0
  i32.store $0 offset=8
  local.get $0
 )
 (func $assembly/gen/dcliplin/Dcliplin#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 20
   i32.const 62
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 0.5
  f32.store $0 offset=8
  local.get $0
  f32.const 0.5
  f32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
 )
 (func $assembly/gen/dclipexp/Dclipexp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 16
   i32.const 63
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 1
  f32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/dclipexp/Dclipexp> (result i32)
  i32.const 16
 )
 (func $assembly/gen/clamp/Clamp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 20
   i32.const 64
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const -0.5
  f32.store $0 offset=8
  local.get $0
  f32.const 0.5
  f32.store $0 offset=12
  local.get $0
  i32.const 0
  i32.store $0 offset=16
  local.get $0
 )
 (func $assembly/gen/clip/Clip#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 16
   i32.const 65
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 0.5
  f32.store $0 offset=8
  local.get $0
  i32.const 0
  i32.store $0 offset=12
  local.get $0
 )
 (func $assembly/gen/comp/Comp#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 40
   i32.const 66
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 0.699999988079071
  f32.store $0 offset=8
  local.get $0
  f32.const 0.3333333432674408
  f32.store $0 offset=12
  local.get $0
  f32.const 0.009999999776482582
  f32.store $0 offset=16
  local.get $0
  f32.const 0.009999999776482582
  f32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  i32.store $0 offset=28
  local.get $0
  f32.const 0
  f32.store $0 offset=32
  local.get $0
  f32.const 1
  f32.store $0 offset=36
  local.get $0
 )
 (func $assembly/gen/sample/Sample#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 52
   i32.const 68
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/gen/Gen#constructor
  local.tee $0
  f32.const 0
  f32.store $0 offset=8
  local.get $0
  f32.const 0
  f32.store $0 offset=12
  local.get $0
  i32.const 65536
  call $~lib/staticarray/StaticArray<f32>#constructor
  i32.store $0 offset=16
  local.get $0
  i32.const 65535
  i32.store $0 offset=20
  local.get $0
  i32.const 0
  i32.store $0 offset=24
  local.get $0
  i32.const 0
  i32.store $0 offset=28
  local.get $0
  f64.const -1
  f64.store $0 offset=32
  local.get $0
  f64.const 0
  f64.store $0 offset=40
  local.get $0
  f32.const -1
  f32.store $0 offset=48
  local.get $0
 )
 (func $assembly/gen/freesound/Freesound#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 56
   i32.const 67
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/sample/Sample#constructor
  local.tee $0
  f32.const 0
  f32.store $0 offset=52
  local.get $0
 )
 (func $assembly/util/getObjectSize<assembly/gen/freesound/Freesound> (result i32)
  i32.const 56
 )
 (func $assembly/gen/freesound/Freesound#get:id (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=52
 )
 (func $assembly/gen/say/Say#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 56
   i32.const 69
   call $~lib/rt/stub/__new
  end
  local.get $1
  call $assembly/gen/sample/Sample#constructor
  local.tee $0
  f32.const 0
  f32.store $0 offset=52
  local.get $0
 )
 (func $assembly/gen/gen/Gen#_update (param $0 i32)
  nop
 )
 (func $assembly/gen/gen/Gen#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  nop
 )
 (func $~lib/math/NativeMathf.pow (param $0 f32) (param $1 f32) (result f32)
  (local $2 i32)
  (local $3 f64)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 f64)
  local.get $1
  f32.abs
  f32.const 2
  f32.le
  if
   local.get $1
   f32.const 2
   f32.eq
   if
    local.get $0
    local.get $0
    f32.mul
    return
   end
   local.get $1
   f32.const 0.5
   f32.eq
   if
    local.get $0
    f32.sqrt
    f32.abs
    f32.const inf
    local.get $0
    f32.const -inf
    f32.ne
    select
    return
   end
   local.get $1
   f32.const -1
   f32.eq
   if
    f32.const 1
    local.get $0
    f32.div
    return
   end
   local.get $1
   f32.const 1
   f32.eq
   if
    local.get $0
    return
   end
   local.get $1
   f32.const 0
   f32.eq
   if
    f32.const 1
    return
   end
  end
  block $~lib/util/math/powf_lut|inlined.0 (result f32)
   local.get $1
   i32.reinterpret_f32
   local.tee $6
   i32.const 1
   i32.shl
   i32.const 1
   i32.sub
   i32.const -16777217
   i32.ge_u
   local.tee $7
   local.get $0
   i32.reinterpret_f32
   local.tee $2
   i32.const 8388608
   i32.sub
   i32.const 2130706432
   i32.ge_u
   i32.or
   if
    local.get $7
    if
     f32.const 1
     local.get $6
     i32.const 1
     i32.shl
     i32.eqz
     br_if $~lib/util/math/powf_lut|inlined.0
     drop
     f32.const nan:0x400000
     local.get $2
     i32.const 1065353216
     i32.eq
     br_if $~lib/util/math/powf_lut|inlined.0
     drop
     local.get $0
     local.get $1
     f32.add
     local.get $6
     i32.const 1
     i32.shl
     i32.const -16777216
     i32.gt_u
     local.get $2
     i32.const 1
     i32.shl
     i32.const -16777216
     i32.gt_u
     i32.or
     br_if $~lib/util/math/powf_lut|inlined.0
     drop
     f32.const nan:0x400000
     local.get $2
     i32.const 1
     i32.shl
     i32.const 2130706432
     i32.eq
     br_if $~lib/util/math/powf_lut|inlined.0
     drop
     f32.const 0
     local.get $6
     i32.const 31
     i32.shr_u
     i32.eqz
     local.get $2
     i32.const 1
     i32.shl
     i32.const 2130706432
     i32.lt_u
     i32.eq
     br_if $~lib/util/math/powf_lut|inlined.0
     drop
     local.get $1
     local.get $1
     f32.mul
     br $~lib/util/math/powf_lut|inlined.0
    end
    local.get $2
    i32.const 1
    i32.shl
    i32.const 1
    i32.sub
    i32.const -16777217
    i32.ge_u
    if
     f32.const 1
     local.get $0
     local.get $0
     f32.mul
     local.tee $0
     f32.neg
     local.get $0
     local.get $2
     i32.const 31
     i32.shr_u
     if (result i32)
      block $~lib/util/math/checkintf|inlined.0 (result i32)
       i32.const 0
       local.get $6
       i32.const 23
       i32.shr_u
       i32.const 255
       i32.and
       local.tee $2
       i32.const 127
       i32.lt_u
       br_if $~lib/util/math/checkintf|inlined.0
       drop
       i32.const 2
       local.get $2
       i32.const 150
       i32.gt_u
       br_if $~lib/util/math/checkintf|inlined.0
       drop
       i32.const 0
       local.get $6
       i32.const 1
       i32.const 150
       local.get $2
       i32.sub
       i32.shl
       local.tee $2
       i32.const 1
       i32.sub
       i32.and
       br_if $~lib/util/math/checkintf|inlined.0
       drop
       i32.const 1
       local.get $2
       local.get $6
       i32.and
       br_if $~lib/util/math/checkintf|inlined.0
       drop
       i32.const 2
      end
      i32.const 1
      i32.eq
     else
      i32.const 0
     end
     select
     local.tee $0
     f32.div
     local.get $0
     local.get $6
     i32.const 0
     i32.lt_s
     select
     br $~lib/util/math/powf_lut|inlined.0
    end
    local.get $0
    f32.const 8388608
    f32.mul
    i32.reinterpret_f32
    i32.const 2147483647
    i32.and
    i32.const 192937984
    i32.sub
    local.get $2
    i32.const 0
    i32.lt_s
    if
     block $~lib/util/math/checkintf|inlined.1 (result i32)
      i32.const 0
      local.get $6
      i32.const 23
      i32.shr_u
      i32.const 255
      i32.and
      local.tee $4
      i32.const 127
      i32.lt_u
      br_if $~lib/util/math/checkintf|inlined.1
      drop
      i32.const 2
      local.get $4
      i32.const 150
      i32.gt_u
      br_if $~lib/util/math/checkintf|inlined.1
      drop
      i32.const 0
      local.get $6
      i32.const 1
      i32.const 150
      local.get $4
      i32.sub
      i32.shl
      local.tee $4
      i32.const 1
      i32.sub
      i32.and
      br_if $~lib/util/math/checkintf|inlined.1
      drop
      i32.const 1
      local.get $4
      local.get $6
      i32.and
      br_if $~lib/util/math/checkintf|inlined.1
      drop
      i32.const 2
     end
     local.tee $4
     i32.eqz
     if
      local.get $0
      local.get $0
      f32.sub
      local.tee $0
      local.get $0
      f32.div
      br $~lib/util/math/powf_lut|inlined.0
     end
     i32.const 65536
     i32.const 0
     local.get $4
     i32.const 1
     i32.eq
     select
     local.set $4
     local.get $2
     i32.const 2147483647
     i32.and
     local.set $2
    end
    local.get $2
    local.get $2
    i32.const 8388608
    i32.lt_u
    select
    local.set $2
   end
   local.get $2
   local.get $2
   i32.const 1060306944
   i32.sub
   local.tee $2
   i32.const -8388608
   i32.and
   local.tee $6
   i32.sub
   f32.reinterpret_i32
   f64.promote_f32
   local.get $2
   i32.const 19
   i32.shr_u
   i32.const 15
   i32.and
   i32.const 4
   i32.shl
   i32.const 1054448
   i32.add
   local.tee $2
   f64.load $0
   f64.mul
   f64.const -1
   f64.add
   local.tee $3
   local.get $3
   f64.mul
   local.set $8
   local.get $1
   f64.promote_f32
   local.get $3
   f64.const 0.288457581109214
   f64.mul
   f64.const -0.36092606229713164
   f64.add
   local.get $8
   local.get $8
   f64.mul
   f64.mul
   local.get $3
   f64.const 1.4426950408774342
   f64.mul
   local.get $2
   f64.load $0 offset=8
   local.get $6
   i32.const 23
   i32.shr_s
   f64.convert_i32_s
   f64.add
   f64.add
   local.get $3
   f64.const 0.480898481472577
   f64.mul
   f64.const -0.7213474675006291
   f64.add
   local.get $8
   f64.mul
   f64.add
   f64.add
   f64.mul
   local.tee $3
   i64.reinterpret_f64
   i64.const 47
   i64.shr_u
   i64.const 65535
   i64.and
   i64.const 32959
   i64.ge_u
   if
    f32.const -1584563250285286751870879e5
    f32.const 1584563250285286751870879e5
    local.get $4
    select
    f32.const 1584563250285286751870879e5
    f32.mul
    local.get $3
    f64.const 127.99999995700433
    f64.gt
    br_if $~lib/util/math/powf_lut|inlined.0
    drop
    f32.const -2.524354896707238e-29
    f32.const 2.524354896707238e-29
    local.get $4
    select
    f32.const 2.524354896707238e-29
    f32.mul
    local.get $3
    f64.const -150
    f64.le
    br_if $~lib/util/math/powf_lut|inlined.0
    drop
   end
   local.get $3
   f64.const 211106232532992
   f64.add
   local.tee $8
   i64.reinterpret_f64
   local.set $5
   local.get $3
   local.get $8
   f64.const -211106232532992
   f64.add
   f64.sub
   local.tee $3
   f64.const 0.6931471806916203
   f64.mul
   f64.const 1
   f64.add
   local.get $3
   f64.const 0.05550361559341535
   f64.mul
   f64.const 0.2402284522445722
   f64.add
   local.get $3
   local.get $3
   f64.mul
   f64.mul
   f64.add
   local.get $5
   i32.wrap_i64
   i32.const 31
   i32.and
   i32.const 3
   i32.shl
   i32.const 1054704
   i32.add
   i64.load $0
   local.get $5
   local.get $4
   i64.extend_i32_u
   i64.add
   i64.const 47
   i64.shl
   i64.add
   f64.reinterpret_i64
   f64.mul
   f32.demote_f64
  end
 )
 (func $assembly/math/pow_audio_scalar (param $0 i32) (param $1 f32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.add
  local.set $0
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    f32.load $0
    local.get $1
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.set $4
    local.get $2
    i32.const 16
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/pow_scalar_audio (param $0 f32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 2
  i32.shl
  local.tee $5
  local.get $1
  i32.add
  local.set $1
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $0
    local.get $1
    f32.load $0
    call $~lib/math/NativeMathf.pow
    f32.store $0
    local.get $4
    i32.const 4
    i32.add
    local.set $4
    local.get $2
    i32.const 16
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/pow_scalar_scalar (param $0 f32) (param $1 f32) (result f32)
  local.get $0
  local.get $1
  call $~lib/math/NativeMathf.pow
 )
 (func $assembly/math/mul_audio_scalar (param $0 i32) (param $1 f32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 v128)
  (local $6 i32)
  local.get $1
  f32x4.splat
  local.set $5
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.add
  local.set $0
  local.get $4
  local.get $6
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.mul
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/mul_audio_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.add
  local.set $0
  local.get $1
  local.get $5
  i32.add
  local.set $1
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.mul
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/div_audio_scalar (param $0 i32) (param $1 f32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 v128)
  (local $6 i32)
  local.get $1
  f32x4.splat
  local.set $5
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.add
  local.set $0
  local.get $4
  local.get $6
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.div
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/div_scalar_audio (param $0 f32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 v128)
  (local $6 i32)
  local.get $0
  f32x4.splat
  local.set $5
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $1
  i32.add
  local.set $1
  local.get $4
  local.get $6
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $5
    local.get $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $5
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.div
    v128.store $0
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/add_audio_scalar (param $0 i32) (param $1 f32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 v128)
  (local $6 i32)
  local.get $1
  f32x4.splat
  local.set $5
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.add
  local.set $0
  local.get $4
  local.get $6
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.add
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/sub_audio_scalar (param $0 i32) (param $1 f32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 v128)
  (local $6 i32)
  local.get $1
  f32x4.splat
  local.set $5
  local.get $2
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.add
  local.set $0
  local.get $4
  local.get $6
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $5
    f32x4.sub
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/sub_audio_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $2
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.add
  local.set $0
  local.get $1
  local.get $5
  i32.add
  local.set $1
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $4
    local.get $0
    v128.load $0
    local.get $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $1
    i32.const 16
    i32.add
    local.tee $1
    v128.load $0
    f32x4.sub
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $2
    i32.const -64
    i32.sub
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/not_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  local.get $1
  i32.const 2
  i32.shl
  local.tee $4
  local.get $0
  i32.add
  local.set $0
  local.get $3
  local.get $4
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $3
    local.get $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.mul
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/math/to_audio_scalar (param $0 f32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 v128)
  local.get $0
  f32x4.splat
  local.set $4
  local.get $3
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $4
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/join/join21g (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 f32) (param $6 f32)
  (local $7 v128)
  (local $8 v128)
  (local $9 i32)
  local.get $5
  f32x4.splat
  local.set $7
  local.get $6
  f32x4.splat
  local.set $8
  local.get $0
  i32.const 2
  i32.shl
  local.tee $9
  local.get $2
  i32.add
  local.set $2
  local.get $3
  local.get $9
  i32.add
  local.set $3
  local.get $4
  local.get $9
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $4
    local.get $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $7
    f32x4.mul
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    local.get $8
    f32x4.mul
    f32x4.add
    v128.store $0
    local.get $2
    i32.const 16
    i32.add
    local.set $2
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $0
    i32.const -64
    i32.sub
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/join/join21 (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 2
  i32.shl
  local.tee $5
  local.get $2
  i32.add
  local.set $2
  local.get $3
  local.get $5
  i32.add
  local.set $3
  local.get $4
  local.get $5
  i32.add
  local.set $4
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $4
    local.get $2
    v128.load $0
    local.get $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $4
    i32.const 16
    i32.add
    local.tee $4
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    v128.load $0
    f32x4.add
    v128.store $0
    local.get $2
    i32.const 16
    i32.add
    local.set $2
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $4
    i32.const 16
    i32.add
    local.set $4
    local.get $0
    i32.const -64
    i32.sub
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/dc-bias/dcBias (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  local.get $0
  local.get $1
  local.get $0
  i32.sub
  i32.const 2
  i32.shl
  i32.add
  local.set $1
  local.get $2
  local.get $0
  i32.const 2
  i32.shl
  i32.add
  local.set $2
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $4
    local.get $3
    f32.sub
    local.tee $5
    f32.abs
    local.tee $6
    f32.const 0.6000000238418579
    f32.gt
    if
     local.get $2
     local.get $4
     local.tee $3
     f32.const 1
     f32.const 0
     f32.const 0.6000000238418579
     local.get $6
     f32.sub
     f32.const 0.6000000238418579
     f32.div
     local.tee $4
     local.get $4
     f32.const 0
     f32.lt
     select
     local.get $4
     f32.const 1
     f32.gt
     select
     local.get $5
     f32.mul
     f32.add
     f32.store $0
    else
     local.get $4
     local.set $3
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    br $for-loop|0
   end
  end
 )
 (func $assembly/graph/rms/rms (param $0 i32) (param $1 i32) (param $2 i32) (result f32)
  (local $3 v128)
  (local $4 f32)
  local.get $1
  local.get $0
  i32.sub
  f32.convert_i32_u
  local.set $4
  local.get $2
  local.get $0
  i32.const 2
  i32.shl
  i32.add
  local.set $2
  loop $for-loop|0
   local.get $0
   local.get $1
   i32.lt_u
   if
    local.get $3
    local.get $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.get $2
    i32.const 16
    i32.add
    local.tee $2
    v128.load $0
    local.tee $3
    local.get $3
    f32x4.mul
    f32x4.add
    local.set $3
    local.get $2
    i32.const 16
    i32.add
    local.set $2
    local.get $0
    i32.const -64
    i32.sub
    local.set $0
    br $for-loop|0
   end
  end
  local.get $3
  f32x4.extract_lane 0
  local.get $3
  f32x4.extract_lane 1
  f32.add
  local.get $3
  f32x4.extract_lane 2
  f32.add
  local.get $3
  f32x4.extract_lane 3
  f32.add
  local.get $4
  f32.div
  f32.sqrt
 )
 (func $assembly/index/preventTreeShaking (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/core/engine/Core#constructor
  call $assembly/core/engine/Engine#constructor
  local.tee $2
  i32.load $0 offset=20
  drop
  local.get $2
  i32.load $0
  drop
  i32.const 1048640
  i32.const 0
  call $~lib/staticarray/StaticArray<f32>#constructor
  call $~lib/array/Array<~lib/staticarray/StaticArray<f32>>#push
  local.get $2
  i32.load $0 offset=12
  f64.const 0
  f64.store $0
  local.get $2
  i32.load $0 offset=16
  local.tee $1
  i32.const 0
  i32.store $0 offset=20
  local.get $1
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $1
  i32.load $0 offset=12
  i32.const 0
  call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__get
  local.tee $3
  i32.load $0 offset=8
  local.tee $4
  call $assembly/core/runner/Runner#fill
  local.get $1
  f64.const 0
  f64.const 0
  f64.const 0
  i32.const 0
  i32.const 0
  local.get $4
  call $assembly/core/runner/Runner#process
  local.get $4
  i32.load $0
  drop
  local.get $4
  i32.load $0 offset=4
  drop
  local.get $4
  i32.load $0 offset=8
  drop
  local.get $3
  i32.const 0
  i32.store $0 offset=12
  local.get $3
  i32.const 0
  i32.store $0 offset=16
  local.get $3
  i32.const 0
  i32.store $0 offset=20
  local.get $1
  i32.load $0 offset=4
  i32.const 0
  call $~lib/staticarray/StaticArray<assembly/core/runner/Bar|null>#__get
  local.tee $4
  if
   local.get $4
   i32.load $0 offset=8
   i32.const 0
   local.get $3
   call $~lib/staticarray/StaticArray<~lib/staticarray/StaticArray<f32>>#__set
   local.get $4
   i32.const 3
   i32.store $0
   local.get $4
   i32.const 0
   i32.store $0 offset=4
  end
  local.get $1
  i32.load $0 offset=20
  drop
  local.get $1
  local.get $4
  i32.store $0 offset=20
  local.get $1
  i32.const 0
  i32.store $0 offset=20
  i32.const 8
  i32.const 22
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/gen/Gen#constructor
  i32.const 8
  call $assembly/util/cloneI32
  drop
  i32.const 40
  i32.const 23
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/osc/Osc#constructor
  f32.const 0
  f32.store $0 offset=12
  i32.const 40
  i32.const 25
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/osc/Osc#constructor
  drop
  i32.const 44
  i32.const 26
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/aosc/AOsc#constructor
  drop
  i32.const 44
  i32.const 28
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/aosc/AOsc#constructor
  drop
  i32.const 44
  i32.const 29
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/aosc/AOsc#constructor
  drop
  i32.const 44
  i32.const 30
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/aosc/AOsc#constructor
  drop
  i32.const 40
  i32.const 31
  call $~lib/rt/stub/__new
  local.get $2
  call $assembly/gen/osc/Osc#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/dc/Dc#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/delay/Delay#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/tap/Tap#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/lp/Lp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/rate/Rate#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/blp/Blp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bhp/Bhp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bbp/Bbp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bno/Bno#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bpk/Bpk#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bap/Bap#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bls/Bls#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/bhs/Bhs#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/slp/Slp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/shp/Shp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/sbp/Sbp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/sap/Sap#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/sno/Sno#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/spk/Spk#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/mlp/Mlp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/mhp/Mhp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/daverb/Daverb#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/tanh/Tanh#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/diode/Diode#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/dclip/Dclip#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/dcliplin/Dcliplin#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/dclipexp/Dclipexp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/clamp/Clamp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/clip/Clip#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/comp/Comp#constructor
  drop
  i32.const 0
  local.get $2
  call $assembly/gen/freesound/Freesound#constructor
  f32.load $0 offset=52
  call $assembly/env/logf
  i32.const 0
  local.get $2
  call $assembly/gen/say/Say#constructor
  drop
  local.get $0
  call $assembly/gen/gen/Gen#_update@override
  local.get $0
  i32.const 8
  i32.sub
  i32.load $0
  i32.const 33
  i32.eq
  if
   i32.const 65536
   local.get $0
   i32.load $0 offset=20
   local.tee $1
   i32.const 20
   i32.sub
   i32.load $0 offset=16
   i32.const 2
   i32.shr_u
   local.tee $2
   local.get $2
   i32.const 65536
   i32.gt_u
   select
   local.tee $2
   i32.const 0
   i32.gt_s
   if
    local.get $1
    i32.const 0
    local.get $2
    i32.const 2
    i32.shl
    memory.fill $0
   end
  end
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/gen/gen/Gen#_audio@override
  i32.const 0
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/pow_audio_scalar
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/pow_scalar_audio
  f32.const 0
  f32.const 0
  call $~lib/math/NativeMathf.pow
  drop
  i32.const 0
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/mul_audio_scalar
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/mul_audio_audio
  i32.const 0
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/div_audio_scalar
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/div_scalar_audio
  i32.const 0
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/add_audio_scalar
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/add_audio_audio
  i32.const 0
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/sub_audio_scalar
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/sub_audio_audio
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/not_audio
  f32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/math/to_audio_scalar
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/graph/fade/fadeIn
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/graph/fade/fadeOut
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  f32.const 0
  f32.const 0
  call $assembly/graph/join/join21g
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/graph/join/join21
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/graph/dc-bias/dcBias
  i32.const 0
  i32.const 0
  i32.const 0
  call $assembly/graph/rms/rms
  drop
  i32.const 0
  i32.const 0
  i32.const 0
  memory.copy $0 $0
  i32.const 0
  i32.const 0
  i32.const 0
  memory.copy $0 $0
 )
 (func $assembly/bench/bench-audio/benchAudio (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.gt_u
   if
    local.get $0
    i32.const 0
    i32.const 2048
    local.get $1
    call $assembly/gen/gen/Gen#_audio@override
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/gen/Gen#get:gain (param $0 i32) (result f32)
  local.get $0
  f32.load $0
 )
 (func $assembly/bench/bench-audio/benchAudioGain (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.gt_u
   if
    local.get $0
    i32.const 0
    i32.const 2048
    local.get $1
    call $assembly/gen/gen/Gen#_audio@override
    local.get $1
    local.get $0
    f32.load $0
    i32.const 0
    i32.const 2048
    local.get $1
    call $assembly/math/mul_audio_scalar
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
 )
 (func $assembly/bench/bench-audio/benchAudioTwo (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32)
  (local $6 i32)
  loop $for-loop|0
   local.get $5
   local.get $6
   i32.gt_u
   if
    local.get $0
    i32.const 0
    i32.const 2048
    local.get $2
    call $assembly/gen/gen/Gen#_audio@override
    local.get $1
    i32.const 0
    i32.const 2048
    local.get $3
    call $assembly/gen/gen/Gen#_audio@override
    i32.const 0
    i32.const 2048
    local.get $2
    local.get $3
    local.get $4
    f32.const 0.5
    f32.const 0.5
    call $assembly/graph/join/join21g
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/bap/Bap#get:cut (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=108
 )
 (func $assembly/gen/bap/Bap#get:q (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=112
 )
 (func $assembly/gen/biquad/Biquad#get:_params_freq (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=96
 )
 (func $~lib/array/Array<f32>#__get (param $0 i32) (param $1 i32) (result f32)
  local.get $1
  local.get $0
  i32.load $0 offset=12
  i32.ge_u
  if
   i32.const 1051072
   i32.const 1053872
   i32.const 114
   i32.const 42
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.load $0 offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  f32.load $0
 )
 (func $assembly/util/clamp (param $0 f32) (param $1 f32) (param $2 f32) (param $3 f32) (result f32)
  local.get $3
  local.get $3
  f32.sub
  f32.const 0
  f32.ne
  if
   local.get $2
   return
  end
  local.get $1
  local.get $0
  local.get $3
  local.get $0
  local.get $3
  f32.gt
  select
  local.tee $0
  local.get $0
  local.get $1
  f32.gt
  select
 )
 (func $assembly/util/paramClamp (param $0 i32) (param $1 f32) (result f32)
  (local $2 f32)
  (local $3 f32)
  block $__inlined_func$assembly/util/clamp (result f32)
   local.get $0
   i32.const 0
   call $~lib/array/Array<f32>#__get
   local.set $2
   local.get $0
   i32.const 1
   call $~lib/array/Array<f32>#__get
   local.set $3
   local.get $0
   i32.const 2
   call $~lib/array/Array<f32>#__get
   local.get $1
   local.get $1
   f32.sub
   f32.const 0
   f32.ne
   br_if $__inlined_func$assembly/util/clamp
   drop
   local.get $3
   local.get $2
   local.get $1
   local.get $1
   local.get $2
   f32.lt
   select
   local.tee $1
   local.get $1
   local.get $3
   f32.gt
   select
  end
 )
 (func $assembly/gen/biquad/Biquad#get:_params_Q (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=100
 )
 (func $assembly/gen/biquad/Biquad#get:_a0 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=48
 )
 (func $assembly/gen/biquad/Biquad#get:_b0 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=72
 )
 (func $assembly/gen/biquad/Biquad#get:_b1 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=80
 )
 (func $assembly/gen/biquad/Biquad#get:_b2 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=88
 )
 (func $assembly/gen/biquad/Biquad#get:_a1 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=56
 )
 (func $assembly/gen/biquad/Biquad#get:_a2 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=64
 )
 (func $assembly/gen/bap/Bap#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f64)
  (local $5 f64)
  block $assembly/gen/biquad/Biquad#_validate|inlined.0 (result i32)
   local.get $0
   f32.load $0 offset=112
   local.set $2
   i32.const 0
   local.get $0
   f32.load $0 offset=108
   local.tee $3
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.0
   drop
   i32.const 0
   local.get $3
   local.get $3
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.0
   drop
   i32.const 0
   local.get $2
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.0
   drop
   i32.const 0
   local.get $2
   local.get $2
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.0
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $3
   call $assembly/util/paramClamp
   local.set $3
   local.get $0
   i32.load $0 offset=100
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $3
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $4
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $5
   local.get $0
   f64.const 1
   local.get $4
   local.get $2
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $4
   f64.sub
   local.tee $1
   f64.store $0 offset=72
   local.get $0
   local.get $5
   f64.const -2
   f64.mul
   local.tee $5
   f64.store $0 offset=80
   local.get $0
   local.get $4
   f64.const 1
   f64.add
   local.tee $4
   f64.store $0 offset=88
   local.get $0
   local.get $4
   f64.store $0 offset=48
   local.get $0
   local.get $5
   f64.store $0 offset=56
   local.get $0
   local.get $1
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bbp/Bbp#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f64)
  block $assembly/gen/biquad/Biquad#_validate|inlined.1 (result i32)
   local.get $0
   f32.load $0 offset=112
   local.set $2
   i32.const 0
   local.get $0
   f32.load $0 offset=108
   local.tee $3
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.1
   drop
   i32.const 0
   local.get $3
   local.get $3
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.1
   drop
   i32.const 0
   local.get $2
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.1
   drop
   i32.const 0
   local.get $2
   local.get $2
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.1
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $3
   call $assembly/util/paramClamp
   local.set $3
   local.get $0
   i32.load $0 offset=100
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $3
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $4
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $1
   local.get $0
   local.get $4
   local.get $2
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $4
   f64.store $0 offset=72
   local.get $0
   f64.const 0
   f64.store $0 offset=80
   local.get $0
   local.get $4
   f64.neg
   f64.store $0 offset=88
   local.get $0
   local.get $4
   f64.const 1
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $1
   f64.const -2
   f64.mul
   f64.store $0 offset=56
   local.get $0
   f64.const 1
   local.get $4
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bhp/Bhp#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f64)
  (local $4 f32)
  (local $5 f64)
  (local $6 f64)
  block $assembly/gen/biquad/Biquad#_validate|inlined.2 (result i32)
   local.get $0
   f32.load $0 offset=112
   local.set $2
   i32.const 0
   local.get $0
   f32.load $0 offset=108
   local.tee $4
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.2
   drop
   i32.const 0
   local.get $4
   local.get $4
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.2
   drop
   i32.const 0
   local.get $2
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.2
   drop
   i32.const 0
   local.get $2
   local.get $2
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.2
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $4
   call $assembly/util/paramClamp
   local.set $4
   local.get $0
   i32.load $0 offset=100
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $4
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $5
   local.get $0
   local.get $1
   call $~lib/math/NativeMath.cos
   local.tee $1
   f64.const 1
   f64.add
   local.tee $3
   f64.const 0.5
   f64.mul
   local.tee $6
   f64.store $0 offset=72
   local.get $0
   local.get $3
   f64.neg
   f64.store $0 offset=80
   local.get $0
   local.get $6
   f64.store $0 offset=88
   local.get $0
   local.get $5
   local.get $2
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $3
   f64.const 1
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $1
   f64.const -2
   f64.mul
   f64.store $0 offset=56
   local.get $0
   f64.const 1
   local.get $3
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bhs/Bhs#get:amt (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=116
 )
 (func $assembly/gen/biquad/Biquad#get:_params_gain (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=104
 )
 (func $~lib/math/NativeMath.pow (param $0 f64) (result f64)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 f64)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  (local $8 i64)
  (local $9 f64)
  (local $10 f64)
  (local $11 f64)
  (local $12 f64)
  (local $13 f64)
  local.get $0
  f64.abs
  f64.const 2
  f64.le
  if
   local.get $0
   f64.const 2
   f64.eq
   if
    f64.const 100
    return
   end
   local.get $0
   f64.const 0.5
   f64.eq
   if
    f64.const 3.1622776601683795
    return
   end
   local.get $0
   f64.const -1
   f64.eq
   if
    f64.const 0.1
    return
   end
   local.get $0
   f64.const 1
   f64.eq
   if
    f64.const 10
    return
   end
   local.get $0
   f64.const 0
   f64.eq
   if
    f64.const 1
    return
   end
  end
  block $~lib/util/math/pow_lut|inlined.0 (result f64)
   local.get $0
   i64.reinterpret_f64
   local.tee $2
   i64.const 52
   i64.shr_u
   local.tee $8
   i64.const 2047
   i64.and
   i64.const 958
   i64.sub
   i64.const 128
   i64.ge_u
   if
    local.get $2
    i64.const 1
    i64.shl
    i64.const 1
    i64.sub
    i64.const -9007199254740993
    i64.ge_u
    if
     f64.const 1
     local.get $2
     i64.const 1
     i64.shl
     i64.eqz
     br_if $~lib/util/math/pow_lut|inlined.0
     drop
     local.get $0
     f64.const 10
     f64.add
     local.get $2
     i64.const 1
     i64.shl
     i64.const -9007199254740992
     i64.gt_u
     br_if $~lib/util/math/pow_lut|inlined.0
     drop
     f64.const 0
     local.get $2
     i64.const 63
     i64.shr_u
     i32.wrap_i64
     br_if $~lib/util/math/pow_lut|inlined.0
     drop
     local.get $0
     local.get $0
     f64.mul
     br $~lib/util/math/pow_lut|inlined.0
    end
    local.get $8
    i64.const 2047
    i64.and
    i64.const 958
    i64.sub
    i64.const 128
    i64.ge_u
    if
     f64.const 1
     local.get $8
     i64.const 2047
     i64.and
     i64.const 958
     i64.lt_u
     br_if $~lib/util/math/pow_lut|inlined.0
     drop
     f64.const inf
     f64.const 0
     local.get $8
     i64.const 2048
     i64.lt_u
     select
     br $~lib/util/math/pow_lut|inlined.0
    end
   end
   i32.const 1058400
   f64.load $0
   f64.const 2.079441541679671
   f64.add
   local.tee $9
   i32.const 1058384
   f64.load $0
   local.tee $4
   f64.const 1.25
   f64.mul
   f64.const -1
   f64.add
   local.tee $7
   local.get $4
   f64.const 0
   f64.mul
   local.tee $10
   f64.add
   local.tee $4
   f64.add
   local.set $5
   local.get $4
   local.get $4
   f64.const -0.5
   f64.mul
   local.tee $11
   f64.mul
   local.set $6
   local.get $5
   local.get $7
   local.get $7
   f64.const -0.5
   f64.mul
   local.tee $12
   f64.mul
   local.tee $13
   f64.add
   local.tee $7
   local.get $7
   i32.const 1058408
   f64.load $0
   f64.const 1.6493769056125113e-13
   f64.add
   local.get $9
   local.get $5
   f64.sub
   local.get $4
   f64.add
   f64.add
   local.get $10
   local.get $11
   local.get $12
   f64.add
   f64.mul
   f64.add
   local.get $5
   local.get $7
   f64.sub
   local.get $13
   f64.add
   f64.add
   local.get $4
   local.get $6
   f64.mul
   local.get $4
   f64.const 0.5000000000000007
   f64.mul
   f64.const -0.6666666666666679
   f64.add
   local.get $6
   local.get $4
   f64.const -0.6666666663487739
   f64.mul
   f64.const 0.7999999995323976
   f64.add
   local.get $6
   local.get $4
   f64.const 1.0000415263675542
   f64.mul
   f64.const -1.142909628459501
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   local.tee $4
   f64.add
   local.tee $5
   f64.sub
   local.get $4
   f64.add
   global.set $~lib/util/math/log_tail
   block $~lib/util/math/exp_inline|inlined.0 (result f64)
    local.get $2
    i64.const -134217728
    i64.and
    f64.reinterpret_i64
    local.tee $4
    local.get $5
    i64.reinterpret_f64
    i64.const -134217728
    i64.and
    f64.reinterpret_i64
    local.tee $6
    f64.mul
    local.tee $7
    i64.reinterpret_f64
    local.tee $2
    i64.const 52
    i64.shr_u
    i32.wrap_i64
    i32.const 2047
    i32.and
    local.tee $1
    i32.const 969
    i32.sub
    i32.const 63
    i32.ge_u
    if
     f64.const 1
     local.get $1
     i32.const 969
     i32.sub
     i32.const -2147483648
     i32.ge_u
     br_if $~lib/util/math/exp_inline|inlined.0
     drop
     f64.const 0
     f64.const inf
     local.get $2
     i64.const 0
     i64.lt_s
     select
     local.get $1
     i32.const 1033
     i32.ge_u
     br_if $~lib/util/math/exp_inline|inlined.0
     drop
     i32.const 0
     local.set $1
    end
    local.get $7
    f64.const 184.6649652337873
    f64.mul
    f64.const 6755399441055744
    f64.add
    local.tee $9
    i64.reinterpret_f64
    local.tee $2
    i64.const 127
    i64.and
    i64.const 1
    i64.shl
    i32.wrap_i64
    i32.const 3
    i32.shl
    i32.const 1051728
    i32.add
    local.tee $3
    i64.load $0 offset=8
    local.get $2
    i64.const 45
    i64.shl
    i64.add
    local.set $8
    local.get $7
    local.get $9
    f64.const -6755399441055744
    f64.add
    local.tee $7
    f64.const -0.005415212348111709
    f64.mul
    f64.add
    local.get $7
    f64.const -1.2864023111638346e-14
    f64.mul
    f64.add
    local.get $0
    local.get $4
    f64.sub
    local.get $6
    f64.mul
    local.get $0
    local.get $5
    local.get $6
    f64.sub
    global.get $~lib/util/math/log_tail
    f64.add
    f64.mul
    f64.add
    f64.add
    local.tee $0
    local.get $0
    f64.mul
    local.set $4
    local.get $3
    f64.load $0
    local.get $0
    f64.add
    local.get $4
    local.get $0
    f64.const 0.16666666666665886
    f64.mul
    f64.const 0.49999999999996786
    f64.add
    f64.mul
    f64.add
    local.get $4
    local.get $4
    f64.mul
    local.get $0
    f64.const 0.008333335853059549
    f64.mul
    f64.const 0.0416666808410674
    f64.add
    f64.mul
    f64.add
    local.set $0
    local.get $1
    i32.eqz
    if
     block $~lib/util/math/specialcase|inlined.1 (result f64)
      local.get $2
      i64.const 2147483648
      i64.and
      i64.eqz
      if
       local.get $8
       i64.const 4544132024016830464
       i64.sub
       f64.reinterpret_i64
       local.tee $4
       local.get $4
       local.get $0
       f64.mul
       f64.add
       f64.const 5486124068793688683255936e279
       f64.mul
       br $~lib/util/math/specialcase|inlined.1
      end
      local.get $8
      i64.const 4602678819172646912
      i64.add
      local.tee $2
      f64.reinterpret_i64
      local.tee $4
      local.get $4
      local.get $0
      f64.mul
      f64.add
      local.tee $5
      f64.abs
      f64.const 1
      f64.lt
      if (result f64)
       local.get $2
       i64.const -9223372036854775808
       i64.and
       f64.reinterpret_i64
       f64.const 1
       local.get $5
       f64.copysign
       local.tee $6
       local.get $5
       f64.add
       local.tee $7
       local.get $6
       local.get $7
       f64.sub
       local.get $5
       f64.add
       local.get $4
       local.get $5
       f64.sub
       local.get $4
       local.get $0
       f64.mul
       f64.add
       f64.add
       f64.add
       local.get $6
       f64.sub
       local.tee $0
       local.get $0
       f64.const 0
       f64.eq
       select
      else
       local.get $5
      end
      f64.const 2.2250738585072014e-308
      f64.mul
     end
     br $~lib/util/math/exp_inline|inlined.0
    end
    local.get $8
    f64.reinterpret_i64
    local.tee $4
    local.get $4
    local.get $0
    f64.mul
    f64.add
   end
  end
 )
 (func $assembly/gen/bhs/Bhs#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f32)
  (local $7 f32)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  block $assembly/gen/biquad/Biquad#_highshelf|inlined.0
   local.get $0
   f32.load $0 offset=116
   local.set $2
   block $assembly/gen/biquad/Biquad#_validate|inlined.3 (result i32)
    local.get $0
    f32.load $0 offset=112
    local.set $6
    i32.const 0
    local.get $0
    f32.load $0 offset=108
    local.tee $7
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.3
    drop
    i32.const 0
    local.get $7
    local.get $7
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.3
    drop
    i32.const 0
    local.get $6
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.3
    drop
    i32.const 0
    local.get $6
    local.get $6
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.3
    drop
    i32.const 1
   end
   i32.eqz
   br_if $assembly/gen/biquad/Biquad#_highshelf|inlined.0
   local.get $0
   i32.load $0 offset=96
   local.get $7
   call $assembly/util/paramClamp
   local.set $7
   local.get $0
   i32.load $0 offset=100
   local.get $6
   call $assembly/util/paramClamp
   local.set $6
   local.get $0
   i32.load $0 offset=104
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $7
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $3
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $8
   local.get $2
   f64.promote_f32
   f64.const 20
   f64.div
   call $~lib/math/NativeMath.pow
   local.tee $4
   f64.sqrt
   f64.const 2
   f64.mul
   local.get $3
   f64.const 0.5
   f64.mul
   local.get $4
   f64.const 1
   local.get $4
   f64.div
   f64.add
   f64.const 1
   local.get $6
   f64.promote_f32
   f64.div
   f64.const -1
   f64.add
   f64.mul
   f64.const 2
   f64.add
   f64.sqrt
   f64.mul
   f64.mul
   local.set $5
   local.get $0
   local.get $4
   local.get $4
   f64.const 1
   f64.add
   local.tee $9
   local.get $4
   f64.const -1
   f64.add
   local.tee $10
   local.get $8
   f64.mul
   local.tee $1
   f64.add
   local.tee $3
   local.get $5
   f64.add
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $4
   f64.const -2
   f64.mul
   local.get $10
   local.get $9
   local.get $8
   f64.mul
   local.tee $8
   f64.add
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $4
   local.get $3
   local.get $5
   f64.sub
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $9
   local.get $1
   f64.sub
   local.tee $1
   local.get $5
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $10
   local.get $8
   f64.sub
   f64.const 2
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $1
   local.get $5
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/blp/Blp#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f64)
  (local $4 f32)
  (local $5 f64)
  (local $6 f64)
  block $assembly/gen/biquad/Biquad#_validate|inlined.4 (result i32)
   local.get $0
   f32.load $0 offset=112
   local.set $2
   i32.const 0
   local.get $0
   f32.load $0 offset=108
   local.tee $4
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.4
   drop
   i32.const 0
   local.get $4
   local.get $4
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.4
   drop
   i32.const 0
   local.get $2
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.4
   drop
   i32.const 0
   local.get $2
   local.get $2
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.4
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $4
   call $assembly/util/paramClamp
   local.set $4
   local.get $0
   i32.load $0 offset=100
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $4
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $5
   local.get $0
   f64.const 1
   local.get $1
   call $~lib/math/NativeMath.cos
   local.tee $1
   f64.sub
   local.tee $3
   f64.const 0.5
   f64.mul
   local.tee $6
   f64.store $0 offset=72
   local.get $0
   local.get $3
   f64.store $0 offset=80
   local.get $0
   local.get $6
   f64.store $0 offset=88
   local.get $0
   local.get $5
   local.get $2
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $3
   f64.const 1
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $1
   f64.const -2
   f64.mul
   f64.store $0 offset=56
   local.get $0
   f64.const 1
   local.get $3
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bls/Bls#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 f32)
  (local $7 f32)
  (local $8 f64)
  (local $9 f64)
  (local $10 f64)
  block $assembly/gen/biquad/Biquad#_lowshelf|inlined.0
   local.get $0
   f32.load $0 offset=116
   local.set $2
   block $assembly/gen/biquad/Biquad#_validate|inlined.5 (result i32)
    local.get $0
    f32.load $0 offset=112
    local.set $6
    i32.const 0
    local.get $0
    f32.load $0 offset=108
    local.tee $7
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.5
    drop
    i32.const 0
    local.get $7
    local.get $7
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.5
    drop
    i32.const 0
    local.get $6
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.5
    drop
    i32.const 0
    local.get $6
    local.get $6
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.5
    drop
    i32.const 1
   end
   i32.eqz
   br_if $assembly/gen/biquad/Biquad#_lowshelf|inlined.0
   local.get $0
   i32.load $0 offset=96
   local.get $7
   call $assembly/util/paramClamp
   local.set $7
   local.get $0
   i32.load $0 offset=100
   local.get $6
   call $assembly/util/paramClamp
   local.set $6
   local.get $0
   i32.load $0 offset=104
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $7
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $3
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $8
   local.get $2
   f64.promote_f32
   f64.const 20
   f64.div
   call $~lib/math/NativeMath.pow
   local.tee $4
   f64.sqrt
   f64.const 2
   f64.mul
   local.get $3
   f64.const 0.5
   f64.mul
   local.get $4
   f64.const 1
   local.get $4
   f64.div
   f64.add
   f64.const 1
   local.get $6
   f64.promote_f32
   f64.div
   f64.const -1
   f64.add
   f64.mul
   f64.const 2
   f64.add
   f64.sqrt
   f64.mul
   f64.mul
   local.set $5
   local.get $0
   local.get $4
   local.get $4
   f64.const 1
   f64.add
   local.tee $9
   local.get $4
   f64.const -1
   f64.add
   local.tee $10
   local.get $8
   f64.mul
   local.tee $1
   f64.sub
   local.tee $3
   local.get $5
   f64.add
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $4
   local.get $4
   f64.add
   local.get $10
   local.get $9
   local.get $8
   f64.mul
   local.tee $8
   f64.sub
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $4
   local.get $3
   local.get $5
   f64.sub
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $9
   local.get $1
   f64.add
   local.tee $1
   local.get $5
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $10
   local.get $8
   f64.add
   f64.const -2
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $1
   local.get $5
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bno/Bno#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f64)
  block $assembly/gen/biquad/Biquad#_validate|inlined.6 (result i32)
   local.get $0
   f32.load $0 offset=112
   local.set $2
   i32.const 0
   local.get $0
   f32.load $0 offset=108
   local.tee $3
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.6
   drop
   i32.const 0
   local.get $3
   local.get $3
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.6
   drop
   i32.const 0
   local.get $2
   f32.const 0
   f32.le
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.6
   drop
   i32.const 0
   local.get $2
   local.get $2
   f32.ne
   br_if $assembly/gen/biquad/Biquad#_validate|inlined.6
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $3
   call $assembly/util/paramClamp
   local.set $3
   local.get $0
   i32.load $0 offset=100
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $3
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $4
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $1
   local.get $0
   f64.const 1
   f64.store $0 offset=72
   local.get $0
   local.get $1
   f64.const -2
   f64.mul
   local.tee $1
   f64.store $0 offset=80
   local.get $0
   f64.const 1
   f64.store $0 offset=88
   local.get $0
   local.get $4
   local.get $2
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $4
   f64.const 1
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $1
   f64.store $0 offset=56
   local.get $0
   f64.const 1
   local.get $4
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/bpk/Bpk#_update (param $0 i32)
  (local $1 f64)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  block $assembly/gen/biquad/Biquad#_peak|inlined.0
   local.get $0
   f32.load $0 offset=116
   local.set $2
   block $assembly/gen/biquad/Biquad#_validate|inlined.7 (result i32)
    local.get $0
    f32.load $0 offset=112
    local.set $3
    i32.const 0
    local.get $0
    f32.load $0 offset=108
    local.tee $4
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.7
    drop
    i32.const 0
    local.get $4
    local.get $4
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.7
    drop
    i32.const 0
    local.get $3
    f32.const 0
    f32.le
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.7
    drop
    i32.const 0
    local.get $3
    local.get $3
    f32.ne
    br_if $assembly/gen/biquad/Biquad#_validate|inlined.7
    drop
    i32.const 1
   end
   i32.eqz
   br_if $assembly/gen/biquad/Biquad#_peak|inlined.0
   local.get $0
   i32.load $0 offset=96
   local.get $4
   call $assembly/util/paramClamp
   local.set $4
   local.get $0
   i32.load $0 offset=100
   local.get $3
   call $assembly/util/paramClamp
   local.set $3
   local.get $0
   i32.load $0 offset=104
   local.get $2
   call $assembly/util/paramClamp
   local.set $2
   local.get $4
   f64.promote_f32
   f64.const 6.283185307179586
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   local.tee $1
   call $~lib/math/NativeMath.sin
   local.set $5
   local.get $1
   call $~lib/math/NativeMath.cos
   local.set $6
   local.get $0
   local.get $5
   local.get $3
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.div
   local.tee $5
   local.get $2
   f64.promote_f32
   f64.const 20
   f64.div
   call $~lib/math/NativeMath.pow
   local.tee $1
   f64.mul
   local.tee $7
   f64.const 1
   f64.add
   f64.store $0 offset=72
   local.get $0
   local.get $6
   f64.const -2
   f64.mul
   local.tee $6
   f64.store $0 offset=80
   local.get $0
   f64.const 1
   local.get $7
   f64.sub
   f64.store $0 offset=88
   local.get $0
   local.get $5
   local.get $1
   f64.div
   local.tee $1
   f64.const 1
   f64.add
   f64.store $0 offset=48
   local.get $0
   local.get $6
   f64.store $0 offset=56
   local.get $0
   f64.const 1
   local.get $1
   f64.sub
   f64.store $0 offset=64
   local.get $0
   local.get $0
   f64.load $0 offset=72
   f64.const 1
   local.get $0
   f64.load $0 offset=48
   f64.div
   local.tee $1
   f64.mul
   f64.store $0 offset=72
   local.get $0
   local.get $0
   f64.load $0 offset=80
   local.get $1
   f64.mul
   f64.store $0 offset=80
   local.get $0
   local.get $0
   f64.load $0 offset=88
   local.get $1
   f64.mul
   f64.store $0 offset=88
   local.get $0
   local.get $0
   f64.load $0 offset=56
   local.get $1
   f64.mul
   f64.store $0 offset=56
   local.get $0
   local.get $0
   f64.load $0 offset=64
   local.get $1
   f64.mul
   f64.store $0 offset=64
  end
 )
 (func $assembly/gen/daverb/Daverb#get:_dp (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=40
 )
 (func $assembly/gen/daverb/Daverb#get:_ex (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=44
 )
 (func $assembly/gen/daverb/Daverb#get:_ed (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=48
 )
 (func $assembly/gen/daverb/Daverb#get:_pd (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=12
 )
 (func $assembly/gen/daverb/Daverb#_update (param $0 i32)
  (local $1 f32)
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=24
  f32.convert_i32_u
  local.set $1
  local.get $0
  f32.const 1
  local.get $0
  f32.load $0 offset=40
  f32.sub
  f32.store $0 offset=92
  local.get $0
  local.get $0
  f32.load $0 offset=44
  local.get $1
  f32.div
  f32.store $0 offset=96
  local.get $0
  local.get $0
  f32.load $0 offset=48
  local.get $1
  f32.mul
  f32.const 1e3
  f32.div
  f32.store $0 offset=100
  local.get $0
  local.get $0
  f32.load $0 offset=12
  local.get $1
  f32.mul
  f32.store $0 offset=104
 )
 (func $assembly/gen/delay/Delay#get:ms (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=8
 )
 (func $assembly/gen/delay/Delay#get:_stepf (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=32
 )
 (func $assembly/gen/delay/Delay#get:_targetf (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=36
 )
 (func $assembly/gen/delay/Delay#_update (param $0 i32)
  local.get $0
  local.get $0
  f32.load $0 offset=8
  f32.const 1.0000000474974513e-03
  f32.mul
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=4
  f32.convert_i32_u
  f32.mul
  f32.const 65535
  f32.min
  f32.store $0 offset=36
  local.get $0
  f32.load $0 offset=32
  f32.const 0
  f32.eq
  if
   local.get $0
   local.get $0
   f32.load $0 offset=36
   f32.store $0 offset=32
  end
 )
 (func $assembly/gen/diode/clamp (param $0 f32) (param $1 f32) (param $2 f32) (result f32)
  local.get $1
  local.get $0
  local.get $2
  local.get $0
  local.get $2
  f32.gt
  select
  local.tee $0
  local.get $0
  local.get $1
  f32.gt
  select
 )
 (func $assembly/gen/diode/Diode#get:q (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=20
 )
 (func $assembly/gen/diode/Diode#get:_k (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=92
 )
 (func $~lib/math/NativeMathf.tan (param $0 f32) (result f32)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 f64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  local.get $0
  i32.reinterpret_f32
  local.tee $3
  i32.const 31
  i32.shr_u
  local.set $7
  block $folding-inner1
   block $folding-inner0
    local.get $3
    i32.const 2147483647
    i32.and
    local.tee $3
    i32.const 1061752794
    i32.le_u
    if
     local.get $3
     i32.const 964689920
     i32.lt_u
     if
      local.get $0
      return
     end
     local.get $0
     f64.promote_f32
     local.tee $2
     local.get $2
     f64.mul
     local.tee $1
     local.get $1
     f64.mul
     local.set $4
     br $folding-inner0
    end
    local.get $3
    i32.const 1081824209
    i32.le_u
    if
     local.get $3
     i32.const 1075235811
     i32.le_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 1.5707963267948966
      f64.add
      local.get $1
      f64.const -1.5707963267948966
      f64.add
      local.get $7
      select
      local.tee $2
      local.get $2
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $4
      br $folding-inner1
     else
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 3.141592653589793
      f64.add
      local.get $1
      f64.const -3.141592653589793
      f64.add
      local.get $7
      select
      local.tee $2
      local.get $2
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $4
      br $folding-inner0
     end
     unreachable
    end
    local.get $3
    i32.const 1088565717
    i32.le_u
    if
     local.get $3
     i32.const 1085271519
     i32.le_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 4.71238898038469
      f64.add
      local.get $1
      f64.const -4.71238898038469
      f64.add
      local.get $7
      select
      local.tee $2
      local.get $2
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $4
      br $folding-inner1
     else
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 6.283185307179586
      f64.add
      local.get $1
      f64.const -6.283185307179586
      f64.add
      local.get $7
      select
      local.tee $2
      local.get $2
      f64.mul
      local.tee $1
      local.get $1
      f64.mul
      local.set $4
      br $folding-inner0
     end
     unreachable
    end
    local.get $3
    i32.const 2139095040
    i32.ge_u
    if
     local.get $0
     local.get $0
     f32.sub
     return
    end
    block $~lib/math/rempio2f|inlined.2 (result i32)
     local.get $3
     i32.const 1305022427
     i32.lt_u
     if
      local.get $0
      f64.promote_f32
      local.tee $1
      f64.const 0.6366197723675814
      f64.mul
      f64.nearest
      local.set $2
      local.get $1
      local.get $2
      f64.const 1.5707963109016418
      f64.mul
      f64.sub
      local.get $2
      f64.const 1.5893254773528196e-08
      f64.mul
      f64.sub
      global.set $~lib/math/rempio2f_y
      local.get $2
      i32.trunc_sat_f64_s
      br $~lib/math/rempio2f|inlined.2
     end
     local.get $3
     i32.const 23
     i32.shr_u
     i32.const 152
     i32.sub
     local.tee $8
     i32.const 63
     i32.and
     i64.extend_i32_s
     local.set $5
     local.get $8
     i32.const 6
     i32.shr_s
     i32.const 3
     i32.shl
     i32.const 1051280
     i32.add
     local.tee $8
     i64.load $0 offset=8
     local.set $6
     f64.const 8.515303950216386e-20
     local.get $0
     f64.promote_f32
     f64.copysign
     local.get $3
     i32.const 8388607
     i32.and
     i32.const 8388608
     i32.or
     i64.extend_i32_s
     local.tee $9
     local.get $8
     i64.load $0
     local.get $5
     i64.shl
     local.get $6
     i64.const 64
     local.get $5
     i64.sub
     i64.shr_u
     i64.or
     i64.mul
     local.get $5
     i64.const 32
     i64.gt_u
     if (result i64)
      local.get $6
      local.get $5
      i64.const 32
      i64.sub
      i64.shl
      local.get $8
      i64.load $0 offset=16
      i64.const 96
      local.get $5
      i64.sub
      i64.shr_u
      i64.or
     else
      local.get $6
      i64.const 32
      local.get $5
      i64.sub
      i64.shr_u
     end
     local.get $9
     i64.mul
     i64.const 32
     i64.shr_u
     i64.add
     local.tee $5
     i64.const 2
     i64.shl
     local.tee $6
     f64.convert_i64_s
     f64.mul
     global.set $~lib/math/rempio2f_y
     i32.const 0
     local.get $5
     i64.const 62
     i64.shr_u
     local.get $6
     i64.const 63
     i64.shr_u
     i64.add
     i32.wrap_i64
     local.tee $3
     i32.sub
     local.get $3
     local.get $7
     select
    end
    local.set $3
    global.get $~lib/math/rempio2f_y
    local.tee $1
    local.get $1
    f64.mul
    local.tee $2
    local.get $2
    f64.mul
    local.set $4
    f64.const -1
    local.get $1
    local.get $2
    local.get $1
    f64.mul
    local.tee $1
    local.get $2
    f64.const 0.13339200271297674
    f64.mul
    f64.const 0.3333313950307914
    f64.add
    f64.mul
    f64.add
    local.get $1
    local.get $4
    f64.mul
    local.get $2
    f64.const 0.024528318116654728
    f64.mul
    f64.const 0.05338123784456704
    f64.add
    local.get $4
    local.get $2
    f64.const 0.009465647849436732
    f64.mul
    f64.const 0.002974357433599673
    f64.add
    f64.mul
    f64.add
    f64.mul
    f64.add
    local.tee $1
    f64.div
    local.get $1
    local.get $3
    i32.const 1
    i32.and
    select
    f32.demote_f64
    return
   end
   local.get $2
   local.get $1
   local.get $2
   f64.mul
   local.tee $2
   local.get $1
   f64.const 0.13339200271297674
   f64.mul
   f64.const 0.3333313950307914
   f64.add
   f64.mul
   f64.add
   local.get $2
   local.get $4
   f64.mul
   local.get $1
   f64.const 0.024528318116654728
   f64.mul
   f64.const 0.05338123784456704
   f64.add
   local.get $4
   local.get $1
   f64.const 0.009465647849436732
   f64.mul
   f64.const 0.002974357433599673
   f64.add
   f64.mul
   f64.add
   f64.mul
   f64.add
   f32.demote_f64
   return
  end
  f64.const -1
  local.get $2
  local.get $1
  local.get $2
  f64.mul
  local.tee $2
  local.get $1
  f64.const 0.13339200271297674
  f64.mul
  f64.const 0.3333313950307914
  f64.add
  f64.mul
  f64.add
  local.get $2
  local.get $4
  f64.mul
  local.get $1
  f64.const 0.024528318116654728
  f64.mul
  f64.const 0.05338123784456704
  f64.add
  local.get $4
  local.get $1
  f64.const 0.009465647849436732
  f64.mul
  f64.const 0.002974357433599673
  f64.add
  f64.mul
  f64.add
  f64.mul
  f64.add
  f64.div
  f32.demote_f64
 )
 (func $assembly/gen/diode/Diode#_update (param $0 i32)
  (local $1 f32)
  (local $2 f32)
  (local $3 f32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  local.get $0
  f32.load $0 offset=12
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=24
  f32.convert_i32_u
  f32.const 0.5
  f32.mul
  local.tee $2
  f32.div
  local.tee $1
  f32.const 0
  f32.lt
  if
   f32.const 0
   local.set $1
  end
  f32.const 1
  local.get $1
  local.get $1
  f32.const 1
  f32.gt
  select
  f32.const 3.1415927410125732
  f32.mul
  local.tee $1
  f32.const 2
  f32.add
  local.set $3
  local.get $0
  local.get $1
  f32.const -2
  f32.add
  local.get $3
  f32.div
  f32.store $0 offset=80
  local.get $0
  f32.const 2
  local.get $3
  f32.div
  local.tee $4
  f32.store $0 offset=84
  local.get $0
  local.get $0
  f32.load $0 offset=20
  f32.const 20
  f32.mul
  f32.store $0 offset=92
  local.get $0
  local.get $0
  f32.load $0 offset=92
  f32.const 0.5
  f32.mul
  f32.const 1
  f32.add
  f32.store $0 offset=48
  local.get $0
  f32.load $0 offset=8
  local.get $2
  f32.div
  local.tee $1
  f32.const 0
  f32.lt
  if
   f32.const 0
   local.set $1
  end
  local.get $0
  f32.const 1
  f32.const 1
  local.get $1
  local.get $1
  f32.const 1
  f32.gt
  select
  f32.const 3.1415927410125732
  f32.mul
  f32.const 0.5
  f32.mul
  call $~lib/math/NativeMathf.tan
  f32.const 2
  f32.mul
  local.tee $1
  f32.div
  f32.store $0 offset=88
  f32.const 1
  local.get $1
  local.get $1
  f32.mul
  local.tee $2
  local.get $2
  f32.add
  local.get $2
  f32.mul
  local.tee $5
  local.get $2
  f32.const 4
  f32.mul
  local.get $1
  local.get $1
  f32.add
  f32.const 1
  f32.add
  local.tee $6
  local.get $6
  f32.mul
  local.tee $3
  f32.mul
  f32.sub
  local.get $3
  local.get $3
  f32.mul
  f32.add
  f32.div
  local.set $7
  local.get $0
  local.get $5
  local.get $7
  f32.mul
  local.tee $5
  local.get $4
  f32.mul
  f32.store $0 offset=72
  local.get $0
  local.get $1
  f32.store $0 offset=52
  local.get $0
  local.get $2
  f32.store $0 offset=56
  local.get $0
  local.get $6
  f32.store $0 offset=60
  local.get $0
  local.get $3
  f32.store $0 offset=64
  local.get $0
  local.get $7
  f32.store $0 offset=68
  local.get $0
  local.get $5
  f32.store $0 offset=76
 )
 (func $assembly/gen/lp/Lp#_update (param $0 i32)
  (local $1 f32)
  local.get $0
  f32.const 1
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=24
  f32.convert_i32_u
  f32.div
  local.tee $1
  f32.const 1
  local.get $0
  f32.load $0 offset=8
  f32.const 6.2831854820251465
  f32.mul
  f32.div
  local.get $1
  f32.add
  f32.div
  f32.store $0 offset=16
 )
 (func $assembly/gen/mhp/Mhp#get:cut (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=80
 )
 (func $assembly/gen/mhp/Mhp#get:q (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=84
 )
 (func $assembly/gen/moog/Moog#get:_params_freq (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=72
 )
 (func $assembly/gen/moog/Moog#get:_params_Q (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=76
 )
 (func $assembly/gen/moog/Moog#get:_kVt (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=56
 )
 (func $assembly/gen/mhp/Mhp#_update (param $0 i32)
  (local $1 f32)
  (local $2 f64)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f64)
  block $assembly/gen/moog/Moog#_validate|inlined.0 (result i32)
   local.get $0
   f32.load $0 offset=84
   local.set $1
   i32.const 0
   local.get $0
   f32.load $0 offset=80
   local.tee $6
   f32.const 0
   f32.le
   br_if $assembly/gen/moog/Moog#_validate|inlined.0
   drop
   i32.const 0
   local.get $6
   local.get $6
   f32.ne
   br_if $assembly/gen/moog/Moog#_validate|inlined.0
   drop
   i32.const 0
   local.get $1
   f32.const 0
   f32.le
   br_if $assembly/gen/moog/Moog#_validate|inlined.0
   drop
   i32.const 0
   local.get $1
   local.get $1
   f32.ne
   br_if $assembly/gen/moog/Moog#_validate|inlined.0
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=72
   local.get $6
   call $assembly/util/paramClamp
   local.set $6
   local.get $0
   i32.load $0 offset=76
   local.get $1
   call $assembly/util/paramClamp
   local.set $1
   local.get $0
   local.get $0
   f32.load $0 offset=56
   f32.const 2
   f32.add
   f32.store $0 offset=36
   local.get $0
   f32.load $0 offset=36
   local.set $7
   block $~lib/util/math/expf_lut|inlined.0 (result f32)
    local.get $6
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=24
    f32.convert_i32_u
    f32.div
    local.tee $6
    local.get $6
    f32.mul
    local.tee $8
    local.get $6
    f32.mul
    f32.const 1.8730000257492065
    f32.mul
    local.get $8
    f32.const 0.49549999833106995
    f32.mul
    f32.add
    local.get $6
    f32.const 0.6489999890327454
    f32.mul
    f32.sub
    f32.const 0.9987999796867371
    f32.add
    f32.const -6.2831854820251465
    f32.mul
    local.get $6
    f32.mul
    local.tee $8
    f64.promote_f32
    local.set $2
    local.get $8
    i32.reinterpret_f32
    local.tee $4
    i32.const 20
    i32.shr_u
    i32.const 2047
    i32.and
    local.tee $5
    i32.const 1067
    i32.ge_u
    if
     f32.const 0
     local.get $4
     i32.const -8388608
     i32.eq
     br_if $~lib/util/math/expf_lut|inlined.0
     drop
     local.get $8
     local.get $8
     f32.add
     local.get $5
     i32.const 2040
     i32.ge_u
     br_if $~lib/util/math/expf_lut|inlined.0
     drop
     local.get $8
     f32.const 1701411834604692317316873e14
     f32.mul
     local.get $8
     f32.const 88.72283172607422
     f32.gt
     br_if $~lib/util/math/expf_lut|inlined.0
     drop
     f32.const 0
     local.get $8
     f32.const -103.97207641601562
     f32.lt
     br_if $~lib/util/math/expf_lut|inlined.0
     drop
    end
    local.get $2
    f64.const 46.16624130844683
    f64.mul
    local.tee $2
    f64.const 6755399441055744
    f64.add
    local.tee $9
    i64.reinterpret_f64
    local.set $3
    local.get $2
    local.get $9
    f64.const -6755399441055744
    f64.add
    f64.sub
    local.tee $2
    f64.const 0.021660849396613134
    f64.mul
    f64.const 1
    f64.add
    local.get $2
    f64.const 1.6938359250920212e-06
    f64.mul
    f64.const 2.3459809789509004e-04
    f64.add
    local.get $2
    local.get $2
    f64.mul
    f64.mul
    f64.add
    local.get $3
    i32.wrap_i64
    i32.const 31
    i32.and
    i32.const 3
    i32.shl
    i32.const 1054704
    i32.add
    i64.load $0
    local.get $3
    i64.const 47
    i64.shl
    i64.add
    f64.reinterpret_i64
    f64.mul
    f32.demote_f64
   end
   local.set $8
   local.get $0
   local.get $1
   f32.const 0.9331585764884949
   f32.mul
   f32.const 1.0001784563064575
   f32.add
   f32.store $0 offset=68
   local.get $0
   local.get $1
   local.get $6
   local.get $6
   f32.mul
   f32.const -3.9363999366760254
   f32.mul
   local.get $6
   f32.const 1.84089994430542
   f32.mul
   f32.add
   f32.const 0.9968000054359436
   f32.add
   f32.mul
   f32.store $0 offset=60
   local.get $0
   local.get $7
   f32.const 1
   local.get $8
   f32.sub
   f32.mul
   f32.store $0 offset=64
  end
 )
 (func $assembly/gen/rate/Rate#_update (param $0 i32)
  local.get $0
  i32.load $0 offset=4
  local.get $0
  f32.load $0 offset=8
  i32.trunc_sat_f32_u
  i32.store $0
  local.get $0
  i32.load $0 offset=4
  i32.const -1
  local.get $0
  f32.load $0 offset=8
  i32.trunc_sat_f32_u
  i32.div_u
  i32.store $0 offset=4
 )
 (func $assembly/gen/sap/Sap#get:cut (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=104
 )
 (func $~lib/math/tan_kern (param $0 f64) (param $1 f64) (param $2 i32) (result f64)
  (local $3 i32)
  (local $4 i32)
  (local $5 f64)
  (local $6 f64)
  (local $7 f64)
  local.get $0
  i64.reinterpret_f64
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.tee $3
  i32.const 2147483647
  i32.and
  i32.const 1072010280
  i32.ge_u
  local.tee $4
  if
   f64.const 0.7853981633974483
   local.get $3
   i32.const 0
   i32.lt_s
   if (result f64)
    local.get $1
    f64.neg
    local.set $1
    local.get $0
    f64.neg
   else
    local.get $0
   end
   f64.sub
   f64.const 3.061616997868383e-17
   local.get $1
   f64.sub
   f64.add
   local.set $0
   f64.const 0
   local.set $1
  end
  local.get $0
  local.get $0
  f64.mul
  local.tee $5
  local.get $5
  f64.mul
  local.set $6
  local.get $0
  local.get $1
  local.get $5
  local.get $5
  local.get $0
  f64.mul
  local.tee $7
  local.get $6
  local.get $6
  local.get $6
  local.get $6
  local.get $6
  f64.const -1.8558637485527546e-05
  f64.mul
  f64.const 7.817944429395571e-05
  f64.add
  f64.mul
  f64.const 5.880412408202641e-04
  f64.add
  f64.mul
  f64.const 3.5920791075913124e-03
  f64.add
  f64.mul
  f64.const 0.021869488294859542
  f64.add
  f64.mul
  f64.const 0.13333333333320124
  f64.add
  local.get $5
  local.get $6
  local.get $6
  local.get $6
  local.get $6
  local.get $6
  f64.const 2.590730518636337e-05
  f64.mul
  f64.const 7.140724913826082e-05
  f64.add
  f64.mul
  f64.const 2.464631348184699e-04
  f64.add
  f64.mul
  f64.const 1.4562094543252903e-03
  f64.add
  f64.mul
  f64.const 0.0088632398235993
  f64.add
  f64.mul
  f64.const 0.05396825397622605
  f64.add
  f64.mul
  f64.add
  f64.mul
  local.get $1
  f64.add
  f64.mul
  f64.add
  local.get $7
  f64.const 0.3333333333333341
  f64.mul
  f64.add
  local.tee $1
  f64.add
  local.set $5
  local.get $4
  if
   f64.const 1
   local.get $3
   i32.const 30
   i32.shr_s
   i32.const 2
   i32.and
   f64.convert_i32_s
   f64.sub
   local.get $2
   f64.convert_i32_s
   local.tee $6
   local.get $0
   local.get $5
   local.get $5
   f64.mul
   local.get $5
   local.get $6
   f64.add
   f64.div
   local.get $1
   f64.sub
   f64.sub
   f64.const 2
   f64.mul
   f64.sub
   f64.mul
   return
  end
  local.get $2
  i32.const 1
  i32.eq
  if
   local.get $5
   return
  end
  f64.const -1
  local.get $5
  f64.div
  local.tee $6
  i64.reinterpret_f64
  i64.const -4294967296
  i64.and
  f64.reinterpret_i64
  local.tee $7
  local.get $6
  local.get $7
  local.get $5
  i64.reinterpret_f64
  i64.const -4294967296
  i64.and
  f64.reinterpret_i64
  local.tee $5
  f64.mul
  f64.const 1
  f64.add
  local.get $7
  local.get $1
  local.get $5
  local.get $0
  f64.sub
  f64.sub
  f64.mul
  f64.add
  f64.mul
  f64.add
 )
 (func $~lib/math/NativeMath.tan (param $0 f64) (result f64)
  (local $1 f64)
  (local $2 f64)
  (local $3 i32)
  (local $4 f64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i64.reinterpret_f64
  local.tee $5
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  local.tee $3
  i32.const 31
  i32.shr_u
  local.set $6
  local.get $3
  i32.const 2147483647
  i32.and
  local.tee $3
  i32.const 1072243195
  i32.le_u
  if
   local.get $3
   i32.const 1044381696
   i32.lt_u
   if
    local.get $0
    return
   end
   local.get $0
   f64.const 0
   i32.const 1
   call $~lib/math/tan_kern
   return
  end
  local.get $3
  i32.const 2146435072
  i32.ge_u
  if
   local.get $0
   local.get $0
   f64.sub
   return
  end
  block $~lib/math/rempio2|inlined.2
   local.get $5
   i64.const 32
   i64.shr_u
   i32.wrap_i64
   i32.const 2147483647
   i32.and
   local.tee $7
   i32.const 1073928572
   i32.lt_u
   if
    i32.const 1
    local.set $3
    local.get $6
    if (result f64)
     local.get $0
     f64.const 1.5707963267341256
     f64.add
     local.set $0
     i32.const -1
     local.set $3
     local.get $7
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const 6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const 6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const 6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const 2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const 2.0222662487959506e-21
      f64.add
     end
    else
     local.get $0
     f64.const -1.5707963267341256
     f64.add
     local.set $0
     local.get $7
     i32.const 1073291771
     i32.ne
     if (result f64)
      local.get $0
      local.get $0
      f64.const -6.077100506506192e-11
      f64.add
      local.tee $0
      f64.sub
      f64.const -6.077100506506192e-11
      f64.add
     else
      local.get $0
      f64.const -6.077100506303966e-11
      f64.add
      local.tee $1
      f64.const -2.0222662487959506e-21
      f64.add
      local.set $0
      local.get $1
      local.get $0
      f64.sub
      f64.const -2.0222662487959506e-21
      f64.add
     end
    end
    local.set $1
    local.get $0
    global.set $~lib/math/rempio2_y0
    local.get $1
    global.set $~lib/math/rempio2_y1
    br $~lib/math/rempio2|inlined.2
   end
   local.get $7
   i32.const 1094263291
   i32.lt_u
   if
    local.get $7
    i32.const 20
    i32.shr_u
    local.tee $3
    local.get $0
    local.get $0
    f64.const 0.6366197723675814
    f64.mul
    f64.nearest
    local.tee $4
    f64.const 1.5707963267341256
    f64.mul
    f64.sub
    local.tee $0
    local.get $4
    f64.const 6.077100506506192e-11
    f64.mul
    local.tee $2
    f64.sub
    local.tee $1
    i64.reinterpret_f64
    i64.const 32
    i64.shr_u
    i32.wrap_i64
    i32.const 20
    i32.shr_u
    i32.const 2047
    i32.and
    i32.sub
    i32.const 16
    i32.gt_u
    if
     local.get $4
     f64.const 2.0222662487959506e-21
     f64.mul
     local.get $0
     local.get $0
     local.get $4
     f64.const 6.077100506303966e-11
     f64.mul
     local.tee $1
     f64.sub
     local.tee $0
     f64.sub
     local.get $1
     f64.sub
     f64.sub
     local.set $2
     local.get $3
     local.get $0
     local.get $2
     f64.sub
     local.tee $1
     i64.reinterpret_f64
     i64.const 32
     i64.shr_u
     i32.wrap_i64
     i32.const 20
     i32.shr_u
     i32.const 2047
     i32.and
     i32.sub
     i32.const 49
     i32.gt_u
     if
      local.get $4
      f64.const 8.4784276603689e-32
      f64.mul
      local.get $0
      local.get $0
      local.get $4
      f64.const 2.0222662487111665e-21
      f64.mul
      local.tee $1
      f64.sub
      local.tee $0
      f64.sub
      local.get $1
      f64.sub
      f64.sub
      local.set $2
      local.get $0
      local.get $2
      f64.sub
      local.set $1
     end
    end
    local.get $1
    global.set $~lib/math/rempio2_y0
    local.get $0
    local.get $1
    f64.sub
    local.get $2
    f64.sub
    global.set $~lib/math/rempio2_y1
    local.get $4
    i32.trunc_sat_f64_s
    local.set $3
    br $~lib/math/rempio2|inlined.2
   end
   i32.const 0
   local.get $5
   call $~lib/math/pio2_large_quot
   local.tee $3
   i32.sub
   local.get $3
   local.get $6
   select
   local.set $3
  end
  global.get $~lib/math/rempio2_y0
  global.get $~lib/math/rempio2_y1
  i32.const 1
  local.get $3
  i32.const 1
  i32.and
  i32.const 1
  i32.shl
  i32.sub
  call $~lib/math/tan_kern
 )
 (func $assembly/gen/svf/Svf#get:_a1 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=32
 )
 (func $assembly/gen/svf/Svf#get:_a2 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=40
 )
 (func $assembly/gen/sap/Sap#_update (param $0 i32)
  (local $1 f32)
  (local $2 f64)
  (local $3 f32)
  block $assembly/gen/svf/Svf#_validate|inlined.0 (result i32)
   local.get $0
   f32.load $0 offset=108
   local.set $1
   i32.const 0
   local.get $0
   f32.load $0 offset=104
   local.tee $3
   f32.const 0
   f32.le
   br_if $assembly/gen/svf/Svf#_validate|inlined.0
   drop
   i32.const 0
   local.get $3
   local.get $3
   f32.ne
   br_if $assembly/gen/svf/Svf#_validate|inlined.0
   drop
   i32.const 0
   local.get $1
   f32.const 0
   f32.le
   br_if $assembly/gen/svf/Svf#_validate|inlined.0
   drop
   i32.const 0
   local.get $1
   local.get $1
   f32.ne
   br_if $assembly/gen/svf/Svf#_validate|inlined.0
   drop
   i32.const 1
  end
  if
   local.get $0
   i32.load $0 offset=96
   local.get $3
   call $assembly/util/paramClamp
   local.set $3
   local.get $0
   i32.load $0 offset=100
   local.get $1
   call $assembly/util/paramClamp
   local.set $1
   local.get $3
   f64.promote_f32
   f64.const 3.141592653589793
   f64.mul
   local.get $0
   i32.load $0 offset=4
   i32.load $0 offset=24
   f64.convert_i32_u
   f64.div
   call $~lib/math/NativeMath.tan
   local.set $2
   local.get $0
   f64.const 2
   local.get $1
   f64.promote_f32
   f64.const 2
   f64.mul
   f64.sub
   f64.store $0 offset=88
   local.get $0
   f64.const 1
   local.get $2
   local.get $2
   local.get $0
   f64.load $0 offset=88
   f64.add
   f64.mul
   f64.const 1
   f64.add
   f64.div
   f64.store $0 offset=32
   local.get $0
   local.get $2
   local.get $0
   f64.load $0 offset=32
   f64.mul
   f64.store $0 offset=40
   local.get $0
   local.get $2
   local.get $0
   f64.load $0 offset=40
   f64.mul
   f64.store $0 offset=48
  end
 )
 (func $assembly/gen/tanh/Tanh#_update (param $0 i32)
  local.get $0
  local.get $0
  f32.load $0
  f32x4.splat
  v128.store $0 offset=16
 )
 (func $assembly/gen/tap/Tap#get:_stepf (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=28
 )
 (func $assembly/gen/tap/Tap#_update (param $0 i32)
  local.get $0
  local.get $0
  f32.load $0 offset=8
  f32.const 1.0000000474974513e-03
  f32.mul
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=4
  f32.convert_i32_u
  f32.mul
  f32.const 65535
  f32.min
  f32.store $0 offset=32
  local.get $0
  f32.load $0 offset=28
  f32.const 0
  f32.eq
  if
   local.get $0
   local.get $0
   f32.load $0 offset=32
   f32.store $0 offset=28
  end
 )
 (func $assembly/gen/osc/Osc#get:offset (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=16
 )
 (func $assembly/gen/osc/Osc#get:_lastTrig (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=32
 )
 (func $assembly/gen/osc/Osc#_update (param $0 i32)
  local.get $0
  local.get $0
  f32.load $0 offset=8
  f64.promote_f32
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=4
  f64.convert_i32_u
  f64.mul
  f64.const 0.125
  f64.mul
  i32.trunc_sat_f64_u
  i32.store $0 offset=24
  local.get $0
  local.get $0
  f32.load $0 offset=16
  f64.promote_f32
  f64.const 4294967295
  f64.mul
  i32.trunc_sat_f64_u
  i32.store $0 offset=36
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
  i32.load $0 offset=32
  local.get $0
  f32.load $0 offset=12
  i32.trunc_sat_f32_s
  i32.ne
  if
   local.get $0
   i32.const 0
   i32.store $0 offset=20
  end
  local.get $0
  local.get $0
  f32.load $0 offset=12
  i32.trunc_sat_f32_s
  i32.store $0 offset=32
 )
 (func $assembly/gen/sample/Sample#_update (param $0 i32)
  local.get $0
  local.get $0
  f32.load $0 offset=8
  f64.promote_f32
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=4
  i32.const 2
  i32.shr_u
  f64.convert_i32_u
  f64.mul
  local.get $0
  i32.load $0 offset=20
  f64.convert_i32_u
  f64.add
  f64.store $0 offset=40
  local.get $0
  f64.load $0 offset=32
  f64.const -1
  f64.eq
  if
   local.get $0
   local.get $0
   f64.load $0 offset=40
   f64.store $0 offset=32
  end
  local.get $0
  f32.const 0
  f32.store $0 offset=8
  local.get $0
  f32.load $0 offset=48
  f32.const 0
  f32.ne
  if (result i32)
   local.get $0
   f32.load $0 offset=12
   f32.const 0
   f32.eq
  else
   i32.const 0
  end
  if
   local.get $0
   i32.const 0
   i32.store $0 offset=24
  end
  local.get $0
  local.get $0
  f32.load $0 offset=12
  f32.store $0 offset=48
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#getTableIndex (param $0 i32) (param $1 f32) (result i32)
  (local $2 i32)
  loop $while-continue|0
   local.get $0
   i32.load $0 offset=8
   local.get $2
   call $~lib/staticarray/StaticArray<f32>#__get
   local.get $1
   f32.le
   if (result i32)
    local.get $2
    local.get $0
    i32.load $0 offset=28
    i32.const 1
    i32.sub
    i32.lt_u
   else
    i32.const 0
   end
   if
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $2
 )
 (func $assembly/core/antialias-wavetable/AntialiasWavetable#get:stepShift (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=44
 )
 (func $assembly/gen/aosc/AOsc#_update (param $0 i32)
  (local $1 i32)
  local.get $0
  local.get $0
  f32.load $0 offset=8
  f64.promote_f32
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=4
  f64.convert_i32_u
  f64.mul
  f64.const 0.125
  f64.mul
  i32.trunc_sat_f64_u
  i32.store $0 offset=24
  local.get $0
  local.get $0
  f32.load $0 offset=16
  f64.promote_f32
  f64.const 4294967295
  f64.mul
  i32.trunc_sat_f64_u
  i32.store $0 offset=36
  local.get $0
  f32.const 0
  f32.store $0 offset=16
  local.get $0
  i32.load $0 offset=32
  local.get $0
  f32.load $0 offset=12
  i32.trunc_sat_f32_s
  i32.ne
  if
   local.get $0
   i32.const 0
   i32.store $0 offset=20
  end
  local.get $0
  local.get $0
  f32.load $0 offset=12
  i32.trunc_sat_f32_s
  i32.store $0 offset=32
  local.get $0
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=8
  i32.load $0 offset=28
  local.get $0
  f32.load $0 offset=8
  call $assembly/core/antialias-wavetable/AntialiasWavetable#getTableIndex
  i32.store $0 offset=40
  local.get $0
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=8
  i32.load $0 offset=28
  i32.load $0 offset=44
  local.tee $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $0
   i32.load $0 offset=24
   i32.const 0
   local.get $1
   i32.sub
   i32.shl
  else
   local.get $0
   i32.load $0 offset=24
   local.get $1
   i32.shr_u
  end
  i32.store $0 offset=24
 )
 (func $assembly/gen/delay/Delay#_reset (param $0 i32)
  (local $1 i32)
  i32.const 65536
  local.get $0
  i32.load $0 offset=20
  local.tee $0
  i32.const 20
  i32.sub
  i32.load $0 offset=16
  i32.const 2
  i32.shr_u
  local.tee $1
  local.get $1
  i32.const 65536
  i32.gt_u
  select
  local.tee $1
  i32.const 0
  i32.gt_s
  if
   local.get $0
   i32.const 0
   local.get $1
   i32.const 2
   i32.shl
   memory.fill $0
  end
 )
 (func $assembly/gen/clamp/Clamp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 i32)
  (local $7 f32)
  local.get $0
  f32.load $0 offset=8
  local.set $4
  local.get $0
  f32.load $0 offset=12
  local.set $5
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $6
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=16
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_u
   if
    local.get $3
    local.get $5
    local.get $4
    local.get $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $5
    local.get $4
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    local.get $7
    f32.gt
    select
    local.get $5
    local.get $7
    f32.lt
    select
    f32.store $0
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $2
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/clip/Clip#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  local.get $0
  f32.load $0 offset=8
  local.set $4
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=12
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $3
    local.get $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $6
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
    else
     local.get $4
     f32.neg
     local.tee $7
     local.get $6
     local.get $6
     local.get $7
     f32.lt
     select
    end
    f32.store $0
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $2
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/comp/Comp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 i32)
  (local $11 i32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $10
  local.get $1
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.load $0 offset=24
  i32.add
  local.set $2
  local.get $3
  local.get $5
  i32.add
  local.set $3
  local.get $0
  f32.load $0 offset=36
  local.set $4
  local.get $0
  f32.load $0 offset=8
  local.set $6
  local.get $0
  f32.load $0 offset=12
  local.set $7
  local.get $0
  f32.load $0 offset=16
  local.set $8
  local.get $0
  f32.load $0 offset=20
  local.set $9
  local.get $0
  i32.load $0 offset=28
  local.tee $11
  if
   local.get $5
   local.get $11
   i32.add
   local.set $5
   loop $for-loop|0
    local.get $1
    local.get $10
    i32.lt_u
    if
     local.get $3
     local.get $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     f32.const 1
     local.get $4
     local.get $5
     i32.const 4
     i32.add
     local.tee $5
     f32.load $0
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $12
     local.get $4
     f32.sub
     local.tee $13
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $13
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $12
     f32.lt
     select
     local.tee $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $2
     i32.const 4
     i32.add
     local.set $2
     local.get $3
     i32.const 4
     i32.add
     local.set $3
     local.get $5
     i32.const 4
     i32.add
     local.set $5
     local.get $1
     i32.const 16
     i32.add
     local.set $1
     br $for-loop|0
    end
   end
  else
   loop $for-loop|1
    local.get $1
    local.get $10
    i32.lt_u
    if
     local.get $4
     local.get $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $4
     local.get $2
     i32.const 4
     i32.add
     local.tee $2
     f32.load $0
     local.tee $12
     f32.abs
     local.get $6
     f32.sub
     f32.const 0
     f32.max
     local.get $7
     f32.mul
     local.tee $13
     local.get $4
     f32.sub
     local.tee $14
     local.get $8
     f32.mul
     f32.add
     local.get $4
     local.get $14
     local.get $9
     f32.mul
     f32.add
     local.get $4
     local.get $13
     f32.lt
     select
     local.set $4
     local.get $3
     i32.const 4
     i32.add
     local.tee $3
     local.get $12
     f32.const 1
     local.get $4
     f32.sub
     f32.mul
     f32.store $0
     local.get $2
     i32.const 4
     i32.add
     local.set $2
     local.get $3
     i32.const 4
     i32.add
     local.set $3
     local.get $1
     i32.const 16
     i32.add
     local.set $1
     br $for-loop|1
    end
   end
  end
  local.get $0
  local.get $4
  f32.store $0 offset=36
 )
 (func $assembly/gen/daverb/Daverb#get:_mask (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=164
 )
 (func $assembly/gen/daverb/Daverb#get:_index (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=160
 )
 (func $assembly/gen/daverb/Daverb#get:_lp1 (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=168
 )
 (func $assembly/gen/daverb/Daverb#get:_lp2 (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=172
 )
 (func $assembly/gen/daverb/Daverb#get:_lp3 (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=176
 )
 (func $assembly/gen/daverb/Daverb#get:_excPhase (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=180
 )
 (func $assembly/gen/daverb/Daverb#get:_predelay (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=108
 )
 (func $assembly/util/cubic (param $0 i32) (param $1 f32) (param $2 i32) (result f32)
  (local $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  local.get $0
  local.get $1
  local.get $2
  f32.convert_i32_u
  f32.add
  local.tee $6
  i32.trunc_sat_f32_u
  local.tee $3
  i32.const 1
  i32.sub
  local.get $2
  i32.and
  call $~lib/staticarray/StaticArray<f32>#__get
  local.set $7
  local.get $0
  local.get $2
  local.get $3
  i32.and
  call $~lib/staticarray/StaticArray<f32>#__get
  local.tee $1
  local.get $0
  local.get $3
  i32.const 1
  i32.add
  local.get $2
  i32.and
  call $~lib/staticarray/StaticArray<f32>#__get
  local.tee $5
  f32.sub
  f32.const 3
  f32.mul
  local.get $7
  f32.sub
  local.get $0
  local.get $3
  i32.const 2
  i32.add
  local.get $2
  i32.and
  call $~lib/staticarray/StaticArray<f32>#__get
  local.tee $4
  f32.add
  f32.const 0.5
  f32.mul
  local.get $6
  local.get $3
  f32.convert_i32_s
  f32.sub
  local.tee $6
  f32.mul
  local.get $5
  local.get $5
  f32.add
  local.get $7
  f32.add
  local.get $1
  f32.const 5
  f32.mul
  local.get $4
  f32.add
  f32.const 0.5
  f32.mul
  f32.sub
  f32.add
  local.get $6
  f32.mul
  local.get $5
  local.get $7
  f32.sub
  f32.const 0.5
  f32.mul
  f32.add
  local.get $6
  f32.mul
  local.get $1
  f32.add
 )
 (func $assembly/gen/daverb/Daverb#get:_d0 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=112
 )
 (func $assembly/gen/daverb/Daverb#get:_d1 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=116
 )
 (func $assembly/gen/daverb/Daverb#get:_si (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=24
 )
 (func $assembly/gen/daverb/Daverb#get:_d2 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=120
 )
 (func $assembly/gen/daverb/Daverb#get:_d3 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=124
 )
 (func $assembly/gen/daverb/Daverb#get:_edn (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=100
 )
 (func $assembly/core/wavetable/Wavetable#readAt (param $0 i32) (param $1 i32) (param $2 i32) (result f32)
  (local $3 f32)
  local.get $1
  local.get $0
  i32.load $0 offset=4
  local.get $2
  i32.const 14
  i32.shr_u
  i32.and
  i32.add
  local.tee $0
  f32.load $0
  local.tee $3
  local.get $2
  i32.const 8388480
  i32.and
  i32.const 7
  i32.shl
  i32.const 1065353216
  i32.or
  f32.reinterpret_i32
  f32.const -1
  f32.add
  local.get $0
  f32.load $0 offset=4
  local.get $3
  f32.sub
  f32.mul
  f32.add
 )
 (func $assembly/gen/daverb/Daverb#get:_d4 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=128
 )
 (func $assembly/gen/daverb/Daverb#get:_d11 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=156
 )
 (func $assembly/gen/daverb/Daverb#get:_d5 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=132
 )
 (func $assembly/gen/daverb/Daverb#get:_d6 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=136
 )
 (func $assembly/gen/daverb/Daverb#get:_d7 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=140
 )
 (func $assembly/gen/daverb/Daverb#get:_d8 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=144
 )
 (func $assembly/gen/daverb/Daverb#get:_d9 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=148
 )
 (func $assembly/gen/daverb/Daverb#get:_d10 (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=152
 )
 (func $assembly/gen/daverb/Daverb#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 f32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 f32)
  (local $13 i32)
  (local $14 i32)
  (local $15 f32)
  (local $16 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $11
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $9
  local.get $2
  local.get $3
  i32.add
  local.set $3
  local.get $0
  i32.load $0 offset=164
  local.set $10
  local.get $0
  i32.load $0 offset=160
  local.tee $2
  i32.const 1
  i32.sub
  local.set $5
  local.get $0
  f32.load $0 offset=168
  local.set $4
  local.get $0
  f32.load $0 offset=172
  local.set $6
  local.get $0
  f32.load $0 offset=176
  local.set $7
  local.get $0
  i32.load $0 offset=180
  local.set $8
  loop $for-loop|0
   local.get $1
   local.get $11
   i32.lt_u
   if
    local.get $0
    i32.load $0 offset=108
    local.get $2
    local.get $10
    i32.and
    local.get $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.tee $13
    global.get $assembly/gen/daverb/md0
    local.tee $14
    local.get $2
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $13
    local.get $5
    local.get $14
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    local.tee $13
    i32.load $0 offset=12
    local.get $13
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.tee $13
    global.get $assembly/gen/daverb/md6
    local.tee $14
    local.get $2
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $13
    local.get $5
    local.get $14
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.tee $13
    global.get $assembly/gen/daverb/md10
    local.tee $14
    local.get $2
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $13
    local.get $5
    local.get $14
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $0
    i32.load $0 offset=108
    local.get $10
    local.get $2
    i32.const 1
    i32.add
    local.tee $2
    i32.and
    local.get $9
    i32.const 4
    i32.add
    local.tee $9
    f32.load $0
    f32.const 0.5
    f32.mul
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $4
    local.get $0
    f32.load $0 offset=16
    local.get $0
    i32.load $0 offset=108
    local.get $2
    f32.convert_i32_s
    local.tee $12
    local.get $0
    f32.load $0 offset=104
    f32.sub
    local.get $10
    call $assembly/util/cubic
    local.get $4
    f32.sub
    f32.mul
    f32.add
    local.set $4
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    local.get $4
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $5
    i32.const 1
    i32.add
    local.tee $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=112
    local.get $2
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=112
    local.get $5
    global.get $assembly/gen/daverb/md0
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    local.get $0
    f32.load $0 offset=20
    local.get $0
    i32.load $0 offset=116
    local.get $2
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=116
    local.get $5
    global.get $assembly/gen/daverb/md1
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=120
    local.get $2
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.mul
    local.get $0
    i32.load $0 offset=120
    local.get $5
    global.get $assembly/gen/daverb/md2
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    f32.load $0 offset=24
    local.get $0
    i32.load $0 offset=124
    local.get $2
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $0
    i32.load $0 offset=124
    local.get $5
    global.get $assembly/gen/daverb/md3
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.set $15
    local.get $0
    i32.load $0 offset=128
    local.get $12
    local.get $0
    f32.load $0 offset=100
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=12
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=8
    i32.load $0 offset=4
    local.get $8
    i32.const 14
    i32.shr_u
    i32.and
    i32.add
    local.tee $13
    f32.load $0
    local.tee $12
    local.get $8
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $13
    f32.load $0 offset=4
    local.get $12
    f32.sub
    f32.mul
    f32.add
    f32.mul
    f32.sub
    local.tee $12
    global.get $assembly/gen/daverb/md4
    call $assembly/util/cubic
    local.set $16
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=156
    local.get $5
    global.get $assembly/gen/daverb/md11
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $16
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=132
    local.get $2
    global.get $assembly/gen/daverb/md5
    i32.and
    local.get $16
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=128
    local.get $2
    global.get $assembly/gen/daverb/md4
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $6
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=132
    local.get $5
    global.get $assembly/gen/daverb/md5
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $6
    f32.sub
    f32.mul
    f32.add
    local.set $6
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $6
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=140
    local.get $2
    global.get $assembly/gen/daverb/md7
    i32.and
    local.get $0
    i32.load $0 offset=136
    local.get $5
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=136
    local.get $2
    global.get $assembly/gen/daverb/md6
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=144
    local.get $12
    global.get $assembly/gen/daverb/md8
    call $assembly/util/cubic
    local.set $12
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    local.get $15
    local.get $0
    f32.load $0 offset=28
    local.get $0
    i32.load $0 offset=140
    local.get $5
    global.get $assembly/gen/daverb/md7
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=32
    local.get $12
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=148
    local.get $2
    global.get $assembly/gen/daverb/md9
    i32.and
    local.get $12
    local.get $0
    f32.load $0 offset=32
    local.get $0
    i32.load $0 offset=144
    local.get $2
    global.get $assembly/gen/daverb/md8
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $7
    local.get $0
    f32.load $0 offset=92
    local.get $0
    i32.load $0 offset=148
    local.get $5
    global.get $assembly/gen/daverb/md9
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    local.get $7
    f32.sub
    f32.add
    local.set $7
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    local.get $0
    f32.load $0 offset=28
    local.get $7
    f32.mul
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.sub
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $0
    i32.load $0 offset=156
    local.get $2
    global.get $assembly/gen/daverb/md11
    i32.and
    local.get $0
    i32.load $0 offset=152
    local.get $5
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    f32.load $0 offset=36
    local.get $0
    i32.load $0 offset=152
    local.get $2
    global.get $assembly/gen/daverb/md10
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $8
    local.get $0
    i32.load $0 offset=4
    i32.load $0 offset=4
    i32.add
    local.set $8
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 394
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 4406
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 2834
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 2957
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 2948
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 277
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 1579
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 523
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    local.get $0
    i32.load $0 offset=132
    global.get $assembly/gen/daverb/md5
    local.get $2
    i32.const 5374
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=136
    global.get $assembly/gen/daverb/md6
    local.get $2
    i32.const 1819
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=140
    global.get $assembly/gen/daverb/md7
    local.get $2
    i32.const 3960
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.add
    local.get $0
    i32.load $0 offset=148
    global.get $assembly/gen/daverb/md9
    local.get $2
    i32.const 3128
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=152
    global.get $assembly/gen/daverb/md10
    local.get $2
    i32.const 496
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    local.get $0
    i32.load $0 offset=156
    global.get $assembly/gen/daverb/md11
    local.get $2
    i32.const 179
    i32.sub
    i32.and
    call $~lib/staticarray/StaticArray<f32>#__get
    f32.sub
    f32.add
    f32.const 0.5
    f32.mul
    f32.store $0
    local.get $9
    i32.const 4
    i32.add
    local.set $9
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $2
  local.get $10
  i32.and
  i32.store $0 offset=160
  local.get $0
  i32.const 0
  i32.store $0 offset=180
  local.get $0
  local.get $4
  f32.store $0 offset=168
  local.get $0
  local.get $6
  f32.store $0 offset=172
  local.get $0
  local.get $7
  f32.store $0 offset=176
 )
 (func $assembly/gen/dc/Dc#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 i32)
  (local $7 i32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  local.get $0
  f32.load $0 offset=8
  local.set $5
  local.get $0
  f32.load $0 offset=16
  local.set $4
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $6
  local.get $1
  i32.const 2
  i32.shl
  local.tee $7
  local.get $0
  i32.load $0 offset=12
  i32.add
  local.set $2
  local.get $3
  local.get $7
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_u
   if
    local.get $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.tee $8
    local.get $4
    f32.sub
    local.tee $9
    f32.abs
    local.set $10
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $4
    local.get $9
    local.get $10
    local.get $5
    f32.sub
    f32.mul
    f32.add
    local.get $8
    local.get $5
    local.get $10
    f32.lt
    select
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $4
  f32.store $0 offset=16
 )
 (func $assembly/gen/dclip/Dclip#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $3
    local.get $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $4
    f32.const 0
    local.get $4
    f32.const 0
    f32.gt
    select
    f32.store $0
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $2
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/dclipexp/Dclipexp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 f32)
  (local $6 i32)
  local.get $0
  f32.load $0 offset=8
  local.set $5
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $6
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=12
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_u
   if
    local.get $3
    local.get $0
    f32.load $0
    f64.promote_f32
    local.get $5
    f64.promote_f32
    local.tee $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    f64.promote_f32
    local.get $4
    f64.div
    call $~lib/math/NativeMath.exp
    f64.const -1
    f64.add
    f32.demote_f64
    f32.store $0
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $2
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/dcliplin/Dcliplin#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 i32)
  (local $7 f32)
  local.get $0
  f32.load $0 offset=8
  local.set $4
  local.get $0
  f32.load $0 offset=12
  local.set $5
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $6
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=16
  i32.add
  local.set $0
  local.get $2
  local.get $3
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $6
   i32.lt_u
   if
    local.get $3
    local.get $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    local.get $0
    i32.const 4
    i32.add
    local.tee $0
    f32.load $0
    local.tee $7
    local.get $4
    f32.gt
    if (result f32)
     local.get $4
     local.get $7
     local.get $4
     f32.sub
     local.get $5
     f32.mul
     f32.add
    else
     local.get $7
     local.get $4
     f32.add
     local.get $5
     f32.mul
     local.get $4
     f32.sub
     local.get $7
     local.get $7
     local.get $4
     f32.neg
     f32.lt
     select
    end
    f32.store $0
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $2
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/delay/Delay#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f32)
  (local $9 i32)
  (local $10 f32)
  (local $11 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $9
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=16
  i32.add
  local.set $5
  local.get $2
  local.get $3
  i32.add
  local.set $3
  local.get $0
  i32.load $0 offset=24
  local.set $6
  local.get $0
  i32.load $0 offset=28
  local.set $2
  local.get $0
  f32.load $0 offset=12
  local.set $7
  local.get $0
  f32.load $0 offset=32
  local.set $4
  local.get $0
  f32.load $0 offset=36
  local.set $8
  loop $for-loop|0
   local.get $1
   local.get $9
   i32.lt_u
   if
    local.get $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    f32.convert_i32_u
    local.get $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $10
    local.get $0
    i32.load $0 offset=20
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $11
    local.get $0
    i32.load $0 offset=20
    local.get $2
    local.get $10
    local.get $11
    local.get $7
    f32.mul
    f32.add
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $11
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.set $5
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.set $2
    local.get $4
    local.get $8
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.set $4
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $2
  i32.store $0 offset=28
  local.get $0
  local.get $4
  f32.store $0 offset=32
 )
 (func $assembly/gen/diode/Diode#get:_b (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=60
 )
 (func $assembly/gen/diode/Diode#get:_b2 (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=64
 )
 (func $assembly/gen/diode/Diode#get:_c (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=68
 )
 (func $assembly/gen/diode/Diode#get:_g (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=72
 )
 (func $assembly/gen/diode/Diode#get:_g0 (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=76
 )
 (func $assembly/gen/diode/Diode#get:_ainv (param $0 i32) (result f32)
  local.get $0
  f32.load $0 offset=88
 )
 (func $assembly/gen/diode/soft (param $0 f32) (param $1 f32) (result f32)
  local.get $0
  f32.const 1
  local.get $1
  f32.div
  local.get $0
  f32.abs
  f32.add
  f32.div
 )
 (func $assembly/gen/diode/Diode#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  (local $10 f32)
  (local $11 f32)
  (local $12 f32)
  (local $13 f32)
  (local $14 f32)
  (local $15 f32)
  (local $16 f32)
  (local $17 f32)
  (local $18 f32)
  (local $19 f32)
  (local $20 f32)
  (local $21 f32)
  (local $22 i32)
  (local $23 i32)
  (local $24 f32)
  (local $25 f32)
  (local $26 f32)
  (local $27 f32)
  (local $28 f32)
  (local $29 f32)
  local.get $0
  f32.load $0 offset=48
  local.set $17
  local.get $0
  f32.load $0 offset=52
  local.set $5
  local.get $0
  f32.load $0 offset=56
  local.set $6
  local.get $0
  f32.load $0 offset=60
  local.set $7
  local.get $0
  f32.load $0 offset=64
  local.set $14
  local.get $0
  f32.load $0 offset=68
  local.set $18
  local.get $0
  f32.load $0 offset=72
  local.set $12
  local.get $0
  f32.load $0 offset=76
  local.set $19
  local.get $0
  f32.load $0 offset=80
  local.set $20
  local.get $0
  f32.load $0 offset=84
  local.set $15
  local.get $0
  f32.load $0 offset=88
  local.set $13
  local.get $0
  f32.load $0 offset=92
  local.set $16
  local.get $0
  f32.load $0 offset=16
  local.set $21
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $22
  local.get $1
  i32.const 2
  i32.shl
  local.tee $23
  local.get $0
  i32.load $0 offset=24
  i32.add
  local.set $2
  local.get $3
  local.get $23
  i32.add
  local.set $3
  local.get $0
  f32.load $0 offset=28
  local.set $11
  local.get $0
  f32.load $0 offset=32
  local.set $8
  local.get $0
  f32.load $0 offset=36
  local.set $9
  local.get $0
  f32.load $0 offset=40
  local.set $10
  local.get $0
  f32.load $0 offset=44
  local.set $4
  loop $for-loop|0
   local.get $1
   local.get $22
   i32.lt_u
   if
    local.get $7
    local.get $7
    local.get $7
    local.get $19
    local.get $2
    f32.load $0
    local.tee $24
    local.get $16
    local.get $12
    local.get $24
    f32.mul
    local.get $15
    local.get $6
    local.get $5
    f32.mul
    local.get $11
    f32.mul
    local.get $6
    local.get $7
    f32.mul
    local.get $8
    f32.mul
    f32.add
    local.get $9
    local.get $14
    local.get $6
    local.get $6
    f32.add
    f32.sub
    f32.mul
    local.get $5
    f32.mul
    f32.add
    local.get $10
    local.get $14
    local.get $6
    f32.const 3
    f32.mul
    f32.sub
    f32.mul
    local.get $7
    f32.mul
    f32.add
    local.get $18
    f32.mul
    local.tee $25
    f32.mul
    local.get $4
    f32.sub
    local.tee $24
    f32.add
    local.get $12
    local.get $16
    f32.mul
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    local.tee $4
    f32.const 1
    local.get $21
    f32.div
    local.get $4
    f32.abs
    f32.add
    f32.div
    local.tee $28
    f32.mul
    local.get $25
    f32.add
    local.tee $25
    f32.mul
    local.get $10
    f32.sub
    local.get $13
    f32.mul
    local.tee $26
    f32.mul
    local.get $5
    local.get $25
    f32.mul
    f32.sub
    local.get $9
    f32.sub
    local.get $13
    f32.mul
    local.tee $27
    f32.mul
    local.get $5
    local.get $26
    f32.mul
    f32.sub
    local.get $8
    f32.sub
    local.get $13
    f32.mul
    local.set $29
    local.get $11
    local.get $5
    f32.const 4
    f32.mul
    local.get $28
    local.get $29
    f32.sub
    local.get $27
    f32.add
    f32.mul
    f32.add
    local.set $11
    local.get $8
    local.get $5
    local.get $5
    f32.add
    local.tee $4
    local.get $29
    local.get $27
    local.get $27
    f32.add
    f32.sub
    local.get $26
    f32.add
    f32.mul
    f32.add
    local.set $8
    local.get $9
    local.get $4
    local.get $27
    local.get $26
    local.get $26
    f32.add
    f32.sub
    local.get $25
    f32.add
    f32.mul
    f32.add
    local.set $9
    local.get $10
    local.get $4
    local.get $26
    local.get $25
    local.get $25
    f32.add
    f32.sub
    f32.mul
    f32.add
    local.set $10
    local.get $15
    local.get $25
    f32.mul
    local.get $20
    local.get $12
    local.get $28
    f32.mul
    local.get $24
    f32.add
    f32.mul
    f32.add
    local.set $4
    local.get $3
    local.get $17
    local.get $25
    f32.mul
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $11
  f32.store $0 offset=28
  local.get $0
  local.get $8
  f32.store $0 offset=32
  local.get $0
  local.get $9
  f32.store $0 offset=36
  local.get $0
  local.get $10
  f32.store $0 offset=40
  local.get $0
  local.get $4
  f32.store $0 offset=44
 )
 (func $assembly/gen/lp/Lp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 f32)
  (local $6 f32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  f32.load $0 offset=16
  local.set $5
  local.get $0
  f32.load $0 offset=20
  local.set $4
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $7
  local.get $1
  i32.const 2
  i32.shl
  local.tee $8
  local.get $0
  i32.load $0 offset=12
  i32.add
  local.set $2
  local.get $3
  local.get $8
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $7
   i32.lt_u
   if
    local.get $3
    local.get $5
    local.get $2
    f32.load $0
    f32.mul
    f32.const 1
    local.get $5
    f32.sub
    local.tee $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $5
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f32.mul
    local.get $6
    local.get $4
    f32.mul
    f32.add
    local.tee $4
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $4
  f32.store $0 offset=20
 )
 (func $assembly/gen/moog/tanha (param $0 f32) (result f32)
  local.get $0
  local.get $0
  local.get $0
  f32.mul
  local.tee $0
  local.get $0
  f32.const 5
  f32.div
  f32.const 3
  f32.add
  f32.div
  f32.const 1
  f32.add
  f32.div
 )
 (func $assembly/gen/mhp/Mhp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    local.tee $4
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.tee $9
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $7
    local.get $4
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $8
    local.get $0
    local.get $7
    local.get $9
    local.get $4
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=44
    f32.const 3
    f32.mul
    f32.sub
    local.get $0
    f32.load $0 offset=48
    f32.const 2
    f32.mul
    f32.add
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/mlp/Mlp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 f32)
  (local $9 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    local.tee $4
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.tee $9
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $7
    local.get $4
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $8
    local.get $0
    local.get $7
    local.get $9
    local.get $4
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=60
    f32.mul
    f32.sub
    f32.store $0 offset=40
    local.get $0
    f32.load $0 offset=40
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    f32.load $0 offset=12
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=12
    local.get $0
    f32.load $0 offset=16
    local.get $4
    f32.add
    local.tee $4
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $7
    local.get $7
    f32.mul
    local.set $8
    local.get $0
    local.get $4
    local.get $0
    f32.load $0 offset=64
    local.get $7
    local.get $8
    local.get $8
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=16
    local.get $0
    local.get $0
    f32.load $0 offset=20
    local.get $4
    f32.add
    f32.store $0 offset=44
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=44
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    local.tee $4
    f32.sub
    f32.store $0 offset=20
    local.get $0
    local.get $0
    f32.load $0 offset=24
    local.get $4
    f32.add
    f32.store $0 offset=48
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=36
    f32.div
    local.tee $4
    local.get $4
    f32.mul
    local.set $7
    local.get $0
    local.get $0
    f32.load $0 offset=48
    local.get $0
    f32.load $0 offset=64
    local.get $4
    local.get $7
    local.get $7
    f32.const 5
    f32.div
    f32.const 3
    f32.add
    f32.div
    f32.const 1
    f32.add
    f32.div
    f32.mul
    f32.sub
    f32.store $0 offset=24
    local.get $0
    local.get $0
    f32.load $0 offset=48
    f32.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f32.load $0 offset=32
    local.get $0
    f32.load $0 offset=68
    f32.mul
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/svf/Svf#get:_c2 (param $0 i32) (result f64)
  local.get $0
  f64.load $0 offset=24
 )
 (func $assembly/gen/sap/Sap#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/sbp/Sbp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=64
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/shp/Shp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/slp/Slp#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=72
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/sno/Sno#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/spk/Spk#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $0
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.store $0 offset=56
    local.get $0
    local.get $4
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=80
    local.get $0
    local.get $0
    f64.load $0 offset=32
    local.get $0
    f64.load $0 offset=16
    f64.mul
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=64
    local.get $0
    local.get $0
    f64.load $0 offset=24
    local.get $0
    f64.load $0 offset=40
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=48
    local.get $0
    f64.load $0 offset=80
    f64.mul
    f64.add
    f64.store $0 offset=72
    local.get $0
    local.get $0
    f64.load $0 offset=64
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=16
    f64.sub
    f64.store $0 offset=16
    local.get $0
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    local.get $0
    f64.load $0 offset=24
    f64.sub
    f64.store $0 offset=24
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=64
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=72
    f64.const 2
    f64.mul
    f64.sub
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/tanh/Tanh#get:_gainv (param $0 i32) (result v128)
  local.get $0
  v128.load $0 offset=16
 )
 (func $assembly/gen/tanh/Tanh#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 v128)
  (local $5 i32)
  (local $6 v128)
  (local $7 v128)
  local.get $0
  v128.load $0 offset=16
  local.set $4
  local.get $1
  i32.const 2
  i32.shl
  local.tee $5
  local.get $0
  i32.load $0 offset=32
  i32.add
  local.set $0
  local.get $3
  local.get $5
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.load $0
    local.get $4
    f32x4.mul
    local.tee $6
    local.get $6
    f32x4.mul
    local.set $7
    local.get $3
    i32.const 16
    i32.add
    local.tee $3
    local.get $6
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    local.get $7
    v128.const i32x4 0x40400000 0x40400000 0x40400000 0x40400000
    local.get $7
    v128.const i32x4 0x40a00000 0x40a00000 0x40a00000 0x40a00000
    local.get $7
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    f32x4.add
    f32x4.div
    v128.const i32x4 0x3f800000 0x3f800000 0x3f800000 0x3f800000
    f32x4.min
    v128.const i32x4 0xbf800000 0xbf800000 0xbf800000 0xbf800000
    f32x4.max
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $0
    local.get $3
    i32.const 16
    i32.add
    local.set $3
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/tap/Tap#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  (local $9 f32)
  (local $10 f32)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $8
  local.get $1
  i32.const 2
  i32.shl
  local.tee $2
  local.get $0
  i32.load $0 offset=12
  i32.add
  local.set $5
  local.get $2
  local.get $3
  i32.add
  local.set $3
  local.get $0
  i32.load $0 offset=20
  local.set $6
  local.get $0
  i32.load $0 offset=24
  local.set $2
  local.get $0
  f32.load $0 offset=28
  local.set $4
  local.get $0
  f32.load $0 offset=32
  local.set $7
  loop $for-loop|0
   local.get $1
   local.get $8
   i32.lt_u
   if
    local.get $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    f32.convert_i32_u
    local.get $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.tee $5
    f32.load $0
    local.set $9
    local.get $0
    i32.load $0 offset=16
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.tee $2
    f32.convert_i32_u
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.tee $4
    f32.sub
    local.get $6
    call $assembly/util/cubic
    local.set $10
    local.get $0
    i32.load $0 offset=16
    local.get $2
    local.get $9
    call $~lib/staticarray/StaticArray<f32>#__set
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $10
    f32.store $0
    local.get $5
    i32.const 4
    i32.add
    local.set $5
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $2
    i32.const 1
    i32.add
    local.get $6
    i32.and
    local.set $2
    local.get $4
    local.get $7
    local.get $4
    f32.sub
    f32.const 7.999999797903001e-04
    f32.mul
    f32.add
    local.set $4
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  local.get $2
  i32.store $0 offset=24
  local.get $0
  local.get $4
  f32.store $0 offset=28
 )
 (func $assembly/gen/zero/Zero#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $3
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $2
   i32.lt_u
   if
    local.get $3
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $3
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    v128.const i32x4 0x00000000 0x00000000 0x00000000 0x00000000
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.set $3
    local.get $1
    i32.const -64
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/biquad/Biquad#_audio (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 f64)
  (local $5 i32)
  (local $6 i32)
  (local $7 f64)
  (local $8 f64)
  local.get $1
  local.get $2
  local.get $1
  i32.sub
  i32.add
  local.set $5
  local.get $1
  i32.const 2
  i32.shl
  local.tee $6
  local.get $0
  i32.load $0 offset=8
  i32.add
  local.set $2
  local.get $3
  local.get $6
  i32.add
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $5
   i32.lt_u
   if
    local.get $0
    f64.load $0 offset=72
    local.get $2
    f32.load $0
    f64.promote_f32
    local.tee $7
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    local.tee $4
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $8
    local.get $0
    local.get $4
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $7
    f64.store $0 offset=16
    local.get $0
    local.get $8
    f64.store $0 offset=32
    local.get $3
    local.get $8
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $0
    f64.load $0 offset=72
    local.get $2
    i32.const 4
    i32.add
    local.tee $2
    f32.load $0
    f64.promote_f32
    local.tee $4
    f64.mul
    local.get $0
    f64.load $0 offset=80
    local.get $0
    f64.load $0 offset=16
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=88
    local.get $0
    f64.load $0 offset=24
    f64.mul
    f64.add
    local.get $0
    f64.load $0 offset=56
    local.get $0
    f64.load $0 offset=32
    f64.mul
    f64.sub
    local.get $0
    f64.load $0 offset=64
    local.get $0
    f64.load $0 offset=40
    f64.mul
    f64.sub
    local.set $7
    local.get $0
    local.get $0
    f64.load $0 offset=16
    f64.store $0 offset=24
    local.get $0
    local.get $0
    f64.load $0 offset=32
    f64.store $0 offset=40
    local.get $0
    local.get $4
    f64.store $0 offset=16
    local.get $0
    local.get $7
    f64.store $0 offset=32
    local.get $3
    i32.const 4
    i32.add
    local.tee $3
    local.get $7
    f32.demote_f64
    f32.store $0
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    local.get $1
    i32.const 16
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $assembly/gen/osc/Osc#get:_table (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=8
  i32.load $0 offset=12
 )
 (func $assembly/gen/osc/Osc#get:_mask (param $0 i32) (result i32)
  local.get $0
  i32.load $0 offset=4
  i32.load $0 offset=8
  i32.load $0 offset=4
 )
 (func $assembly/core/wavetable/Wavetable#read (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32) (param $7 i32) (param $8 i32) (result i32)
  (local $9 f32)
  (local $10 v128)
  local.get $8
  local.get $6
  i32.const 2
  i32.shl
  i32.add
  local.tee $0
  local.get $7
  local.get $6
  i32.sub
  i32.const 2
  i32.shl
  i32.add
  local.set $6
  loop $while-continue|0
   local.get $0
   local.get $6
   i32.lt_u
   if
    local.get $0
    local.get $10
    local.get $1
    local.get $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 0
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 1
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 2
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 3
    local.tee $10
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    local.get $10
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 0
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 1
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 2
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 3
    local.tee $10
    v128.store $0
    local.get $0
    i32.const 16
    i32.add
    local.tee $0
    local.get $10
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 0
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    local.get $2
    i32.and
    i32.add
    local.tee $8
    f32.load $0
    local.tee $9
    local.get $7
    i32.const 8388480
    i32.and
    i32.const 7
    i32.shl
    i32.const 1065353216
    i32.or
    f32.reinterpret_i32
    f32.const -1
    f32.add
    local.get $8
    f32.load $0 offset=4
    local.get $9
    f32.sub
    f32.mul
    f32.add
    f32x4.replace_lane 1
    local.get $1
    local.get $3
    local.get $5
    i32.add
    local.tee $3
    local.get $4
    i32.add
    local.tee $7
    i32.const 14
    i32.shr_u
    i32.and