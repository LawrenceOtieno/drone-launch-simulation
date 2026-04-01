#!/bin/bash
# Drone Launch Simulation - Complete FFmpeg Commands

echo "=== Drone Launch Video Processing Script ==="
echo "This script contains all the commands used to process drone launch videos"

# 1. Basic video from frames
echo "
# 1. Create basic video from PNG frames:"
echo "ffmpeg -framerate 30 -pattern_type glob -i 'frames/clean_frames/frame_*.png' -c:v libx264 -pix_fmt yuv420p basic_video.mp4"

# 2. Slow motion
echo "
# 2. Create slow motion version:"
echo "ffmpeg -i basic_video.mp4 -filter:v \"setpts=2.0*PTS\" -c:v libx264 -pix_fmt yuv420p slowmo_video.mp4"

# 3. Smooth motion interpolation
echo "
# 3. Create smooth motion version:"
echo "ffmpeg -i basic_video.mp4 -filter:v \"minterpolate=fps=60\" -c:v libx264 -pix_fmt yuv420p smooth_video.mp4"

# 4. Smooth slow motion combined
echo "
# 4. Create smooth slow motion video:"
echo "ffmpeg -i basic_video.mp4 -filter:v \"setpts=2.0*PTS,minterpolate=fps=60\" -c:v libx264 -pix_fmt yuv420p smooth_slowmo.mp4"

# 5. Launch emphasized version
echo "
# 5. Create launch emphasized video:"
echo "ffmpeg -i basic_video.mp4 -t 0.66 -filter:v \"setpts=3.0*PTS,minterpolate=fps=60\" -c:v libx264 -pix_fmt yuv420p launch_emphasized.mp4"

# 6. Cinematic version
echo "
# 6. Create cinematic launch video:"
echo "ffmpeg -i basic_video.mp4 -filter:v \"setpts='if(lt(PTS,0.66), 4*PTS, PTS)',minterpolate=fps=120,scale=1920:1080\" -c:v libx264 -pix_fmt yuv420p cinematic_launch.mp4"

# 7. 1-minute loop
echo "
# 7. Create 1-minute loop:"
echo "ffmpeg -stream_loop 4 -i basic_video.mp4 -filter:v \"setpts=0.5*PTS,minterpolate=fps=60\" -t 60 -c:v libx264 -pix_fmt yuv420p one_minute_loop.mp4"

echo "
=== All commands listed successfully ==="
