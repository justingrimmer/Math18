INPUT=mc1_18.pdf; OUTPUT=2_mc1_18.pdf; (pdftk ${INPUT} dump_data | egrep "PageLabelNewIndex" | sed
's/[^0-9]//g' | sed '1d' | sed -r 's/(.*)/echo $((\1-1))/ge') | tr '\n' ' ' | xargs -I{}
echo "pdftk \"${INPUT}\" cat {} end output \"${OUTPUT}\"" | zsh
