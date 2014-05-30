#!/bin/bash
# This is a comment

###################################
# FONKSIYONLAR ####################
create_dir ()
{
	dizinadi=$1
	if [[ ! -d $dizinadi ]]; then
		`mkdir $dizinadi`
	fi
}

create_file ()
{
	dosyaadi=$1
	`touch $dosyaadi`
}

# ekrana ya da bir log dosyasına log yazmak
log ()
{

	#if [[ ${#$2} -eq 0 ]]; then
		if [[ ! -f "log.txt" ]]; then
			create_file "log.txt"
		fi
		file_log "$1"
	#fi
}

file_log ()
{
	echo $1 >> log.txt
}


###################################
if [[ -f "log.txt" ]]; then
	echo `rm log.txt`
fi

echo "Dizin seçin ve ENTER a basın:" 
read selected_dir

log "secilen dizin:"$selected_dir

if [ ${#selected_dir} -eq 0 ]; then
	echo "Dizin adi girmelisiniz!"
	exit
	#SELECTED_ROOT_DIR="/s/cgi-bin/rc4/"
else
	SELECTED_ROOT_DIR=$selected_dir
fi

last_char_index=`expr ${#SELECTED_ROOT_DIR} - 1`

if [ "${SELECTED_ROOT_DIR:$last_char_index:1}" != "/" ];then
	SELECTED_ROOT_DIR=$SELECTED_ROOT_DIR"/"
fi

echo "Bu dizindeki tüm alt dizinler olustuluralacak, dosyalar bos olarak acilacak:"$SELECTED_ROOT_DIR

FILE_LIST="`find $SELECTED_ROOT_DIR`"

for file in ${FILE_LIST}
do
	
	#temiz_file=`echo $file | tr '"/cgi/"' '" "'`
	temiz_file=`echo $file | awk -F$SELECTED_ROOT_DIR '{print $2}'`

	#elimizde dosya ya da dizin adı kaldı mı?
	if [ ${#temiz_file} -eq 0 ]; then
	 	log "dosya adi: ${temiz_file} Bu dosyayi es gec. dosya adi yok"
	else
		# dizin ya da dosya adı varsa elimizde...
		file_arr=(`echo ${temiz_file} | tr '/' ' '`)
		log "bu path ayristiriliyor:"$temiz_file " dizi boyutu:"${#file_arr[*]} 

		#tek boyutluysa demekki elimizde sadece dosya adı yada dizin adı var. kök dizinde
		if [[ ${#file_arr[*]} -eq 1 ]]; then
			if [[ -d $file ]]; then
				create_dir ${file_arr[0]}
				log "dizin acildi:"${file_arr[0]}
			else
				create_file ${file_arr[0]}
				log "dosya acildi:"${file_arr[0]}
			fi 
		else
			#slash adedince dön
			resource_dir=$SELECTED_ROOT_DIR
			target_dir=''
			for (( i = 0; i < ${#file_arr[*]} ; i++ )); do

				resource_dir=$resource_dir"/"${file_arr[$i]}
##				echo "-->"$target_dir"<-->>>>"${#target_dir}
				if [[ ${#target_dir} -eq 0 ]]; then
					slash_str=''
				else
					slash_str="/"
				fi
				target_dir=$target_dir$slash_str${file_arr[$i]}

				log "kaynak dizini:"$resource_dir 
				log "hedef dizini:"$target_dir 

				#kaynakta bu dizinse dizin olustur değilse dosya
				if [[ -d $resource_dir ]]; then
					create_dir $target_dir
					log "dizin acildi:"${file_arr[$i]}" bu path kullanildi :"$target_dir
				else
					create_file $target_dir
					log "dosya acildi:"${file_arr[$i]}" bu path kullanildi :"$target_dir
				fi

				log "dizi elemani parse bitti"
				log " "
			done			
		fi
	fi 

	log "bu path bitti:" $file
	echo "biten path:"$file
	log "------------------------"
done

