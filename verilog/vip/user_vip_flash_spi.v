

`define USER_VIP \
   `ifdef ENABLE_SDF \
   `define DISABLE_SDF \
   initial begin \
      $sdf_annotate({`USER_PROJECT_ROOT,"/signoff/frigate_core/primetime/sdf/",`SDF_POSTFIX,"/frigate_core.", `CORNER,".sdf"}, uut.frigate_core ,,{`RUN_PATH,"/sim/",`TAG,"/",`FTESTNAME,"/openframe_sdf.log"},`ifdef MAX_SDF "MAXIMUM" `else "MINIMUM" `endif ); \
   end  \
   `endif // ENABLE_SDF
