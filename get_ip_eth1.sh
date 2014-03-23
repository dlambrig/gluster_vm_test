hostname=$1
array=(${hostname//_/ })
host="${array[0]}"
vm=${array[1]}

case "$host" in

gprfs037) 
IP_D3=1
;;

gprfs038) 
IP_D3=15
;;

gprfs039) 
IP_D3=30
;;

gprfs040) 
IP_D3=45
;;

gprfs021) 
IP_D3=60
;;

gprfs022) 
IP_D3=75
;;

gprfs023) 
IP_D3=90
;;

gprfs024) 
IP_D3=105
;;
*)
IP_D3=150
;;

esac

echo 172.17.50.$((IP_D3+vm))
