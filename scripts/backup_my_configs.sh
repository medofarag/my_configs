#!/run/current-system/sw/bin/bash
cp -r /home/medo/.config/niri /home/medo/my_configs/
cp -r /home/medo/.config/noctalia /home/medo/my_configs/
cp -r /home/medo/.config/fish /home/medo/my_configs/
cp -r /home/medo/.config/bash /home/medo/my_configs/
cp -r /home/medo/.config/scripts /home/medo/my_configs/
cp -r /home/medo/.config/tmux /home/medo/my_configs/
cp -r /home/medo/.config/kastsrc /home/medo/my_configs/
cp -r /home/medo/.config/sway /home/medo/my_configs/
cp -r /home/medo/.config/waybar /home/medo/my_configs/
cp -r /home/medo/.config/fuzzel /home/medo/my_configs/
cp -r /home/medo/.config/fnott /home/medo/my_configs/
cp -r /home/medo/.config/mpv /home/medo/my_configs/
cp -r /home/medo/.config/omf /home/medo/my_configs/
cp -r /home/medo/scripts /home/medo/my_configs/
cp -r /home/medo/.config/home-manager /home/medo/my_configs/
cp /home/medo/.bashrc /home/medo/my_configs/
cp /home/medo/.gitconfig /home/medo/my_configs/

rm -rf /home/medo/my_configs/nixos
cp -r /home/medo/.nixos /home/medo/my_configs/nixos

cd ~/my_configs/
git add .
git commit -m "done"
git push origin main
