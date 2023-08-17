# echo "sudo apt-get install mplayer"
# echo "http://trace.eas.asu.edu/yuv/"
# mplayer -demuxer rawvideo -rawvideo w=176:h=144:format=i420 video.yuv
mplayer -demuxer rawvideo -rawvideo w=300:h=200:format=i420 video.yuv
