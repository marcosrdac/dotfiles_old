#!/usr/bin/env sh

## pra facilitar processos de debug
#set "2020/3/24"
#set "2020/3/24" "2021/4/2"
#set "2020/2/24" "2020/3/3"

if [ $# -eq 0 ]
then
  echo Manual de uso:  
  echo
  echo Primeiro argumento: data inicial
  echo   formato: 2019/2/5
  echo 
  echo Segundo argumento: data final
  echo   formato: 2019/2/5
  echo 
  echo Para baixar apenas um dia, não usar segundo argumento.
  exit 1
fi
[ $# -eq 1 ] && set "$1" "$1"


 diasmes ()
{
  case $2 in
    1|3|5|7|8|10|12) lim=31 ;;
    2)
      # checa se o ano eh bissexto
      [ $(echo $1 % 4 | bc) -eq 0  -a $(echo $1 % 100 | bc) -ne 0  -a $(echo $1 % 400 | bc) -ne 0 ] &&
                    lim=29 || lim=28 ;;
    *) lim=30 ;;
  esac
  echo $lim
}


tmp1=$1
ano1=$(( ${tmp1%%'/'*} ))
dia1=$(( ${tmp1##*'/'} ))
tmp1=${tmp1%'/'*}
mes1=$(( ${tmp1#*'/'} ))

tmp2=$2
ano2=$(( ${tmp2%%'/'*} ))
dia2=$(( ${tmp2##*'/'} ))
tmp2=${tmp2%'/'*}
mes2=$(( ${tmp2#*'/'} ))

unset tmp1 tmp2
#echo $ano1 $mes1 $dia1
#echo $ano2 $mes2 $dia2


# programa
for (( ano=$ano1; ano <= $ano2; ano++ ))
do
  [ $ano -eq $ano1 ] && 
    primeiromes=$mes1 || primeiromes=1
  [ $ano -eq $ano2 ] && 
    ultimomes=$mes2 || ultimomes=12

  for (( mes=$primeiromes; mes <= $ultimomes; mes++ ))
  do
    if [ $ano -eq $ano1 ] && [ $mes -eq $mes1 ]
    then
      primeirodia=$dia1
    else
      primeirodia=1
    fi
    if [ $ano -eq $ano2 ] && [ $mes -eq $mes2 ]
    then
      ultimodia=$dia2
    else
      ultimodia=$(diasmes $ano $mes)
    fi

    for (( dia=$primeirodia; dia <= $ultimodia; dia++ ))
    do
      echo
      echo
      echo BAIXANDO DATA: $dia/$mes/$ano
      echo
      #python gen_hycom.py $ano $mes $dia
    done
  done
done
