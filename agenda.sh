BD=.agendaDB.txt
 # Color snippets

white="\033[1;37m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
purple="\033[1;35m"
cyan="\033[1;36m"
blue="\033[1;34m"
nc="\033[00m"

info="${cyan}[${white}+${cyan}] ${yellow}"
ask="${cyan}[${white}?${cyan}] ${purple}"
error="${cyan}[${white}!${cyan}] ${red}"
success="${cyan}[${white}√${cyan}] ${green}"
re='^[0-9]+$'

barra(){
        clear
echo -e "${cyan}╭━━━╮╭━━━╮╭━━━╮╭━╮╱╭╮╭━━━╮╭━━━╮
${red}┃╭━╮┃┃╭━╮┃┃╭━━╯┃┃╰╮┃┃╰╮╭╮┃┃╭━╮┃
${yellow}┃┃╱┃┃┃┃╱╰╯┃╰━━╮┃╭╮╰╯┃╱┃┃┃┃┃┃╱┃┃
${blue}┃╰━╯┃┃┃╭━╮┃╭━━╯┃┃╰╮┃┃╱┃┃┃┃┃╰━╯┃
${purple}┃╭━╮┃┃╰┻━┃┃╰━━╮┃┃╱┃┃┃╭╯╰╯┃┃╭━╮┃
${green}╰╯╱╰╯╰━━━╯╰━━━╯╰╯╱╰━╯╰━━━╯╰╯╱╰╯
${cyan}╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱
${blue}╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱
${green}Iago-Linux/Agenda/${red}$1${nc}"
}

pausa(){
        echo " "
        read -n 1 -p "Presione uma tecla para continuar..."
}

cancelar(){
        echo "Operacão cancelada"
}





Cadastrar(){
barra "Cadastrar pessoa"
             echo " "
             read -p "Digite o nome:" Nome
             read -p "Digite a idade:" Idade
             read -p "Digite o Telefone:" Telefone
             echo  "Nome:$Nome , Idade:$Idade , Telefone:$Telefone" >> ${BD}
}


Buscar(){
barra "Buscar"
             read -p "Digite o nome que deseja buscar:" Nome
             echo " "
             cat $BD | grep $Nome

}
Listar(){
barra "Listar"
            echo " "
             cat $BD
}




Excluir(){
barra "Excluir"
        read -p "Digite o nome que deseja excluir: " nb
        if [ -z $nb ]; then
        cancelar
        else
        cat $BD | grep -v "${nb}" > ${BD}2 && mv ${BD}2  $BD

        echo " "
        echo "Pessoa excluida com sucesso!"
        fi
        }

menu(){
barra "Menu principal"
        echo " "
        echo -e "[1] -${cyan}Cadastrar pessoa na agenda${nc}"
        echo -e "[2] -${cyan}Buscar pessoa pelo nome${nc}"
        echo -e "[3] -${cyan}Listar todos da agenda${nc}"
        echo -e "[4] -${cyan}Excluir pessoa da agenda${nc}"
        echo -e "[0] -${cyan}Sair${nc}"
        echo  " "
        read  -n 1 -p "[+] O que deseja fazer:" s
        case $s in
        1) Cadastrar ;;
        2) Buscar ;;
        3) Listar ;;
        4) Excluir  ;;
        0) clear
          exit;;
        esac


pausa
menu
}

menu


