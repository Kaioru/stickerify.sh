for f in *.png; do
convert $f -bordercolor none -border 60 \
\( -clone 0 -alpha extract -morphology edgeout disk:30 \) \
\( -clone 1 -fill white -opaque white -fill white -opaque black \) \
+swap -compose over -composite -trim +repage $f
done
echo "Done bordering"

mogrify *.png -bordercolor none -border 16 *.png

mogrify *.png -resize 512x512 *.png
echo "Done resizing"

pngquant *.png
echo "Done optimising"
