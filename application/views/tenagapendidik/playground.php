<?php
echo "<pre>";
$pengguna = $this->model->readS('pengguna')->result();
foreach ($pengguna as $key => $value) {
	$nama = $value->nama;
	$explode = explode(" ", $nama);
	$alias 	= '';
	$temp_alias = '';
	foreach ($explode as $keyA => $valueA) {
		$temp_alias .= $valueA." ";
		if (strlen($temp_alias) <= 20) {
			$alias .= $valueA;
			if ($keyA !== (sizeof($explode)-1)) {
				$alias .=" ";
			}
		}else{
			break;
		}
	}
	if (strlen($nama) !== strlen($alias) AND strlen($alias) < 20) {
		$alias .= substr($explode[$keyA], 0,1);
	}
	$this->model->update('pengguna',array('id'=>$value->id),array('alias'=>$alias));
}