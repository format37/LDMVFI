python3 interpolate_yuv.py \
--net LDMVFI \
--config configs/ldm/ldmvfi-vqflow-f32-c256-concat_max.yaml \
--ckpt model/ldmvfi-vqflow-f32-c256-concat_max.ckpt \
--input_yuv data/video.yuv \
--size 300x200 \
--out_fps 30 \
--out_dir output \
--use_ddim
