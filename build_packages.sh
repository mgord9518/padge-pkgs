#!/bin/sh

out_dir="build"

mkdir -p "$out_dir"

cd pkgs
for file in *; do
    out_path="../../$out_dir/$file.tar.zst"

    cd "$file"

    tar --zstd -cf "$out_path" *

    # 1220 = multihash code for sha256
    echo "Built package 1220$(sha256sum $out_path)"

    cd ..
done

cd ..
